drop table garosu;

create table garosu(
	roadNo int auto_increment,
	sttreeStretNm varchar(100),
	startLnmadr varchar(100),
	startLatitude varchar(100),
	endLnmadr varchar(100),
	endLatitude varchar(100),
	sttreeKnd varchar(100),
	sttreeStretLt varchar(100),
	sttreeStretIntrcn varchar(4000),
	roadNm varchar(100),
	phoneNumber varchar(100),
	institutionNm varchar(100),
	referenceDate date,
	insttCode varchar(100),
	insttNm varchar(100),
	photoUrl varchar(4000),
	primary key(roadNo, sttreeStretNm)
);

roadNo, sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl

insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ( '가야1', '35.257898', '128.423638', '35.273099', '128.419783', '양버즘나무+은행나무', '1.8', '느티나무와 벚꽃이 피는 봄이 아름다운 길', '진함로', '055-580-4586', '함안군 산림녹지과', '2018-07-30', '5400000', '강서구','a1.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('잠원로','37.522367','127.016237','37.507118','127.009875','은행나무','2.4','주 가로수종 칠엽수, 2011년에 가중나무를 갱신하여 회화나무, 가중나무가 일부 혼식',null,null,null,'2018-07-13','3210000','강서구','a2.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('효령로','37.489338','127.030905','37.476453','126.985423','은행나무','4.3','주 가로수종 양버즘나무, 일부 구간에 은행나무, 느티나무, 회화나무 및 대왕참나무 혼식',null,null,null,'2018-07-13','3210000','강서구','a3.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('헌릉로','37.465402','127.044014','37.463511','127.091447','느티나무','8.5','전 구간 느티나무 식재, 가로 중앙부 녹지대 또한 같은 수종으로 식재되어 있음',null,null,null,'2018-07-13','3210000','강서구','a4.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('과천대로','37.475804','126.982068','37.460668','126.988256','은행나무','2.4','주 가로수종은 은행나무, 남태령 및 방배래미안 아파트 인근에 띠녹지 조성되어 있음',null,null,null,'2018-07-13','3210000','서초구','a5.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('고무래로','37.503853','127.009065','37.500203','127.019284','느티나무','1.06','상가지역 300미터 구간에 양호한 회화나무 식재, 아파트 단지 주변은 느티나무 및 은행나무',null,null,null,'2018-07-13','3210000','서초구','a6.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('나루터로','37.517267','127.010716','37.516113','127.018807','은행나무','0.89','주 가로수종 가중나무 및 은행나무 식재, 일부 대왕참나무 혼식',null,null,null,'2018-07-13','3210000','서초구','a7.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('나루터로4길','37.515146','127.013706','37.509331','127.011483','양버즘나무','0.78','전구간 양버즘나무로 식재, 수형이 양호함, 일부 은행나무 및 가중나무 혼식',null,null,null,'2018-07-13','3210000','서초구','a8.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('형촌2길','37.466713','127.020322','37.465536','127.020726','느티나무','0.35','느티',null,null,null,'2018-07-13','3210000','마포구','a9.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('잠원로8길','37.515969','127.010735','37.515803','127.009437','느티나무','0.48','전 구간이 느티나무로 식재, 외부 녹지대로 인해 녹음량 풍부',null,null,null,'2018-07-13','3210000','마포구','a10.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('잠원로14길','37.520152','127.016473','37.515582','127.013587','양버즘나무','0.64','주 가로수종은 양버즘나무, 그 외 회화나무, 메타세콰이어, 은행나무 일부 혼식됨',null,null,null,'2018-07-13','3210000','마포구','a1.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('남부순환로325길','37.484563','127.014697','37.481177','127.014417','느티나무','0.4','주 수종은 느티나무와 벚나무, 서초한신, 경남아너스빌 쪽에 200m 가로 띠녹지 조성',null,null,null,'2018-07-13','3210000','마포구','a2.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('효령로','37.489338','127.030905','37.476453','126.985423','은행나무','4.3','주 가로수종 양버즘나무, 일부 구간에 은행나무, 느티나무, 회화나무 및 대왕참나무 혼식',null,null,null,'2018-07-13','3210000','영등포구','a3.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('헌릉로','37.465402','127.044014','37.463511','127.091447','느티나무','8.5','전 구간 느티나무 식재, 가로 중앙부 녹지대 또한 같은 수종으로 식재되어 있음',null,null,null,'2018-07-13','3210000','영등포구','a4.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('과천대로','37.475804','126.982068','37.460668','126.988256','은행나무','2.4','주 가로수종은 은행나무, 남태령 및 방배래미안 아파트 인근에 띠녹지 조성되어 있음',null,null,null,'2018-07-13','3210000','영등포구','a5.jpg');
insert into garosu(sttreeStretNm, startLnmadr, startLatitude, endLnmadr, endLatitude, sttreeKnd, sttreeStretLt, sttreeStretIntrcn, roadNm, phoneNumber, institutionNm, referenceDate, insttCode, insttNm, photoUrl) values ('고무래로','37.503853','127.009065','37.500203','127.019284','느티나무','1.06','상가지역 300미터 구간에 양호한 회화나무 식재, 아파트 단지 주변은 느티나무 및 은행나무',null,null,null,'2018-07-13','3210000','영등포구','a6.jpg');


delete from garosu;

select * from garosu


select * from member join pet using(id) where id = 'user01' and pw = 0001