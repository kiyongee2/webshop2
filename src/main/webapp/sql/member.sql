-- member ���̺�
create table member(
	id varchar(10) not null,
	password varchar(10) not null,
	name varchar(20) not null,
	gender varchar(4),
	birth varchar(20),
	mail varchar(30),
	phone varchar(20),
	address varchar(50),
	regist_day varchar(20),
	primary key(id)
);

insert into member 
values('cloud', 'm123456@', '������', '��', '1995-10-09', 'cloud@sky.com', 
    '010-1234-5678', '����� ����', '2022-08-15');

select * from member;
