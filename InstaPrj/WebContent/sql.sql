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
    USER_PW varchar2(100) NOT NULL,
    INSTA_ID varchar2(100),
    constraint USER_TB_USER_ID_PK primary key(USER_ID),
    constraint USER_TB_INSTA_ID_UK unique(INSTA_ID)
);

-- PRED_LIKE 테이블
create table PRED_LIKE(
	PRED_LIKE_NUM number(10),
    PRED_INSTA_ID varchar2(100) NOT NULL,
    UPLOAD_DAY varchar2(100) NOT NULL,
    UPLOAD_TIME varchar2(100) NOT NULL,
    HASHTAG varchar2(500) NOT NULL,
    FILE_NAME varchar2(300) NOT NULL,
    ACCOUNT_TAG number(10) NOT NULL, 
    PLACE_TAG number(10) NOT NULL,
    PED_DATE date default sysdate NOT NULL,
    constraint PRED_LIKE_NUM_PK primary key(PRED_LIKE_NUM),
    constraint PRED_LIKE_PRED_INSTA_ID_FK foreign key(PRED_INSTA_ID) references USER_TB(INSTA_ID)
);

-- RESULT 테이블
create table RESULT_TB(
    RESULT_NUM number(10) NOT NULL,
    REC_HASHTAG varchar2(500) NOT NULL,
    RESULT_LIKE number(10) NOT NULL,
    constraint RESULT_RESULT_NUM_FK foreign key(RESULT_NUM) references PRED_LIKE(PRED_LIKE_NUM)
);

-- BOARD 테이블
create table BOARD(
    BOARD_NUM number(10) NOT NULL,
    BOARD_USER_ID varchar2(100) NOT NULL,
    BOARD_TITLE varchar2(100) NOT NULL,
    BOARD_CONTENT varchar2(1000) NOT NULL,
    BOARD_FILE_NAME varchar2(300) NOT NULL,
    BOARD_DATE date default sysdate NOT NULL,
    constraint BOARD_BOARD_USER_ID_FK foreign key(BOARD_USER_ID) references USER_TB(USER_ID)
);


-- PAST_F4F 테이블
create table PAST_F4F(
    PAST_USER_ID varchar2(100) NOT NULL,
    PAST_F4F_ID varchar2(100) NOT NULL,
    PAST_DATE date NOT NULL,
    constraint PAST_F4F_PAST_USER_ID_FK foreign key(PAST_USER_ID) references USER_TB(USER_ID)
);

-- 시퀀스 생성
create sequence BOARD_NUM_SEQ start with 1 increment by 1;
create sequence PRED_LIKE_NUM_SEQ start with 1 increment by 1;

insert into USER_TB values('lch8216','1234','lch.98');
commit

select * from USER_TB;
select * from PAST_F4F;
select * from PRED_LIKE;
select * from PRED_LIKE;