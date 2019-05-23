ALTER TABLE holic_board
	DROP
		CONSTRAINT FK_holic_user_TO_holic_board
		CASCADE;

ALTER TABLE holic_board
	DROP
		CONSTRAINT FK_holic_category_TO_holic_board
		CASCADE;

ALTER TABLE holic_review
	DROP
		CONSTRAINT FK_holic_user_TO_holic_review
		CASCADE;

ALTER TABLE holic_review
	DROP
		CONSTRAINT FK_holic_board_TO_holic_review
		CASCADE;

ALTER TABLE holic_social
	DROP
		CONSTRAINT FK_holic_user_TO_holic_social
		CASCADE;

ALTER TABLE holic_wishlist
	DROP
		CONSTRAINT FK_holic_boardcate_TO_holic_wishlist
		CASCADE;

ALTER TABLE holic_wishlist
	DROP
		CONSTRAINT FK_holic_user_TO_holic_wishlist
		CASCADE;

ALTER TABLE holic_board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE TABLE2
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE holic_review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE holic_user
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE holic_category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE holic_boardcate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE holic_visitor
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

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

/* holic_board */
CREATE TABLE holic_board (
	seq NUMBER NOT NULL, /* 글번호 */
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	subject VARCHAR2(100), /* 제목 */
	date DATE, /* 작성일 */
	content CLOB, /* 내용 */
	starPoint NUMBER, /* 별점 */
	movieCode VARCHAR2(4000), /* 영화코드 */
	cotegory VARCHAR2(24), /* 장르 */
	best NUMBER, /* 추천 */
	worst NUMBER, /* 비추천 */
	notify NUMBER, /* 신고 */
	enable VARCHAR2(), /* 공개여부 */
	viewCount NUMBER /* 조회수 */
);

COMMENT ON TABLE holic_board IS 'holic_board';

COMMENT ON COLUMN holic_board.seq IS '글번호';

COMMENT ON COLUMN holic_board.userId IS '회원ID';

COMMENT ON COLUMN holic_board.boardCode IS '게시판코드';

COMMENT ON COLUMN holic_board.subject IS '제목';

COMMENT ON COLUMN holic_board.date IS '작성일';

COMMENT ON COLUMN holic_board.content IS '내용';

COMMENT ON COLUMN holic_board.starPoint IS '별점';

COMMENT ON COLUMN holic_board.movieCode IS '영화코드';

COMMENT ON COLUMN holic_board.cotegory IS '장르';

COMMENT ON COLUMN holic_board.best IS '추천';

COMMENT ON COLUMN holic_board.worst IS '비추천';

COMMENT ON COLUMN holic_board.notify IS '신고';

COMMENT ON COLUMN holic_board.enable IS '공개여부';

COMMENT ON COLUMN holic_board.viewCount IS '조회수';

CREATE UNIQUE INDEX PK_holic_board
	ON holic_board (
		seq ASC
	);

ALTER TABLE holic_board
	ADD
		CONSTRAINT PK_holic_board
		PRIMARY KEY (
			seq
		);

/* 회원_위시리스트 */
CREATE TABLE TABLE2 (
	user_id VARCHAR2(32) NOT NULL, /* 회원ID */
	movie_code VARCHAR2(32), /* 영화코드 */
	regitdate <지정 되지 않음> /* 등록일자 */
);

COMMENT ON TABLE TABLE2 IS '회원_위시리스트';

COMMENT ON COLUMN TABLE2.user_id IS '회원ID';

COMMENT ON COLUMN TABLE2.movie_code IS '영화코드';

COMMENT ON COLUMN TABLE2.regitdate IS '등록일자';

CREATE UNIQUE INDEX PK_TABLE2
	ON TABLE2 (
		user_id ASC
	);

ALTER TABLE TABLE2
	ADD
		CONSTRAINT PK_TABLE2
		PRIMARY KEY (
			user_id
		);

/* holic_review */
CREATE TABLE holic_review (
	date DATE NOT NULL, /* 작성일 */
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	seq NUMBER NOT NULL, /* 글번호 */
	content VARCHAR2(1000) /* 내용 */
);

COMMENT ON TABLE holic_review IS 'holic_review';

COMMENT ON COLUMN holic_review.date IS '작성일';

COMMENT ON COLUMN holic_review.userId IS '회원ID';

COMMENT ON COLUMN holic_review.seq IS '글번호';

COMMENT ON COLUMN holic_review.content IS '내용';

CREATE UNIQUE INDEX PK_holic_review
	ON holic_review (
		date ASC
	);

ALTER TABLE holic_review
	ADD
		CONSTRAINT PK_holic_review
		PRIMARY KEY (
			date
		);

/* holic_social */
CREATE TABLE holic_social (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	followingId VARCHAR2(100), /* 팔로잉ID */
	followerId <지정 되지 않음>, /* 팔로워ID */
	date DATE /* 작성일 */
);

COMMENT ON TABLE holic_social IS 'holic_social';

COMMENT ON COLUMN holic_social.userId IS '회원ID';

COMMENT ON COLUMN holic_social.followingId IS '팔로잉ID';

COMMENT ON COLUMN holic_social.followerId IS '팔로워ID';

COMMENT ON COLUMN holic_social.date IS '작성일';

/* holic_user */
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
	profile CLOB /* 회원사진 */
);

COMMENT ON TABLE holic_user IS 'holic_user';

COMMENT ON COLUMN holic_user.userId IS '회원ID';

COMMENT ON COLUMN holic_user.name IS '이름';

COMMENT ON COLUMN holic_user.pass IS '비밀번호';

COMMENT ON COLUMN holic_user.phoneFirst IS '핸드폰번호1';

COMMENT ON COLUMN holic_user.phoneMid IS '핸드폰번호2';

COMMENT ON COLUMN holic_user.phoneLast IS '핸드폰번호3';

COMMENT ON COLUMN holic_user.birth IS '생년월일';

COMMENT ON COLUMN holic_user.gender IS '성별';

COMMENT ON COLUMN holic_user.joinDate IS '가입일';

COMMENT ON COLUMN holic_user.outDate IS '탈퇴일';

COMMENT ON COLUMN holic_user.profile IS '회원사진';

CREATE UNIQUE INDEX PK_holic_user
	ON holic_user (
		userId ASC
	);

ALTER TABLE holic_user
	ADD
		CONSTRAINT PK_holic_user
		PRIMARY KEY (
			userId
		);

/* holic_category */
CREATE TABLE holic_category (
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	boardName VARCHAR2(100) /* 게시판명 */
);

COMMENT ON TABLE holic_category IS 'holic_category';

COMMENT ON COLUMN holic_category.boardCode IS '게시판코드';

COMMENT ON COLUMN holic_category.boardName IS '게시판명';

CREATE UNIQUE INDEX PK_holic_category
	ON holic_category (
		boardCode ASC
	);

ALTER TABLE holic_category
	ADD
		CONSTRAINT PK_holic_category
		PRIMARY KEY (
			boardCode
		);

/* holic_wishlist */
CREATE TABLE holic_wishlist (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	code NUMBER NOT NULL, /* 코드 */
	movieCode VARCHAR2(4000), /* 영화코드 */
	date DATE /* 작성일 */
);

COMMENT ON TABLE holic_wishlist IS 'holic_wishlist';

COMMENT ON COLUMN holic_wishlist.userId IS '회원ID';

COMMENT ON COLUMN holic_wishlist.code IS '코드';

COMMENT ON COLUMN holic_wishlist.movieCode IS '영화코드';

COMMENT ON COLUMN holic_wishlist.date IS '작성일';

/* 위시리스트&본 영화 분류 */
CREATE TABLE holic_boardcate (
	code NUMBER NOT NULL, /* 코드 */
	category VARCHAR2(100) /* 분류명 */
);

COMMENT ON TABLE holic_boardcate IS '위시리스트&본 영화 분류';

COMMENT ON COLUMN holic_boardcate.code IS '코드';

COMMENT ON COLUMN holic_boardcate.category IS '분류명';

CREATE UNIQUE INDEX PK_holic_boardcate
	ON holic_boardcate (
		code ASC
	);

ALTER TABLE holic_boardcate
	ADD
		CONSTRAINT PK_holic_boardcate
		PRIMARY KEY (
			code
		);

/* holic_visitor */
CREATE TABLE holic_visitor (
	connectDate DATE NOT NULL, /* 접속날짜 */
	visitor NUMBER DEFAULT 0 /* 방문자수 */
);

COMMENT ON TABLE holic_visitor IS 'holic_visitor';

COMMENT ON COLUMN holic_visitor.connectDate IS '접속날짜';

COMMENT ON COLUMN holic_visitor.visitor IS '방문자수';

CREATE UNIQUE INDEX PK_holic_visitor
	ON holic_visitor (
		connectDate ASC
	);

ALTER TABLE holic_visitor
	ADD
		CONSTRAINT PK_holic_visitor
		PRIMARY KEY (
			connectDate
		);

ALTER TABLE holic_board
	ADD
		CONSTRAINT FK_holic_user_TO_holic_board
		FOREIGN KEY (
			userId
		)
		REFERENCES holic_user (
			userId
		);

ALTER TABLE holic_board
	ADD
		CONSTRAINT FK_holic_category_TO_holic_board
		FOREIGN KEY (
			boardCode
		)
		REFERENCES holic_category (
			boardCode
		);

ALTER TABLE holic_review
	ADD
		CONSTRAINT FK_holic_user_TO_holic_review
		FOREIGN KEY (
			userId
		)
		REFERENCES holic_user (
			userId
		);

ALTER TABLE holic_review
	ADD
		CONSTRAINT FK_holic_board_TO_holic_review
		FOREIGN KEY (
			seq
		)
		REFERENCES holic_board (
			seq
		);

ALTER TABLE holic_social
	ADD
		CONSTRAINT FK_holic_user_TO_holic_social
		FOREIGN KEY (
			userId
		)
		REFERENCES holic_user (
			userId
		);

ALTER TABLE holic_wishlist
	ADD
		CONSTRAINT FK_holic_boardcate_TO_holic_wishlist
		FOREIGN KEY (
			code
		)
		REFERENCES holic_boardcate (
			code
		);

ALTER TABLE holic_wishlist
	ADD
		CONSTRAINT FK_holic_user_TO_holic_wishlist
		FOREIGN KEY (
			userId
		)
		REFERENCES holic_user (
			userId
		);