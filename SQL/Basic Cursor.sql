---1) print empid empname from table employee using cursor

declare @id int, @name varchar(30)
print '------------EMPLOYEE DETAILS--------------'
declare emp_Cursor cursor for select id,name from employee order by id
open  emp_cursor
fetch next from emp_cursor into @id, @name
print '  Employee_id  Employee_name'
while @@FETCH_STATUS=0
begin
print '     '+cast(@id as varchar(20))+ '            '+cast(@name as varchar(30))
fetch next from emp_cursor into @id, @name
end
close emp_cursor
deallocate emp_cursor

--2)In the first example, we want to get all cities ids and names, together with their related country names. We’ll use the PRINT command to print combinations in each pass of the loop.
--Ref URL: https://www.sqlshack.com/learn-sql-sql-server-cursors/ 

-- declare variables used in cursor
DECLARE @city_name VARCHAR(128);
DECLARE @country_name VARCHAR(128);
DECLARE @city_id INT;
 
-- declare cursor
DECLARE cursor_city_country CURSOR FOR
  SELECT city.id, TRIM(city.city_name), TRIM(country.country_name)
  FROM city
  INNER JOIN country ON city.country_id = country.id;
 
-- open cursor
OPEN cursor_city_country;
 
-- loop through a cursor
FETCH NEXT FROM cursor_city_country INTO @city_id, @city_name, @country_name;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('city id: ', @city_id, ' / city name: ', @city_name, ' / country name: ', @country_name);
    FETCH NEXT FROM cursor_city_country INTO @city_id, @city_name, @country_name;
    END;
 
-- close and deallocate cursor
CLOSE cursor_city_country;
DEALLOCATE cursor_city_country;