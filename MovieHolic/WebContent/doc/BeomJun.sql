-- 오라클 한글 한글자 바이트 인식
SELECT *
FROM NLS_DATABASE_PARAMETERS
WHERE PARAMETER = 'NLS_CHARACTERSET';

-- 삭제
drop table mh_user;

/* mh_user */
CREATE TABLE mh_user (
	userId VARCHAR2(100) NOT NULL, /* 회원ID */
	name VARCHAR2(16), /* 이름 */
	pass VARCHAR2(100), /* 비밀번호 */
	phoneFirst VARCHAR2(3), /* 핸드폰번호1 */
	phoneMid VARCHAR2(4), /* 핸드폰번호2 */
	phoneLast VARCHAR2(4), /* 핸드폰번호3 */
	birth VARCHAR2(16), /* 생년월일 */
	gender VARCHAR2(3), /* 성별 */
	joinDate DATE, /* 가입일 */
	outDate DATE, /* 탈퇴일 */
	profile VARCHAR2(200), /* 회원사진 */
	enable NUMBER default 0/* 활성화여부 */
);

insert into mh_user values('qjawns0618@naver.com', '권범준', 'kitri', '010', '5419', '0583', '940618', '남', sysdate, null, null, 0);
insert into mh_user values('guswjd@naver.com', '정현정', 'sss', '010', '1111', '1111', '111111', '여', sysdate, null, null, 0);
insert into mh_user values('aaaa@naver.com', '이소담', 'sss', '010', '1111', '1111', '111111', '남', sysdate, null, null, 0);
insert into mh_user values('ddddd@naver.com', '박광규', 'sss', '010', '1111', '1111', '111111', '남', sysdate, null, null, 0);
insert into mh_user values('ffff@naver.com', '갓졍', 'fdsfe',  '010', '1111', '1111', '111111', '신', sysdate, sysdate, null, 1);
insert into mh_user values('cced@naver.com', '홍길동', 'eqwd',  '010', '1111', '1111', '111111', '서', sysdate, sysdate, null, 1);
insert into mh_user values('sdfsdf@naver.com', '성공이라', 'cvds', '010', '1111', '1111', '111111', '남', sysdate, sysdate, null, 1);
insert into mh_user values('gbaus@naver.com', '휴면파트', 'gbaus',  '010', '1111', '1111', '111111', '남', sysdate, null, null, 1);
insert into mh_user values('xkfxhl@naver.com', '탈퇴파트', 'xkfxhl',  '010', '1111', '1111', '111111', '남', sysdate, sysdate, null, 0);
insert into mh_user values('TKDTKD@naver.com', '휴면탈퇴', 'gbxkf', '010', '1111', '1111', '111111', '남', sysdate, sysdate, null, 1);



select userId,name,birth,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate,enable from mh_user;
select userId,name,birth,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate,enable from mh_user where outDate is null;

select COUNT(*)
from (select userId,name,birth,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate,enable from mh_user);

-- 페이징 처리

select rownum,userid,name,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate,enable
from mh_user
where rownum between 1 and 5;

select userid,name,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate,enable
from ( select rownum r,userid,name,phoneFirst,phoneMid,phoneLast,gender,joinDate,outDate,enable
        from mh_user
        where outDate is null)
where r between 1 and 5;


select COUNT(*)
from (select userId,name,birth,
    phoneFirst,phoneMid,phoneLast,
    gender,joinDate,outDate,enable 
    from mh_user);


-- 토탈 페이지 목록 수.
select count(*) from mh_user;

commit;


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
	best NUMBER default 0, /* 추천 */
	worst NUMBER default 0, /* 비추천 */
	notify NUMBER default 0, /* 신고 */
	enable NUMBER default 0, /* 공개여부 */
	viewCount NUMBER default 0/* 조회수 */
);

CREATE TABLE mh_category (
	boardCode NUMBER NOT NULL, /* 게시판코드 */
	boardName VARCHAR2(100) /* 게시판명 */
);


--번호 분류 작성자id 제목 내용 작성일 신고수


select * from mh_board;

-- 번호로 글 삭제시켜보기.

select *
from mh_board
where notify != 0;

select *
from mh_comment;

delete from mh_comment
where seq = 13;

delete from mh_board
where seq = 6;

ROLLBACK;









		--list에 담기
		-- 샘플
		-- 가입년도 (2000 년도 이하는 안뎀) 20대
		select COUNT(*)
		from mh_user
		-- 2017년도
		where to_char(joindate,'yyyy') = ?
		-- 20대 가입하고 있는 수
		and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30;

		--빼주기
		
		-- 20대 탈퇴날짜 명수
		select COUNT(*)
		from mh_user
		-- 20대
		where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30
		-- 탈퇴날짜
		and to_number(to_char(outdate,'yyyy')) = ?;
		
		
		
select ((select COUNT(*)
        from mh_user
        where to_char(joindate,'yyyy') <= 2019
        and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30)
        -
        (select COUNT(*)
        from mh_user
        where (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) >= 20 and (to_char(sysdate,'yyyy') - to_number(substr(birth,1,4)) + 1) < 30
        and to_number(to_char(outdate,'yyyy')) <= 2019))   
from dual;


