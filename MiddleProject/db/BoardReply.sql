drop table reply cascade constraint;

create table reply(
				   no int,
				   r_no int auto_increment primary key,
				   r_n_id varchar(20),
				   r_contents varchar(500),
				   r_regdate date,
				   foreign key(r_n_id) references member(n_id) on delete cascade,
				   foreign key(no) references board(no) on delete cascade
				   );
				   
				   
insert into reply(no, r_n_id, r_contents, r_regdate) values(22,'유저02','넘모 이쁘네용 ><',now()); 
insert into reply(no, r_n_id, r_contents, r_regdate) values(22,'유저03','배고프다',now()); 
insert into reply(no, r_n_id, r_contents, r_regdate) values(22,'유저04','맛있겠당!',now()); 
insert into reply(no, r_n_id, r_contents, r_regdate) values(22,'유저05','귀여웡',now()); 


select * from reply;