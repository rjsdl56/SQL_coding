# 저장 프로시저 : SQL을 함수형태로 저장하고 사용하는 방법
# 저장 프로시저 정의
	# create procedure 프로지서명(인자 인자형, ~) 
    # begin 
		# SQL문장들 
    # end
    
# 저장 프로시저 호출
	# call 프로시저명;
# 저장 프로시저 삭제 
	# drop procedure 프로시저명;
    
# 저장 함수 : SQL을 함수형태로 저장하고 사용하는 방법
# 함수 정의 
	# create function 함수명(인자 인자형,~) returns 타입 
    # begin 
		# SQL문장들 
	# end
    
# 함수 호출
	# 함수명(인자);
# 함수 삭제
	# drop function 함수명;



# 트리거 : 특정한 조건이 되면 자동으로 호출되는 저장 프로시저 
# 트리거 정의
	# create trigger 트리거명 before(또는 after) CRUD on 테이블명 
		# for each row
	# begin
		# 변경 전 (OLD.컬럼명) 또는 변경 후 (NEW.컬럼명)을 이용한 처리
	# end
    
# 트리거 삭제
	# drop procedure 트리거명;
    



######################33

# 실습
# 저장 프로시저 실습
delimiter //
create procedure insert_lines()
begin 
	insert into city values(10000, 'Sample', 'KOR', 'Test' , 1000000);
    insert into city values(20000, 'SampleTest', 'KOR', 'Test' , 2000000);
end
//
delimiter ;

# 저장 프로시저 호출
call insert_lines();

# 레코드 확인
select * from city where id = 10000;
select * from city where id = 20000;


# 저장함수 실습
delimiter //
create function CountLines() returns integer
begin
	declare line_count integer;
	select count(*) into line_count from BusinessCard;
    return line_count;
end
//

delimiter ;

# 호출
CountLines(); # 에러
select CountLines() from dual;

truncate table BusinessCard; # 데이터 모두 삭제
select CountLines() from dual; # 0 출력



# 트리거 실습 -> BusinessCard 테이블에 레코드를 추가하면 BusinessCard2 테이블에도 자동 추가되는 트리거

# BusinessCard 스키마 확인
desc BusinessCard;

# BusinessCard2 테이블 만들기
create table BusinessCard2 (Name varchar(255), Address varchar(255), Telephone varchar(255));
desc BusinessCard2;

# 트리거 만들기
delimiter $
create trigger insertBusinessCard2Trigger after insert on BusinessCard for each row
begin 
	insert into BusinessCard2 values ('zzz', 'zzzz', '00000');
end $
delimiter ;

# BusinessCard에 레코드 넣기
insert into BusinessCard values ('Bob', 'Seoul', '123-4567');

# BusinessCard2 확인
select * from BusinessCard2;




