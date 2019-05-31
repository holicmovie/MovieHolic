ALTER TABLE board
	DROP
		CONSTRAINT FK_user_TO_board
		CASCADE;

ALTER TABLE board
	DROP
		CONSTRAINT FK_category_TO_board
		CASCADE;

ALTER TABLE comment
	DROP
		CONSTRAINT FK_user_TO_comment
		CASCADE;

ALTER TABLE comment
	DROP
		CONSTRAINT FK_board_TO_comment
		CASCADE;

ALTER TABLE social
	DROP
		CONSTRAINT FK_user_TO_social
		CASCADE;

ALTER TABLE wishlist
	DROP
		CONSTRAINT FK_wishlistcate_TO_wishlist
		CASCADE;

ALTER TABLE wishlist
	DROP
		CONSTRAINT FK_user_TO_wishlist
		CASCADE;

ALTER TABLE board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE user
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE wishlistcate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE visitor
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE log
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_board;

DROP INDEX PK_comment;

DROP INDEX PK_user;

DROP INDEX PK_category;

DROP INDEX PK_wishlistcate;

DROP INDEX PK_visitor;

DROP INDEX PK_log;

/* board */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* review */
DROP TABLE comment 
	CASCADE CONSTRAINTS;

/* social */
DROP TABLE social 
	CASCADE CONSTRAINTS;

/* user */
DROP TABLE user 
	CASCADE CONSTRAINTS;

/* category */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* wishlist */
DROP TABLE wishlist 
	CASCADE CONSTRAINTS;

/* wishlistcate */
DROP TABLE wishlistcate 
	CASCADE CONSTRAINTS;

/* visitor */
DROP TABLE visitor 
	CASCADE CONSTRAINTS;

/* log */
DROP TABLE log 
	CASCADE CONSTRAINTS;
	
	/* sequence1 */
DROP SEQUENCE seq;

/* sequence1 */
CREATE SEQUENCE seq
	start with 100;


/* board */
CREATE TABLE board (
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
	best NUMBER default 0, /* 추천 */
	worst NUMBER default 0, /* 비추천 */
	notify NUMBER default 0, /* 신고 */
	enable NUMBER default 1, /* 공개여부 */
	viewCount NUMBER default 0/* 조회수 */
);

COMMENT ON TABLE board IS 'board';

COMMENT ON COLUMN board.seq IS '글번호';

COMMENT ON COLUMN board.userId IS '회원ID';

COMMENT ON COLUMN board.boardCode IS '게시판코드';

COMMENT ON COLUMN board.subject IS '제목';

COMMENT ON COLUMN board.postDate IS '작성일';

COMMENT ON COLUMN board.content IS '내용';

COMMENT ON COLUMN board.starPoint IS '별점';

COMMENT ON COLUMN board.movieName IS '영화명';

COMMENT ON COLUMN board.director IS '감독명';

COMMENT ON COLUMN board.movieCodeYoung IS '영화코드(진흥원)';

COMMENT ON COLUMN board.category IS '장르';

COMMENT ON COLUMN board.best IS '추천';

COMMENT ON COLUMN board.worst IS '비추천';

COMMENT ON COLUMN board.notify IS '신고';

COMMENT ON COLUMN board.enable IS '공개여부';

COMMENT ON COLUMN board.viewCount IS '조회수';

CREATE UNIQUE INDEX PK_board
	ON board (
		seq ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			seq
		);

/* review */
CREATE TABLE comment (
	postDate DATE NOT NULL, /* 작성일 */
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	seq NUMBER NOT NULL, /* 글번호 */
	content VARCHAR2(100) /* 내용 */
);

COMMENT ON TABLE comment IS 'review';

COMMENT ON COLUMN comment.postDate IS '작성일';

COMMENT ON COLUMN comment.userId IS '회원ID';

COMMENT ON COLUMN comment.seq IS '글번호';

COMMENT ON COLUMN comment.content IS '내용';

CREATE UNIQUE INDEX PK_comment
	ON comment (
		postDate ASC
	);

ALTER TABLE comment
	ADD
		CONSTRAINT PK_comment
		PRIMARY KEY (
			postDate
		);

/* social */
CREATE TABLE social (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	followingId VARCHAR2(100), /* 팔로잉ID */
	postDate DATE /* 작성일 */
);

COMMENT ON TABLE social IS 'social';

COMMENT ON COLUMN social.userId IS '회원ID';

COMMENT ON COLUMN social.followingId IS '팔로잉ID';

COMMENT ON COLUMN social.postDate IS '작성일';

/* user */
CREATE TABLE user (
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
	enable NUMBER default 1/* 활성화여부 */
);

COMMENT ON TABLE user IS 'user';

COMMENT ON COLUMN user.userId IS '회원ID';

COMMENT ON COLUMN user.name IS '이름';

COMMENT ON COLUMN user.pass IS '비밀번호';

COMMENT ON COLUMN user.phoneFirst IS '핸드폰번호1';

COMMENT ON COLUMN user.phoneMid IS '핸드폰번호2';

COMMENT ON COLUMN user.phoneLast IS '핸드폰번호3';

COMMENT ON COLUMN user.birth IS '생년월일';

COMMENT ON COLUMN user.gender IS '성별';

COMMENT ON COLUMN user.joinDate IS '가입일';

COMMENT ON COLUMN user.outDate IS '탈퇴일';

COMMENT ON COLUMN user.profile IS '회원사진';

COMMENT ON COLUMN user.enable IS '활성화여부';

CREATE UNIQUE INDEX PK_user
	ON user (
		userId ASC
	);

ALTER TABLE user
	ADD
		CONSTRAINT PK_user
		PRIMARY KEY (
			userId
		);

/* category */
CREATE TABLE category (
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	boardName VARCHAR2(100) /* 게시판명 */
);

COMMENT ON TABLE category IS 'category';

COMMENT ON COLUMN category.boardCode IS '게시판코드';

COMMENT ON COLUMN category.boardName IS '게시판명';

CREATE UNIQUE INDEX PK_category
	ON category (
		boardCode ASC
	);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			boardCode
		);

/* wishlist */
CREATE TABLE wishlist (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	code NUMBER NOT NULL, /* 코드 */
	movieCodeNaver VARCHAR2(500), /* 영화코드(네이버) */
	movieCodeYoung VARCHAR2(500), /* 영화코드(진흥원) */
	postDate DATE /* 작성일 */
);

COMMENT ON TABLE wishlist IS 'wishlist';

COMMENT ON COLUMN wishlist.userId IS '회원ID';

COMMENT ON COLUMN wishlist.code IS '코드';

COMMENT ON COLUMN wishlist.movieCodeNaver IS '영화코드(네이버)';

COMMENT ON COLUMN wishlist.movieCodeYoung IS '영화코드(진흥원)';

COMMENT ON COLUMN wishlist.postDate IS '작성일';

/* wishlistcate */
CREATE TABLE wishlistcate (
	code NUMBER NOT NULL, /* 코드 */
	category VARCHAR2(100) /* 분류명 */
);

COMMENT ON TABLE wishlistcate IS 'wishlistcate';

COMMENT ON COLUMN wishlistcate.code IS '코드';

COMMENT ON COLUMN wishlistcate.category IS '분류명';

CREATE UNIQUE INDEX PK_wishlistcate
	ON wishlistcate (
		code ASC
	);

ALTER TABLE wishlistcate
	ADD
		CONSTRAINT PK_wishlistcate
		PRIMARY KEY (
			code
		);

/* visitor */
CREATE TABLE visitor (
	connectDate DATE NOT NULL, /* 접속날짜 */
	visitor NUMBER DEFAULT 0 /* 방문자수 */
);

COMMENT ON TABLE visitor IS 'visitor';

COMMENT ON COLUMN visitor.connectDate IS '접속날짜';

COMMENT ON COLUMN visitor.visitor IS '방문자수';

CREATE UNIQUE INDEX PK_visitor
	ON visitor (
		connectDate ASC
	);

ALTER TABLE visitor
	ADD
		CONSTRAINT PK_visitor
		PRIMARY KEY (
			connectDate
		);

/* log */
CREATE TABLE log (
	logDate DATE NOT NULL, /* 활동시간 */
	logId VARCHAR2(100), /* 활동한ID */
	userId VARCHAR2(100), /* 작성자ID */
	logCate NUMBER, /* 활동분류 */
	subject VARCHAR2(100), /* 제목 */
	movieCodeYoung CLOB /* 영화코드(진흥원) */
);

COMMENT ON TABLE log IS 'log';

COMMENT ON COLUMN log.logDate IS '활동시간';

COMMENT ON COLUMN log.logId IS '활동한ID';

COMMENT ON COLUMN log.userId IS '작성자ID';

COMMENT ON COLUMN log.logCate IS '활동분류';

COMMENT ON COLUMN log.subject IS '제목';

COMMENT ON COLUMN log.movieCodeYoung IS '영화코드(진흥원)';

CREATE UNIQUE INDEX PK_log
	ON log (
		logDate ASC
	);

ALTER TABLE log
	ADD
		CONSTRAINT PK_log
		PRIMARY KEY (
			logDate
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_user_TO_board
		FOREIGN KEY (
			userId
		)
		REFERENCES user (
			userId
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			boardCode
		)
		REFERENCES category (
			boardCode
		);

ALTER TABLE comment
	ADD
		CONSTRAINT FK_user_TO_comment
		FOREIGN KEY (
			userId
		)
		REFERENCES user (
			userId
		);

ALTER TABLE comment
	ADD
		CONSTRAINT FK_board_TO_comment
		FOREIGN KEY (
			seq
		)
		REFERENCES board (
			seq
		);

ALTER TABLE social
	ADD
		CONSTRAINT FK_user_TO_social
		FOREIGN KEY (
			userId
		)
		REFERENCES user (
			userId
		);

ALTER TABLE wishlist
	ADD
		CONSTRAINT FK_wishlistcate_TO_wishlist
		FOREIGN KEY (
			code
		)
		REFERENCES wishlistcate (
			code
		);

ALTER TABLE wishlist
	ADD
		CONSTRAINT FK_user_TO_wishlist
		FOREIGN KEY (
			userId
		)
		REFERENCES user (
			userId
		);