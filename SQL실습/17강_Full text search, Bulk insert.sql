# 전문검색 (Full text search) - like 검색 보완 (and나 or 를 사용하면 큰 부하)
	# 기본적으로 컬럼 내용 전체를 단순 문자열로 생각하고 검색하는 방식
    # 문자편집기의 편집 찾기/바꾸기 메뉴의 동작방식과 유시
    
    # mysql의 full text search 방식
		# 자연어검색 : where match(컬럼명) against('검색어/검색문장')
			# 검색의 정확도 확인 as score
            # 결과는 검색의 정확도에 대한 내림차순 정렬
            
        # 불린검색 : where match(컬럼명) against("단어*" -제외단어 in boolean mode);
			# 검색의 정확도에 따른 정렬이 안되고 연사자 사용한 구문 검색 가능
            # 필수단어 (+) / 예외단어 (-) / 부분단어 (*)
            
        # 쿼리 확장 검색
	# Full text search 인덱스 생성
		# alter table 테이블명 add fulltext(컬럼명);
        
	# 설정파일 수정 
		# my.ini 파일에서 ft_min_word_len = 2 로 바꿔서 2자 이상으로 검색 가능
        # 기존의 full text index가 있었으면 인덱스 재구성 : repair table 테이블명 quick;


# Bulk Insert
	# insert의 경우 레코드를 추가한 후 내부적으로 인덱스 재구성 작업이 필요
    # 이때 여러 개의 레코드를 넣어야 하는 경우 하나의 레코드를 입력할 때마다 이 작업이 연속적으로 발생 -> 문제
    # 이를 해결하기 위한 bulk insert
    
    # 락을 건 뒤에 나중에 인덱스
		# 인덱스 작업 정지 : alter table '테이블명' disable keys;
		# 인덱스 작업 재설정 : alter table '테이블명' enable keys;
    
		# SQL insert into 방식으로 레코드 추가
			# insert into ~ values ~ 를 여러 번 나열
            
            
	# 이러한 csv 파일 입출력의 경우, 보안문제로 특정 디렉토리에만 가능하도록 설정해야 함
		# my.ini 파일에서 secure-file-priv= ~~~
        
		# CSV 파일을 사용한 입력방식
			# load data infile '~~~path' into table 테이블명
		# 데이터 내용을 csv로 출력방식
			# select * from 테이블명 into outfile '~~~~path'
            
	
    
# 실습
use world;
show variables like 'secure%'; # 해당 위치에만 저장 -> uploads
    
# country table을 csv 파일로 저장
select name, code into outfile "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\country.csv" fields terminated by "," from country;

# 로드하기 위해서는 새로운 테이블
create table sample_country (Name varchar(255), Code varchar(255));

# 로드
load data infile "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\country.csv" into table sample_country fields terminated by ",";