# 파티셔닝 / 샤딩 / 데이터베이스 복제

# VLDB
	# 전체 DB가 하나의 DBMS시스템에 다 들어가기 힘들어지는 경우
		# - 테이블들을 여러 개의 군으로 나눠 분산저장
        # - 하나의 테이블이 방대한 경우에는 사전방식으로 나눠 저장

# 파티셔닝
	# DBMS 레벨 분할
    # 제약사항
		# 테이블단위 연산이 힘들어짐
        # 외래키의 효용문제

# 샤딩
	# DBMS 외부에서 분할 / 응용레벨에서 구별해야 함
    
    

# 복제
	# 로그기반 복제
		# Statement Based : SQL 문장 복제
        # Row Based : SQL 에 따라 변경된 라인만 기록하는 방식
        # Mixed : 두 방식 복합



# 실습
# 데이터베이스 확인
show databases;

# 데이터베이스 생성
create database sampleTestDB;

# sampleTestDB 사용
use sampleTestDB;

# 테이블 확인
show tables;

# 테이블 생성
create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255), CreationTime DATE) PARTITION BY RANGE(YEAR(CreationTime)) (PARTITION p0 VALUES LESS THAN (2013), PARTITION p1 VALUES LESS THAN (MAXVALUE));

# 테이블 확인
desc BusinessCard;
show create table BusinessCard; 
select * from BusinessCard;

# record add
insert into BusinessCard values ('Bob', 'Seoul', '123-4567', '2010-01-01');
insert into BusinessCard values ('Sam', 'Busan', '321-4567', '2015-01-01');

# 2014년 이후 불러오기
select * from BusinessCard where CreationTime > '2014-01-01';

# 컬럼변화 -> 파티션 변화
update BusinessCard set CreationTime = '2016-01-01' where Name = 'Bob';

# 2014년 이후 불러오기
select * from BusinessCard where CreationTime > '2014-01-01';