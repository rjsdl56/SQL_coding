# 트랜잭션 : 복수의 SQL 문을 수행하는 도중에 장애가 발생했을 때 장애에 대응할 수 있도록 하는 기능
	# InnoDB 스토리지 엔진만 가능
    # 전체수행과 전체취소 두 가지가 결과값만 
    # 트랜잭션을 지원하기 위해서는 AutoCommit 모드를 off

	# ACID 특성
		# 원자성 : 모두 하거나, 모두 안하거나
        # 일관성 : 트랜잭션 이전, 이후 데이터 차이가 없음
        # 고립성/격리수준 : 여러 개의 트랜잭션이 수행될 때 성능과 데이터 안정성간의 trade off
        # 지속성 : 트랜잭션 종료 이후에도 데이터 문제 없음
        
# 락 : 리소스에 대해 여러 개의 트랜잭션이 접근하려고 경쟁할 때 제어하는 방법
	# 동시성 제어라고 하며 보통 lock으로 해결
    # 동기화라고 함
    # 일관성과 무결성을 지키기 위해서 적용
	# 테이블 단위 락(MyISAM)과 줄 단위 락(InnoDB - 테이블 락보다 높은 성능)이 있음 

	
# 격리수준 : 트랜잭션에 일관성이 없는 데이터를 허용하는 레벨
      # Read Uncommited : 트랜잭션이 처리되는 도중에 다른 트랜잭션이 해당 데이터를 읽기 허용
      # *Read commited* : 트랜잭션이 끝난 이후에만 접근하도록 허용
      # Repeatable Read : 다른 트랜잭셕이 업데이트하는 것은 금지하지만 레코드 추가는 허용
      # Serializable : 트랜잭션이 동시에 수행되는 것이 금지되고 순차적으로 진행
      
      
# 실습
# autocommit 확인
select @@autocommit;

# autocommit off
set autocommit = 0;

# autocommit 확인
select @@autocommit;

 # 샘플 데이터베에스 생성
 create database sampleDB;
 
 # 해당 데이터베이스 사용
 use sampleDB;
 
 # 테이블 생성
 create table BusinessCard (Name varchar(255), Address varchar(255), Telephone varchar(255));
 
 # 레코드 입력
 insert into BusinessCard values ('Bob', 'Seoul', '123-4567');
 
 # DB 에 반영하기 위해 commit
 commit ;
 
 # autocommit auto로 바꾸기
 set autocommit = 1;
 
 ###########
 
 # 트랜잭션 설정
 select @@tx_isolation;
 
 # isolation 값 변환
 set tx_isolation = 'READ-COMMITED';
 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        