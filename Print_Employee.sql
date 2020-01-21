create or replace procedure p_printEmps is
 cursor c_emp is select * from employees;
 r_emp c_emp%ROWTYPE;
 begin
 open c_emp;
 loop
 fetch c_emp into r_emp;
 exit when c_emp%NOTFOUND;
 DBMS_OUTPUT.put_line(r_emp.first_Name);
 end loop;
 close c_emp;
 end;
/

begin 
    p_printEmps;
end;