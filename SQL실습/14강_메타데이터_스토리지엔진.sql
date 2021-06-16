# 메타 데이터 : 데이터를 위한 데이터
# DB, 테이블의 스키마에 대한 정보를 저장하는 테이블

# 메타 데이터 개념
	# 데이터 사전 
		# 데이터베이스의 정보 저장
		# 시스템 카탈로그
        # 읽기 전용 정보
        
	# 데이터 디렉토리
		# DBMS의 모든 데이터가 저장되는 디렉토리
        # DB 저장, 상태 및 로그저장
        
# 캐릭터셋과 콜레이션
	# 캐릭터셋 : 문자 인코딩 정보를 지정
	# 콜레이션 : 정렬 시에 대소문자를 구분할지 여부 지정
    
# 스토리지 엔진
# DBMS가 데이터를 CRUD할 때 사용하는 기본적인 컴포넌트
# MySQL 엔진은 MyISAM / InnoDB 등이 있음
	# InnoDB : 트랙잭션 지원 / 업데이트 위주 / 줄단위 락 / 복구 용이 / 동시처리성능 높음 (기본값)
    # MyISAM : 상대적으로 높은 성능 / 읽기 위주 / 테이블 단위 락

# 실습 데이터 불러오기
show databases;
use information_schema;
show tables;

# engine 확인
show engines; # InnoDB가 Default

use world;
show columns from city; # city 테이블의 컬럼들
show index from city; # index가 2개가 있음 

# status; 현재 사용 중인 DB 정보

show variables like '%char%';
show variables like '%engine%';

# 캐릭터셋 변경
alter database world character set utf8 collate utf8_general_ci;

# 특정 테이블 변경
alter table city character set utf8 collate utf8_general_ci;

# 새로운 DB 생성 후 
create database sampleTestDB; # 아무것도 지정 안하고 생성
create database sampleTestDB2 default character set utf8 collate utf8_general_ci; # 문자 지정

show engines;
select engine, support from information_schema.engines where support='default';
select engine, support from information_schema.engines;

# 기본 엔진 바꾸기
set default_storage_engine = 'MyISAM';

# 확인
show variables like '%storage_engine%'













