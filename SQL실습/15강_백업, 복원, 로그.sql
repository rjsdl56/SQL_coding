# 데이터베이스 백업 (콘솔창)
	# 전체 데이터베이스 백업
	# mysqldump -u아이디 -p --all-databases > 덤프파일명.sql
	# 특정 데이터베이스 백업
	# mysqldump -u아이디 -p --databases DB명 > 덤프파일명.sql
	# 특정 테이블 백업
	# mysqldump -u아이디 -p DB명 테이블명 > 덤프파일명.sql
	# 스키마만 백업 (데이터 X)
	# mysqldump -u아이디 -p --no-data ... 
	# 데이터만 백업 (스키마 제외)
	# mysqldump -u아이디 -p --no-create-info ... 

# 데이터베이스 백업 (워크벤치 GUI)
	# Administration -> DataExport -> Export Options -> Export to Self-Contained File
    # Tables to Export
    # 테이블 선택
    # Dump Structure and Data / Structure Only / Data Only
    # Export 버튼
    

# 데이터베이스 복원 (콘솔)
	# mysql -u아이디 -p DB명 < 파일명
    # mysql -u아이디 -p < 파일명
    # mysql -u아이디 -p DB명 테이블명 < 파일명
    
# 데이터베이스 복원 (프롬프트)
	# SQL > source 파일명

# 데이터베이스 복원 (워크벤치)
	# Administarion -> Data Import -> Import from Self-Contained File
    # Default Schema to be imported to DB명 (어디에 복원할 지)
    # Data Structure and Data / Dump Data Only / Dump Structure (어떤 것들을 복원할 것인지)
    # Import 버튼 (복원)
    

# 데이터베이스 로그
	# 에러로그 / 일반로그 / 슬로우 쿼리 로그 / 이진 로그 / 릴레이 로그
    

# 덤프와 복원에 대한 실습 cmd 창
# cd C:\Program Files\MySQL\MySQL Server 8.0\bin 로 이동
# C:\Program Files\MySQL\MySQL Server 8.0\bin> dir 로 안의 파일들 확인

# 복제
# 모든 데이터베이스를 all.sql 이라는 파일에 저장
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p --all-databases > all.sql

# sql 파일 확인
# C:\Program Files\MySQL\MySQL Server 8.0\bin>dir *.sql

# 특정 데이터베이스만 복제 (world 데이터베이스 복제)
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p --databases world > world.sql

# 특정 테이블만 복제 (world 데이터베이스의 city 테이블 복제)
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p world city > city.sql

# 스키마만 복제
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p world country --no-data > country_schema.sql

# 데이터만 복제
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqlbump -uroot -p world country --no-create-info > country_data.sql


# 데이터베이스 복원 
# 우선 삭제
use world;
show tables;
drop database world;
# DB 생성
create database world;

# 콘솔창에서 world.sql 파일로 복원
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -uroot -p world < world.sql



# 데이터 테이블 복원
# 우선 먼저 table drop
drop table city;

# 콘솔창에서 테이블 복원
# C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -uroot -p world < city.sql



# 로그 남기기 설정
# my.ini 에서 general log 를 남기려면 general-log를 1로 바꿈
# 



