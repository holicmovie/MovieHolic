DROP INDEX PK_holic_board;

DROP INDEX PK_TABLE2;

DROP INDEX PK_holic_review;

DROP INDEX PK_holic_user;

DROP INDEX PK_holic_category;

DROP INDEX PK_holic_boardcate;

DROP INDEX PK_holic_visitor;

/* holic_board */
DROP TABLE holic_board 
	CASCADE CONSTRAINTS;

/* 회원_위시리스트 */
DROP TABLE TABLE2 
	CASCADE CONSTRAINTS;

/* holic_review */
DROP TABLE holic_review 
	CASCADE CONSTRAINTS;

/* holic_social */
DROP TABLE holic_social 
	CASCADE CONSTRAINTS;

/* holic_user */
DROP TABLE holic_user 
	CASCADE CONSTRAINTS;

/* holic_category */
DROP TABLE holic_category 
	CASCADE CONSTRAINTS;

/* holic_wishlist */
DROP TABLE holic_wishlist 
	CASCADE CONSTRAINTS;

/* 위시리스트&본 영화 분류 */
DROP TABLE holic_boardcate 
	CASCADE CONSTRAINTS;

/* holic_visitor */
DROP TABLE holic_visitor 
	CASCADE CONSTRAINTS;



CREATE TABLE holic_board (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	subject VARCHAR2(100), /* 제목 */
	postDate DATE, /* 작성일 */
	content CLOB, /* 내용 */
	starPoint NUMBER, /* 별점 */
	movieCode VARCHAR2(4000), /* 영화코드 */
	cotegory VARCHAR2(24), /* 장르 */
	best NUMBER, /* 추천 */
	worst NUMBER, /* 비추천 */
	notify NUMBER, /* 신고 */
	enable VARCHAR2(8), /* 공개여부 */
	viewCount NUMBER /* 조회수 */
);

CREATE TABLE holic_user (
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

insert into holic_user values('qjawns0618@naver.com', '권범준', 'kitri', 010, 5419, 0583, 940618, '남', sysdate, sysdate, null);

select userId,name,birth,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate from holic_user;
