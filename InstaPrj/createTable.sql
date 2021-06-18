-- 테이블 삭제
drop table USER_TB cascade constraints;
drop table PRED_LIKE cascade constraints;
drop table RESULT_TB cascade constraints;
drop table BOARD cascade constraints;
drop table NOW_F4F cascade constraints;
drop table PAST_F4F cascade constraints;

-- 시퀀스 삭제
drop sequence BOARD_NUM_SEQ;
drop sequence PRED_LIKE_NUM_SEQ;

-- USER 테이블
create table USER_TB(
	USER_ID varchar2(100),
    USER_PW varchar2(100),
    INSTA_ID varchar2(100),
    constraint USER_TB_USER_ID_PK primary key(USER_ID),
    constraint USER_TB_INSTA_ID_UK unique(INSTA_ID)
);

-- PRED_LIKE 테이블
create table PRED_LIKE(
	PRED_LIKE_NUM number(10),
    PRED_INSTA_ID varchar2(100),
    UPLOAD_DAY varchar2(100),
    UPLOAD_TIME varchar2(100),
    HASHTAG varchar2(500),
    FILE_NAME varchar2(300),
    DATE_D date default sysdate,
    constraint PRED_LIKE_NUM_PK primary key(PRED_LIKE_NUM),
    constraint PRED_LIKE_PRED_INSTA_ID_FK foreign key(PRED_INSTA_ID) references USER_TB(INSTA_ID)
);

-- RESULT 테이블
create table RESULT_TB(
    RESULT_NUM number(10),
    LIKE_NUM number(10),
    REC_HASHTAG varchar2(500),
    constraint RESULT_RESULT_NUM_FK foreign key(RESULT_NUM) references PRED_LIKE(PRED_LIKE_NUM)
);

-- BOARD 테이블
create table BOARD(
    BOARD_NUM number(10),
    BOARD_USER_ID varchar2(100),
    BOARD_TITLE varchar2(100),
    BOARD_CONTENT varchar2(1000),
    BOARD_FILE_NAME varchar2(300),
    BOARD_DATE date default sysdate,
    constraint BOARD_BOARD_USER_ID_FK foreign key(BOARD_USER_ID) references USER_TB(USER_ID)
);

-- NOW_F4F 테이블
create table NOW_F4F(
    NOW_USER_ID varchar2(100),
    NOW_F4F_ID varchar2(100),
    NOW_DATE date default sysdate,
    constraint NOW_F4F_NOW_USER_ID_FK foreign key(NOW_USER_ID) references USER_TB(USER_ID)
);

-- PAST_F4F 테이블
create table PAST_F4F(
    PAST_USER_ID varchar2(100),
    PAST_F4F_ID varchar2(100),
    PAST_DATE date,
    constraint PAST_F4F_PAST_USER_ID_FK foreign key(PAST_USER_ID) references USER_TB(USER_ID)
);

-- 시퀀스 생성
create sequence BOARD_NUM_SEQ start with 1 increment by 1;
create sequence PRED_LIKE_NUM_SEQ start with 1 increment by 1;

commit

insert into USER_TB values('test2','1234','test');
select * from USER_TB;
select * from board;