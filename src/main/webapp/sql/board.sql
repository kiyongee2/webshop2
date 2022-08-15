-- board ���̺� ����
create table board(
	num int primary key auto_increment,
	name varchar(20) not null,
	subject varchar(100) not null,
	content text not null,
	write_date timestamp default now(),
	hit int,
	id varchar(10) not null,
	constraint fk_member_board foreign key(id) 
    references member(id) on delete cascade
);

insert into board values (1, '������', '�����Դϴ�.', '�� �����Դϴ�.', default, 0, 'cloud');

select * from board;