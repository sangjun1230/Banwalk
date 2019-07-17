//ORA-00054: 자원이 사용중이고, NOWAIT가 지정되어 있습니다 - table lock 걸려있을때 
select a.sid,a.serial#, a.status from v$session a, v$lock b, dba_objects c
where a.sid=b.sid and b.id1 = c.object_id and b.type='TM' and c.object_name='PET'
// 위의 결과에서 sid, serial# 나오는 값을 아래의 25,76 자리에 각각 넣고 실행
alter system kill session '25,76'


drop table member cascade constraint;
drop table pet cascade constraint;
drop table member;

create table member(
id varchar(20) primary key,
pw varchar(20) NOT NULL,
u_name varchar(20) NOT NULL,
n_id varchar(20) NOT NULL UNIQUE,
u_birthday date NOT NULL,
u_sex varchar(1) NOT NULL,
zonecode  varchar(20) NOT NULL,
sido  varchar(100) NOT NULL,
sigungu  varchar(100) NOT NULL,
roadname  varchar(100) NOT NULL,
d_juso varchar(100),
email varchar(20) NOT NULL UNIQUE,
tel varchar(20) NOT NULL,
status varchar(1),
manage varchar(1),
petcount int NOT NULL,
friend varchar(1),
f_id varchar(20)
);


insert into member values('user01','0001','김봄날','유저01','1901-01-01','1','15432','서울시','서초구','서운로 11길 35','서흥빌딩 6층 601호','user01@naver.com','010-01','1','1','1','1','user02');
insert into member values('user02','0002','강여름','유저02','1902-02-02','2','25432','서울시','서초구','서운로 11길 35','서흥빌딩 6층 602호','user02@naver.com','010-02','1','1','2','1','user01');
insert into member values('user03','0003','한소금','유저03','1903-03-03','1','35432','서울시','서초구','서운로 11길 35','서흥빌딩 6층 603호','user03@naver.com','010-03','1','1','1','1','user04');
insert into member values('user04','0004','고가을','유저04','1904-04-04','2','45432','서울시','서초구','서운로 11길 35','서흥빌딩 6층 604호','user04@naver.com','010-04','1','1','2','1','user03');
insert into member values('user05','0005','유빛나','유저05','1905-05-05','2','45432','서울시','서초구','서운로 11길 35','서흥빌딩 6층 604호','user05@naver.com','010-04','1','1','2','1','user03');


update member set n_id = 'aaa' where id = 'user09';

select * from member where id = 'user04';
delete from member where id = 'user01'

select * from member;

drop table pet;

create table pet(
            id varchar(20),
            p_name varchar(20),
            p_sex char,
            p_size char,
            p_birthdate date,
            primary key(id,p_name),
            foreign key(id) references member(id) on delete cascade
);


insert into pet values('user01','멍멍이01','1','1','18-02-01');
insert into pet values('user01','멍멍이02','2','3','18-02-01');
insert into pet values('user02','멍멍이03','1','1','18-02-07');
insert into pet values('user02','멍멍이04','2','3','18-01-01');
insert into pet values('user03','멍멍이05','1','1','18-02-01');
insert into pet values('user03','멍멍이06','2','3','18-02-01');
insert into pet values('user04','멍멍이07','1','1','18-02-07');
insert into pet values('user04','멍멍이08','2','3','18-01-01');
insert into pet values('user05','멍멍이08','2','3','18-01-01');


select * from pet;
select p.p_name, p.p_sex, p.p_size, p.p_birthdate from member m, pet p where m.id=p.id(+) and m.id='user01'
delete from pet where p_name='멍멍이07' and  id ='user04'
delete from pet where p_name ='멍멍이08'
insert into pet values ((select id from member where id='user05'),'멍멍이09','1','1','18-02-02');
	update pet set p_sex = '1' where id='user02' and p_name = '멍멍이04';