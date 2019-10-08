--userid를 삭제시 그 해당 유저가 했던것 모두 삭제 
--게시판(스터디 그룹)을 삭제시 댓글, 유저 다 삭제 
----------------------------------------------------------------------usertable---------
create table userTable(
usernum number,
userid VARCHAR2(20) primary key,
username VARCHAR2(20),
userpassword varchar2(20),
useremail varchar2(100),
content varchar2(1000),
mypicture varchar2(400)
);
create sequence user_num_seq 
start with 1 
increment by 1
nocache
nocycle;
----------------------------------------------------------------------------study--------
create table study(
   	num number ,
    studyid number primary key,
   	userid varchar2(20)not null,
    constraint userid_fk foreign key (userid) references usertable (userid) on delete cascade,
	subject varchar2(100),
	reg_date date,
	readcount number default 0, 
	semicontent varchar2(1000),
    content clob,  -- clob 엄청 큰 자료?내용?을 받을 때 사용함
	main_photo varchar2(300)
); --9

create sequence study_num_seq 
start with 1 
increment by 1
nocache
nocycle;
------------------------------room---------------------------------------------------------
create table room(
roomnum number not null,
userid VARCHAR2(20) not null,
constraint userid1_fk foreign key (userid) references usertable (userid) on delete cascade,
studyid number,
foreign key (studyid) references study (studyid) on delete cascade
);

ALTER TABLE room ADD UNIQUE(studyid,userid);

create sequence room_num_seq 
start with 1 
increment by 1
nocache
nocycle;
--------------------------------------------chat--------------------------------------
create table chat(
chatNum number primary key,
studyid number not null,
CONSTRAINT studyid_fk foreign key (studyid) references study (studyid) on delete cascade,
userid Varchar2(20),
CONSTRAINT userid2_fk foreign key (userid) references usertable (userid) on delete cascade,
today date,
content varchar2(1000)
);
create sequence chat_num_seq
start with 1
increment by 1
nocache
nocycle;
-------------------------------------notice----------------------------------------
create table notice(
   	num number,
   	userId varchar2(20) not null,
    CONSTRAINT userid3_fk foreign key (userId) references usertable (userid) on delete cascade,
	subject varchar2(50),
	reg_date date,
	readcount number default 0,
    content clob
);
create sequence notice_num_seq 
start with 1 
increment by 1
nocache
nocycle;
-----------------------------------------freeboard---------------------------------------
create table freeboard(
   	num number primary key,
   	userId varchar2(20) not null,
	subject varchar2(50),
	reg_date date,
	readcount number default 0, 
	ref number, 
	re_step number, 
	re_level number, 
	content clob,
	ip varchar2(20),
    upload varchar2(300),
    CONSTRAINT userid4_fk FOREIGN KEY(userId) references userTable(userId) on delete cascade
);
create sequence freeboard_num_seq 
start with 1 increment by 1
nocache
nocycle;

commit;

select * from room;
select * from freeboard;
select * from notice;
select * from usertable;
select * from study;
select*from chat;

drop table chat;
drop table room;
drop table study;
drop table freeboard;
drop table notice;
drop table usertable;

drop sequence chat_num_seq;
drop sequence room_num_seq;
drop sequence study_num_seq;
drop sequence freeboard_num_seq;
drop sequence notice_num_seq;
drop sequence user_num_seq;