package com.kitri.dao.list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import com.kitri.dto.BoardDto;
import com.kitri.dto.CommentDto;
import com.kitri.dto.UserDto;
import com.kitri.util.DBClose;
import com.kitri.util.DBConnection;

public class ListDao {
	
//	#### singleTone ####
	private static ListDao listDao;
	static {
		listDao = new ListDao();
	}
	private ListDao() {}
	public static ListDao getListDao() {
		return listDao;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	

	
//---------------------------------------------------------------------------------------------------	#### List Insert ####
	public int saveList(BoardDto board) {
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// 1. 게시판 테이블 insert
			result = ListDao.getListDao().insertList(board);
			
			if(result != 0) {
				
//				2. log테이블 insert
				result = ListDao.getListDao().insertLog(board);
				if(result != 0) {
					
//					3. user테이블 insert
					result = ListDao.getListDao().updatetUser(board);
					
					if(result != 0) {
						conn.commit();
						conn.setAutoCommit(true);
					} else {
						conn.rollback();
					}
				} else {
					conn.rollback();
				} //if-else문 종료
			} else {
				conn.rollback();
			} conn.rollback();
		} catch (SQLException e) {
			try {
				result = 0;
				e.printStackTrace();
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	

//	#### 댓글 저장 ####
	public int saveComment(String id, String seq, String content, String subject, String writerId) {
		int result = 0;
		String postDate = null;
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// 댓글 테이블에 insert
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MH_COMMENT (POSTDATE, USERID, SEQ, CONTENT) \n");
			sql.append("VALUES (SYSDATE, ?, ?, ?) \n");
			String seqArr[] = {"POSTDATE"};	// 작성일 컬럼이름
			pstmt = conn.prepareStatement(sql.toString(), seqArr);

			pstmt.setString(1, id);
			pstmt.setInt(2, Integer.parseInt(seq));
			pstmt.setString(3, content);
			
			result = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();	//insert 후 작성일 받아오기

			rs.next();
			postDate = rs.getString(1);	
			if(result != 0) {
				// log 테이블에 insert
				sql = new StringBuffer();
				sql.append("INSERT INTO MH_LOG (LOGDATE, LOGID, USERID, LOGCATE, SUBJECT, SEQ) \n");
				sql.append("VALUES (to_date(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?, 3, ?, ?) \n");
				pstmt = conn.prepareStatement(sql.toString());
				
				int idx = 0;
				pstmt.setString(++idx, postDate);
				pstmt.setString(++idx, id);
				pstmt.setString(++idx, writerId);
				pstmt.setString(++idx, subject);
				pstmt.setInt(++idx, Integer.parseInt(seq));
				
				result = pstmt.executeUpdate();
				if(result != 0) {
					conn.commit();
					conn.setAutoCommit(true);
					
				}
			}
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
//--------------------------------------------------------------------------------------------------------- update
	
//	#### List modify ####
	public int modifyList(BoardDto board) {
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			result = ListDao.getListDao().updateList(board);
			if(result != 0) {
				
//				2. log테이블 insert
				result = ListDao.getListDao().updateLog(board);
				if(result != 0) {
					conn.commit();
					conn.setAutoCommit(true);
				}
			} else {
				conn.rollback();
			} //if-else문 종료
		} catch (SQLException e) {
			try {
				result = 0;
				e.printStackTrace();
				conn.rollback();
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return result;
	}
	



//	#### 조회수 올리고 List Select ####
//	seq == null && flag == false && id != null	: 아이디로 검색하여 최신순으로 정렬 하고 여러건 반환
//	seq != null && flag == true && id == null	: 리스트 조회수 올리고 글번호로 검색하여 1건 반환
//	seq != null && flag == false && id == null	: 글번호로 검색하여 1건 반환
	public List<BoardDto> selBoardBySeq(String seq, boolean flag, String id, String srchStr) {
		List<BoardDto> boardList = null;
		BoardDto board = null;
		
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// flag가 true인 경우, 조회수 올림
			if(flag) {
				result = ListDao.getListDao().updateCount("mh_board", "viewCount = viewCount + 1", "seq = " + seq);
			} else {
				result = 1;
			}
			
			if(result != 0) {
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT SEQ, USERID, SUBJECT, TO_CHAR(POSTDATE, 'YYYY.MM.DD HH24:MI:SS'), CONTENT, \n");
				sql.append("MOVIENAME, MOVIECODEYOUNG, MOVIECODENAVER, BEST, WORST, VIEWCOUNT \n");
				sql.append("FROM MH_BOARD \n");
				
				// id가 있는 경우 >> id로 검색  ||  id가 *인 경우 >> 전체 sel하여 최신순으로 정렬	||	id가 **인 경우 	>> 전체 sel하여 인기순으로 정렬||	id가 ***인 경우 	>> 검색하여 최신순 정렬
				// id없고 seq는 있는 경우 >> seq로 검색
				if(id != null) {
					if("*".equals(id)) {
						sql.append("WHERE BOARDCODE = 2 \n");
						sql.append("ORDER BY SEQ DESC \n");
					} else if("**".equals(id)) {
						sql.append("WHERE BOARDCODE = 2 \n");
						sql.append("ORDER BY BEST DESC, NOTIFY ASC, WORST ASC, VIEWCOUNT DESC \n");
					} else if("***".equals(id)) {
						sql.append("WHERE BOARDCODE = 2 and (SUBJECT like '%" + srchStr + "%' or CONTENT like '%" + srchStr + "%' or MOVIENAME like '%" + srchStr + "%')\n");
						sql.append("ORDER BY SEQ DESC \n");
					} else {
						sql.append("WHERE USERID = '" + id + "' and BOARDCODE = 2 \n");
						sql.append("ORDER BY SEQ DESC \n");
					}
				} else {
					sql.append("WHERE SEQ = " + seq + " and BOARDCODE = 2 \n");
					System.out.println(seq);
				}
				pstmt = conn.prepareStatement(sql.toString());
				
				rs = pstmt.executeQuery();
				
				boardList = new ArrayList<BoardDto>();
				while(rs.next()) {
					board = new BoardDto();
					
					// 영화 정보 || 단위로 나누기
					String[] name = rs.getString("MOVIENAME").split("\\|\\|");
					String[] young = rs.getString("MOVIECODEYOUNG").split("\\|\\|");
					String[] naver = rs.getString("MOVIECODENAVER").split("\\|\\|");
					List<String> movieName = new ArrayList<String>();
					List<String> movieCodeYoung = new ArrayList<String>();
					List<String> movieCodeNaver = new ArrayList<String>();
					
					int len = name.length;
					for(int i=0; i<len; i++) {
						movieName.add(name[i]);
						movieCodeYoung.add(young[i]);
						movieCodeNaver.add(naver[i]);
					}
					
					// dto에 set
					board.setSeq(rs.getInt("SEQ"));
					board.setUserId(rs.getString("USERID"));
					board.setSubject(rs.getString("SUBJECT"));
					board.setPostDate(rs.getString(4));
					board.setPostDateY(rs.getString(4).substring(0, 11));
					board.setContent(rs.getString("CONTENT"));
					board.setMovieName(movieName);
					board.setMovieCodeYoung(movieCodeYoung);
					board.setMovieCodeNaver(movieCodeNaver);
					board.setBest(rs.getInt("BEST"));
					board.setWorst(rs.getInt("WORST"));
					board.setViewCount(rs.getInt("VIEWCOUNT"));
					
					boardList.add(board);
					
				} // while문 종료
				
				conn.commit();
				conn.setAutoCommit(true);
				
			} // if문 종료
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return boardList;
	}
	
	
	
//	#### 좋아요&싫어요 update 후 select ####
	public int evaluate(String btnStr, String seq, String id) {
		int result = 0;
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
//			게시판 테이블의 좋아요/싫어요 update
			result = ListDao.getListDao().updateCount("MH_BOARD", btnStr + " = " + btnStr + " + 1", "seq = " + seq);
			if(result != 0) {
//				게시판 테이블 select
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT SEQ, USERID, SUBJECT, " + btnStr + " \n");
				sql.append("FROM MH_BOARD \n");
				sql.append("WHERE SEQ = " + seq + " \n");
				pstmt = conn.prepareStatement(sql.toString());
				
				rs = pstmt.executeQuery();
				rs.next();
				BoardDto board = new BoardDto();
				
				// dto에 set
				board.setSeq(rs.getInt("SEQ"));
				board.setUserId(rs.getString("USERID"));
				board.setSubject(rs.getString("SUBJECT"));
				int cnt = rs.getInt(4);
				
				if("best".equals(btnStr)) {	// 좋아요인 경우 user & log 테이블 update
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					
					result = ListDao.getListDao().updateCount("MH_USER", "BEST_COUNT = BEST_COUNT + 1", "USERID = '" + id + "'");
					
					if(result != 0) {
						sql = new StringBuffer();
						sql.append("INSERT INTO MH_LOG (LOGDATE, LOGID, USERID, LOGCATE, SUBJECT, SEQ) \n");
						sql.append("VALUES (SYSDATE, '" + id + "', ?, 4, ?, ?) \n");
						pstmt = conn.prepareStatement(sql.toString());
						
						int idx = 0;
						pstmt.setString(++idx, board.getUserId());
						pstmt.setString(++idx, board.getSubject());
						pstmt.setInt(++idx, board.getSeq());
						
						result = pstmt.executeUpdate();
						
						if(result != 0) {
							conn.commit();
							conn.setAutoCommit(true);
							result = cnt;
						}
					}
				} else { // 싫어요인 경우
					conn.commit();
					conn.setAutoCommit(true);
					result = cnt;
				}
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt);
		}
		return result;
	}
	
	
	
//	#### list 신고 ####
	public int notify(String seq) {
		int result = 0;
		try {
			conn = DBConnection.makeConnection();
			result = ListDao.getListDao().updateCount("MH_BOARD", "NOTIFY = NOTIFY + 1", "SEQ = " + seq);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return result;
	}
	
	
//	#### 댓글 수정 완료 ####
	public int updateComment(String content, String postDate, String id) {
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE MH_COMMENT \n");
			sql.append("SET CONTENT = ? \n");
			sql.append("WHERE to_char(POSTDATE, 'YYYY.MM.DD HH24:MI:SS') = ? and USERID = ? \n");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, content);
			pstmt.setString(2, postDate);
			pstmt.setString(3, id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
//---------------------------------------------------------------------------------------------------------- select
	
	
//	#### Comment Select ####
	public List<CommentDto> selCommentBySeq(String seq, boolean flag) {
		List<CommentDto> comment = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT SEQ, to_char(POSTDATE, 'YYYY.MM.DD HH24:MI:SS'), USERID, CONTENT \n");
			sql.append("FROM MH_COMMENT \n");
			sql.append("WHERE SEQ = ? \n");
			sql.append("ORDER BY POSTDATE DESC \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, Integer.parseInt(seq));
			rs = pstmt.executeQuery();
			
			comment = new ArrayList<CommentDto>();
			CommentDto temp = new CommentDto();
			if(flag) {
				comment.add(temp);
			}
			while(rs.next()) {
				temp = new CommentDto();
				
				// dto에 set
				temp.setSeq(rs.getInt("seq"));
				temp.setPostDate(rs.getString(2));
				temp.setUserId(rs.getString("userId"));
				temp.setContent(rs.getString("content"));
				
				comment.add(temp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return comment;
	}
	
	
//	#### Profile Select ####
	public UserDto selProfileById(String id) {
		UserDto user = null;
		
		try {
			conn = DBConnection.makeConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT PROFILE \n");
			sql.append("FROM MH_USER \n");
			sql.append("WHERE USERID = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserDto(id, rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return user;
	}
	
	
//--------------------------------------------------------------------------------------------------------- delete
	
	
//	#### delete List ####
	public int deleteList(String seq, String postDate, int cnt, String id) {
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
//			1. 로그 삭제 (기준: 글번호)
			result = ListDao.getListDao().delete("MH_LOG", "SEQ = '" + seq + "'");
			if(result != 0) {
//				2. 댓글 삭제 (기준: 글번호)
				if(cnt != 0) {
					result = ListDao.getListDao().delete("MH_COMMENT", "SEQ = '" + seq + "'");
				}
				if(result != 0) {
					
//					3. 리스트 삭제 (기준: 글번호)
					result = ListDao.getListDao().delete("MH_BOARD", "SEQ = '" + seq + "'");
					if(result != 0) {
						result = ListDao.getListDao().updateCount("MH_USER", "LIST_COUNT = LIST_COUNT - 1", "USERID = " + "'" + id + "'");
						
						if(result != 0) {
							conn.commit();
							conn.setAutoCommit(true);
						} else {
							conn.rollback();
						}
					} else {
						conn.rollback();
					}
				} else {
					conn.rollback();
				}
			} else {
				conn.rollback();
			} //if-else문 종료
		} catch (SQLException e) {
			try {
				result = 0;
				e.printStackTrace();
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
	
//	#### 댓글 삭제 ####
	public int delComment(String id, String postDate) {
		int result = 0;
		
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			// 댓글 테이블의 데이터 삭제
			result = delete("MH_COMMENT", "to_char(POSTDATE, 'YYYY.MM.DD HH24:MI:SS') = '" + postDate + "' and USERID = '" + id + "'");
			if(result != 0) {
				
				// 로그 테이블의 데이터 삭제
				result = delete("MH_LOG", "to_char(LOGDATE, 'YYYY.MM.DD HH24:MI:SS') = '" + postDate + "' and LOGID = '" + id + "'");
				
				if(result != 0) {
					conn.commit();
					conn.setAutoCommit(true);
				}
			}
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		
		return result;
	}
	
	
	
//	#### 댓글 수정 ####
	public String modCommment(String id, String postDate) {
		String result = null;
		try {
			conn = DBConnection.makeConnection();
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT CONTENT \n");
			sql.append("FROM MH_COMMENT \n");
			sql.append("WHERE to_char(POSTDATE, 'YYYY.MM.DD HH24:MI:SS') = ? and USERID = ? \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, postDate);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
	
//------------------------------------------------------------------------------------------- util
//	#### List테이블에 insert ####
	public int insertList(BoardDto board) throws SQLException {
		int result = 0;
		String name = "";
		String young = "";
		String naver = "";
		
		try {
			// list타입의 영화정보를 ||로 연결하여 String으로 변환
			int len = board.getMovieName().size();
			for(int i=0; i<len; i++) {
				name += board.getMovieName().get(i) + "||";
				young += board.getMovieCodeYoung().get(i) + "||";
				naver += board.getMovieCodeNaver().get(i) + "||";
			}
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MH_BOARD (SEQ, USERID, BOARDCODE, SUBJECT, POSTDATE, CONTENT, MOVIENAME, MOVIECODEYOUNG, MOVIECODENAVER, ENABLE) \n");
			sql.append("VALUES (SEQ.NEXTVAL, ?, 2, ?, SYSDATE, ?, ?, ?, ?, 1)");
			String seqArr[] = {"seq", "POSTDATE"};	// 글번호 컬럼이름
			pstmt = conn.prepareStatement(sql.toString(), seqArr);	//insert 후 sequence 받아오기
			
			int idx = 0;
			pstmt.setString(++idx, board.getUserId());
			pstmt.setString(++idx, board.getSubject());
			pstmt.setString(++idx, board.getContent());
			pstmt.setString(++idx, name);
			pstmt.setString(++idx, young);
			pstmt.setString(++idx, naver);
			
			result = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();	//insert 후 글번호, 작성일 받아오기
	        
	        rs.next();
	        board.setSeq(rs.getInt(1));	// 받아온 글번호 dto에 set
	        board.setPostDate(rs.getNString(2));	// 받아온 작성일 dto에 set	
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	
//	#### list 테이블 update ####
	private int updateList(BoardDto board) throws SQLException {
		int result = 0;
		String name = "";
		String young = "";
		String naver = "";
		
		try {
			// list타입의 영화정보를 ||로 연결하여 String으로 변환
			int len = board.getMovieName().size();
			for(int i=0; i<len; i++) {
				name += board.getMovieName().get(i) + "||";
				young += board.getMovieCodeYoung().get(i) + "||";
				naver += board.getMovieCodeNaver().get(i) + "||";
			}
			
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE MH_BOARD \n");
			sql.append("SET SUBJECT = ?, CONTENT = ?, MOVIENAME = ?, MOVIECODEYOUNG = ?, MOVIECODENAVER = ? \n");
			sql.append("WHERE SEQ = ? \n");
			pstmt = conn.prepareStatement(sql.toString());	//insert 후 sequence 받아오기
			
			int idx = 0;
			pstmt.setString(++idx, board.getSubject());
			pstmt.setString(++idx, board.getContent());
			pstmt.setString(++idx, name);
			pstmt.setString(++idx, young);
			pstmt.setString(++idx, naver);
			pstmt.setInt(++idx, board.getSeq());
			
			result = pstmt.executeUpdate();
	        
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	
	
//	#### Log테이블에 insert ####
	public int insertLog(BoardDto board) throws SQLException {
		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO MH_LOG (LOGDATE, LOGID, USERID, LOGCATE, SUBJECT, SEQ) \n");
			sql.append("VALUES (to_date(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?, 1, ?, ?) \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			int idx = 0;
			pstmt.setString(++idx, board.getPostDate());
			pstmt.setString(++idx, board.getUserId());
			pstmt.setString(++idx, board.getUserId());
			pstmt.setString(++idx, board.getSubject());
			pstmt.setInt(++idx, board.getSeq());
			
			result = pstmt.executeUpdate();
		} finally {
			if(pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	
//	#### log 테이블 subject update ####
	private int updateLog(BoardDto board) throws SQLException {
		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE MH_LOG \n");
			sql.append("SET SUBJECT = ? \n");
			sql.append("WHERE to_char(LOGDATE, 'YYYY.MM.DD HH24:MI:SS') = ? AND LOGID = ? AND SEQ = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			int idx = 0;
			pstmt.setString(++idx, board.getSubject());
			pstmt.setString(++idx, board.getPostDate());
			pstmt.setString(++idx, board.getUserId());
			pstmt.setInt(++idx, board.getSeq());
			
			result = pstmt.executeUpdate();
		} finally {
			if(pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
//	#### User 테이블에 update ####
	public int updatetUser(BoardDto board) throws SQLException {
		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE MH_USER \n");
			sql.append("SET LIST_COUNT = LIST_COUNT + 1 \n");
			sql.append("WHERE USERID = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getUserId());
			
			result = pstmt.executeUpdate();
		} finally {
			if(pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	
	
	
//	#### Count update ####
	public int updateCount(String table, String column, String condition) throws SQLException {
		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE " + table + " \n");
			sql.append("SET " + column + " \n");
			sql.append("WHERE " + condition + " \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			
			result = pstmt.executeUpdate();
			
		} finally {
			if(pstmt != null)
				pstmt.close();
		}
		
		return result;
	}
	
	
	
	
	
	
//	#### delete ####
	public int delete(String table, String condition) throws SQLException {
		
		int result = 0;
		
		try {
			
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE " + table + " \n");
			sql.append("WHERE " + condition + " \n");
			pstmt = conn.prepareStatement(sql.toString());
			
			result = pstmt.executeUpdate();
			
		} finally {
			if(pstmt != null)
				pstmt.close();
		}
		
		return result;
	}
	
	
	


	
	
	
	
	
	
	
	

}
