show databases;
use jspdb;
show tables;
select * from student;

-- engineer 테이블 생성
CREATE TABLE engineer(
	eid INT NOT NULL AUTO_INCREMENT,
	name  VARCHAR(20) NOT NULL,
	passwd VARCHAR(20) NOT NULL,
	PRIMARY KEY(eid)
);

INSERT INTO engineer VALUES (1, 'Bill', 'm1234');
INSERT INTO engineer VALUES (2, '이강', 'm2345');