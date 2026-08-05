-- functions
-- why do we need function : functions are used for code reusability  and used when we need to do calucations , It returns the single value
-- 2 types  1 . predefined functions  2. user defined functions
-- Difference between the stored procedure and functions : procedures are called by using 'call procedure procedure_name'but where as in function we call by using the 'select'
  -- Syntax
  /*
  delimiter //
  create function function_name(parameters)
  return data_type
  deterministic|non deterministic
  begin
       // body of function
  end//
  delimiter;
  */
  -- Examples
  delimiter //
  create function square_it(x int)
  returns int
  deterministic
  begin
       return x * x;
  end//
  delimiter ;
  
select emp_name ,square_it(salary) from employees where employee_id=101;
select*from employees;
  
-- delete function
drop function square_it;
 
 -- square function
 delimiter //
  create function square_it(x bigint)
  returns bigint
  deterministic
  begin
       return x * x;
  end//
  delimiter ;
  select emp_name ,square_it(salary) from employees ;
  select emp_name,department,square_it(salary)as square from employees ;
  
   -- cube function 
   delimiter //
   create function cube_it(x bigint)
   returns bigint
   deterministic
   begin
        return x*x*x;
	end//
    delimiter ;
     select emp_name ,cube_it(salary) from employees;
     
     -- annual salary
     delimiter //
     create function annual_salary(x bigint)
     returns bigint
     deterministic
     begin 
     return x*12;
     end//
     delimiter ;
     
     select emp_name, department ,annual_salary(salary) as annual_income from employees  ;
       
  