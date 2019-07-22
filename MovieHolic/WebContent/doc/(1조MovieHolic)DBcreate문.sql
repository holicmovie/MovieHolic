ALTER TABLE mh_board
	DROP
		CONSTRAINT FK_mh_user_TO_mh_board
		CASCADE;

ALTER TABLE mh_board
	DROP
		CONSTRAINT FK_mh_category_TO_mh_board
		CASCADE;

ALTER TABLE mh_comment
	DROP
		CONSTRAINT FK_mh_user_TO_mh_comment
		CASCADE;

ALTER TABLE mh_comment
	DROP
		CONSTRAINT FK_mh_board_TO_mh_comment
		CASCADE;

ALTER TABLE mh_social
	DROP
		CONSTRAINT FK_mh_user_TO_mh_social
		CASCADE;

ALTER TABLE mh_wishlist
	DROP
		CONSTRAINT FK_mh_wishcate_TO_mh_wishlist
		CASCADE;

ALTER TABLE mh_wishlist
	DROP
		CONSTRAINT FK_mh_user_TO_mh_wishlist
		CASCADE;

ALTER TABLE mh_board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_user
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_wishcate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_visitor
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_log
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE TABLE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* mh_board */
DROP TABLE mh_board 
	CASCADE CONSTRAINTS;

/* mh_comment */
DROP TABLE mh_comment 
	CASCADE CONSTRAINTS;

/* mh_social */
DROP TABLE mh_social 
	CASCADE CONSTRAINTS;

/* mh_user */
DROP TABLE mh_user 
	CASCADE CONSTRAINTS;

/* mh_category */
DROP TABLE mh_category 
	CASCADE CONSTRAINTS;

/* mh_wishlist */
DROP TABLE mh_wishlist 
	CASCADE CONSTRAINTS;

/* mh_wishlistcate */
DROP TABLE mh_wishcate 
	CASCADE CONSTRAINTS;

/* mh_visitor */
DROP TABLE mh_visitor 
	CASCADE CONSTRAINTS;

/* mh_log */
DROP TABLE mh_log 
	CASCADE CONSTRAINTS;

/* mh_films */
DROP TABLE TABLE 
	CASCADE CONSTRAINTS;

/* mh_board */
CREATE TABLE mh_board (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	subject VARCHAR2(100), /* 제목 */
	postDate DATE, /* 작성일 */
	content CLOB, /* 내용 */
	starPoint NUMBER, /* 별점 */
	movieName CLOB, /* 영화명 */
	director CLOB, /* 감독명 */
	movieCodeYoung CLOB, /* 영화코드(진흥원) */
	category VARCHAR2(24), /* 장르 */
	best NUMBER, /* 추천 */
	worst NUMBER, /* 비추천 */
	notify NUMBER, /* 신고 */
	enable NUMBER, /* 공개여부 */
	viewCount NUMBER /* 조회수 */
);

COMMENT ON TABLE mh_board IS 'mh_board';

COMMENT ON COLUMN mh_board.seq IS '글번호';

COMMENT ON COLUMN mh_board.userId IS '회원ID';

COMMENT ON COLUMN mh_board.boardCode IS '게시판코드';

COMMENT ON COLUMN mh_board.subject IS '제목';

COMMENT ON COLUMN mh_board.postDate IS '작성일';

COMMENT ON COLUMN mh_board.content IS '내용';

COMMENT ON COLUMN mh_board.starPoint IS '별점';

COMMENT ON COLUMN mh_board.movieName IS '영화명';

COMMENT ON COLUMN mh_board.director IS '감독명';

COMMENT ON COLUMN mh_board.movieCodeYoung IS '영화코드(진흥원)';

COMMENT ON COLUMN mh_board.category IS '장르';

COMMENT ON COLUMN mh_board.best IS '추천';

COMMENT ON COLUMN mh_board.worst IS '비추천';

COMMENT ON COLUMN mh_board.notify IS '신고';

COMMENT ON COLUMN mh_board.enable IS '공개여부';

COMMENT ON COLUMN mh_board.viewCount IS '조회수';

ALTER TABLE mh_board
	ADD
		CONSTRAINT PK_mh_board
		PRIMARY KEY (
			seq
		);

/* mh_comment */
CREATE TABLE mh_comment (
	postDate DATE NOT NULL, /* 작성일 */
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	seq NUMBER NOT NULL, /* 글번호 */
	content VARCHAR2(100) /* 내용 */
);

COMMENT ON TABLE mh_comment IS 'mh_comment';

COMMENT ON COLUMN mh_comment.postDate IS '작성일';

COMMENT ON COLUMN mh_comment.userId IS '회원ID';

COMMENT ON COLUMN mh_comment.seq IS '글번호';

COMMENT ON COLUMN mh_comment.content IS '내용';

ALTER TABLE mh_comment
	ADD
		CONSTRAINT PK_mh_comment
		PRIMARY KEY (
			postDate
		);

/* mh_social */
CREATE TABLE mh_social (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	followingId VARCHAR2(100), /* 팔로잉ID */
	postDate DATE /* 작성일 */
);

COMMENT ON TABLE mh_social IS 'mh_social';

COMMENT ON COLUMN mh_social.userId IS '회원ID';

COMMENT ON COLUMN mh_social.followingId IS '팔로잉ID';

COMMENT ON COLUMN mh_social.postDate IS '작성일';

/* mh_user */
CREATE TABLE mh_user (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	name VARCHAR2(16), /* 이름 */
	pass VARCHAR2(100), /* 비밀번호 */
	phoneFirst VARCHAR2(3), /* 핸드폰번호1 */
	phoneMid VARCHAR2(4), /* 핸드폰번호2 */
	phoneLast VARCHAR2(4), /* 핸드폰번호3 */
	birth VARCHAR2(16), /* 생년월일 */
	gender VARCHAR2(2), /* 성별 */
	joinDate DATE, /* 가입일 */
	outDate DATE, /* 탈퇴일 */
	profile VARCHAR2(200), /* 회원사진 */
	enable NUMBER /* 활성화여부 */
);

COMMENT ON TABLE mh_user IS 'mh_user';

COMMENT ON COLUMN mh_user.userId IS '회원ID';

COMMENT ON COLUMN mh_user.name IS '이름';

COMMENT ON COLUMN mh_user.pass IS '비밀번호';

COMMENT ON COLUMN mh_user.phoneFirst IS '핸드폰번호1';

COMMENT ON COLUMN mh_user.phoneMid IS '핸드폰번호2';

COMMENT ON COLUMN mh_user.phoneLast IS '핸드폰번호3';

COMMENT ON COLUMN mh_user.birth IS '생년월일';

COMMENT ON COLUMN mh_user.gender IS '성별';

COMMENT ON COLUMN mh_user.joinDate IS '가입일';

COMMENT ON COLUMN mh_user.outDate IS '탈퇴일';

COMMENT ON COLUMN mh_user.profile IS '회원사진';

COMMENT ON COLUMN mh_user.enable IS '활성화여부';

ALTER TABLE mh_user
	ADD
		CONSTRAINT PK_mh_user
		PRIMARY KEY (
			userId
		);

/* mh_category */
CREATE TABLE mh_category (
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	boardName VARCHAR2(100) /* 게시판명 */
);

COMMENT ON TABLE mh_category IS 'mh_category';

COMMENT ON COLUMN mh_category.boardCode IS '게시판코드';

COMMENT ON COLUMN mh_category.boardName IS '게시판명';

ALTER TABLE mh_category
	ADD
		CONSTRAINT PK_mh_category
		PRIMARY KEY (
			boardCode
		);

/* mh_wishlist */
CREATE TABLE mh_wishlist (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	code NUMBER NOT NULL, /* 코드 */
	movieCodeNaver VARCHAR2(500), /* 영화코드(네이버) */
	movieCodeYoung VARCHAR2(500), /* 영화코드(진흥원) */
	postDate DATE /* 작성일 */
);

COMMENT ON TABLE mh_wishlist IS 'mh_wishlist';

COMMENT ON COLUMN mh_wishlist.userId IS '회원ID';

COMMENT ON COLUMN mh_wishlist.code IS '코드';

COMMENT ON COLUMN mh_wishlist.movieCodeNaver IS '영화코드(네이버)';

COMMENT ON COLUMN mh_wishlist.movieCodeYoung IS '영화코드(진흥원)';

COMMENT ON COLUMN mh_wishlist.postDate IS '작성일';

/* mh_wishlistcate */
CREATE TABLE mh_wishcate (
	code NUMBER NOT NULL, /* 코드 */
	category VARCHAR2(100) /* 분류명 */
);

COMMENT ON TABLE mh_wishcate IS 'mh_wishlistcate';

COMMENT ON COLUMN mh_wishcate.code IS '코드';

COMMENT ON COLUMN mh_wishcate.category IS '분류명';

ALTER TABLE mh_wishcate
	ADD
		CONSTRAINT PK_mh_wishcate
		PRIMARY KEY (
			code
		);

/* mh_visitor */
CREATE TABLE mh_visitor (
	connectDate DATE NOT NULL, /* 접속날짜 */
	visitor NUMBER DEFAULT 0 /* 방문자수 */
);

COMMENT ON TABLE mh_visitor IS 'mh_visitor';

COMMENT ON COLUMN mh_visitor.connectDate IS '접속날짜';

COMMENT ON COLUMN mh_visitor.visitor IS '방문자수';

ALTER TABLE mh_visitor
	ADD
		CONSTRAINT PK_mh_visitor
		PRIMARY KEY (
			connectDate
		);

/* mh_log */
CREATE TABLE mh_log (
	logDate DATE NOT NULL, /* 활동시간 */
	logId VARCHAR2(100), /* 활동한ID */
	userId VARCHAR2(100), /* 작성자ID */
	logCate NUMBER, /* 활동분류 */
	subject VARCHAR2(100), /* 제목 */
	movieCodeYoung CLOB /* 영화코드(진흥원) */
);

COMMENT ON TABLE mh_log IS 'mh_log';

COMMENT ON COLUMN mh_log.logDate IS '활동시간';

COMMENT ON COLUMN mh_log.logId IS '활동한ID';

COMMENT ON COLUMN mh_log.userId IS '작성자ID';

COMMENT ON COLUMN mh_log.logCate IS '활동분류';

COMMENT ON COLUMN mh_log.subject IS '제목';

COMMENT ON COLUMN mh_log.movieCodeYoung IS '영화코드(진흥원)';

ALTER TABLE mh_log
	ADD
		CONSTRAINT PK_mh_log
		PRIMARY KEY (
			logDate
		);

/* mh_films */
CREATE TABLE TABLE (
	movieCodeYoung VARCHAR2(30) NOT NULL, /* 영진원영화코드 */
	movieName VARCHAR2(200), /* 영화명 */
	movieCodeNaver VARCHAR2(30), /* 네이버영화코드 */
	prdtYear VARCHAR2(8), /* 제작년도 */
	openYear VARCHAR2(8), /* 개봉연도 */
	category VARCHAR2(100), /* 장르 */
	movieImage CLOB, /* 영화이미지 */
	starPointNaver FLOAT(126) /* 네이버별점 */
);

COMMENT ON TABLE TABLE IS 'mh_films';

COMMENT ON COLUMN TABLE.movieCodeYoung IS '영진원영화코드';

COMMENT ON COLUMN TABLE.movieName IS '영화명';

COMMENT ON COLUMN TABLE.movieCodeNaver IS '네이버영화코드';

COMMENT ON COLUMN TABLE.prdtYear IS '제작년도';

COMMENT ON COLUMN TABLE.openYear IS '개봉연도';

COMMENT ON COLUMN TABLE.category IS '장르';

COMMENT ON COLUMN TABLE.movieImage IS '영화이미지';

COMMENT ON COLUMN TABLE.starPointNaver IS '네이버별점';

ALTER TABLE TABLE
	ADD
		CONSTRAINT PK_TABLE
		PRIMARY KEY (
			movieCodeYoung
		);

ALTER TABLE mh_board
	ADD
		CONSTRAINT FK_mh_user_TO_mh_board
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

ALTER TABLE mh_board
	ADD
		CONSTRAINT FK_mh_category_TO_mh_board
		FOREIGN KEY (
			boardCode
		)
		REFERENCES mh_category (
			boardCode
		);

ALTER TABLE mh_comment
	ADD
		CONSTRAINT FK_mh_user_TO_mh_comment
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

ALTER TABLE mh_comment
	ADD
		CONSTRAINT FK_mh_board_TO_mh_comment
		FOREIGN KEY (
			seq
		)
		REFERENCES mh_board (
			seq
		);

ALTER TABLE mh_social
	ADD
		CONSTRAINT FK_mh_user_TO_mh_social
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

ALTER TABLE mh_wishlist
	ADD
		CONSTRAINT FK_mh_wishcate_TO_mh_wishlist
		FOREIGN KEY (
			code
		)
		REFERENCES mh_wishcate (
			code
		);

ALTER TABLE mh_wishlist
	ADD
		CONSTRAINT FK_mh_user_TO_mh_wishlist
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

/* sequence1 */
DROP SEQUENCE seq;

/* sequence1 */
CREATE SEQUENCE seq
	start with 100;