drop table board cascade constraint;

create table board(
	no int auto_increment primary key,
	title varchar(100) not null,
	viewcount int not null,
	regdate date not null,
	subtitle varchar(10),
	n_id varchar(20),
	contentType char,
	contents varchar(3600) not null,
	url varchar(2000),
	foreign key(n_id) references member(n_id) on delete cascade
	);

insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('따로 표현하는 방법은',232,'19-03-28','정보','유저01','1','이는 어느 한 ... 합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('관계형 데이터베이스',22,'19-03-27','정보','유저01','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('키는 각각 튜플',123,'19-03-26','정보','유저01','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('이터 정의언어로 작성',40,'19-03-25','정보','유저01','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values(' 슈퍼키(Super Key) : 복합키(은',96,'19-03-24','정보','유저02','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('조양호 이어 박삼구도은',1315,'19-03-23','정보','유저02','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('채용법  국회 본회의 통과',156,'19-03-22','정보','유저02','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('기초학력 미달 증',978,'19-03-20','정보','유저03','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('코스피 2,120대로 ',1523,'19-03-21','정보','유저03','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('김학의 출국금지 여부 미리 알아봤다은',4156,'19-03-22','정보','유저04','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('행 추락사 10대들…최대 징역 10년 구형',15,'19-03-28','정보','유저04','1','이는 어느 한 ... 슈퍼키란, 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합을 말합니다.','');


insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저01','2','날씨 넘나 좋음^~^','a1.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저02','2','날씨 넘나 좋음^~^','a2.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저03','2','날씨 넘나 좋음^~^','a3.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저01','2','날씨 넘나 좋음^~^','a4.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저02','2','날씨 넘나 좋음^~^','a5.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저03','2','날씨 넘나 좋음^~^','a6.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저01','2','날씨 넘나 좋음^~^','a7.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저02','2','날씨 넘나 좋음^~^','a8.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저03','2','날씨 넘나 좋음^~^','a9.jpg');
insert into board(title, viewcount, regdate, subtitle, n_id, contentType, contents, url) values('산책로 추천',0,now(),null,'유저03','2','날씨 넘나 좋음^~^','a10.jpg');

select * from board;