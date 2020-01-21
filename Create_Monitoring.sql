select * from employees;
select * from new_employees;
delete from new_employees where employee_id in(100,101);
commit;
create table new_employees as ( select * from employees); 
create table new_departments as ( select * from departments); 
select * from new_departments;
delete from new_departments where department_id in (10,20,30);
commit;
CREATE TABLE MONITORING_PARAMETERS(
    table_no integer,
    job_id VARCHAR2(100) NOT NULL,
    source_table VARCHAR2(50) NOT NULL,
    source_schema VARCHAR2(50),
    target_table VARCHAR2(50) NOT NULL,
    target_schema VARCHAR2(50),
    db_link VARCHAR2(50),
    PRIMARY KEY(table_no)
);

INSERT ALL
  INTO MONITORING_PARAMETERS (table_no, job_id, source_table, target_table) VALUES (1, 'job_emp','employees','new_employees')
  INTO MONITORING_PARAMETERS (table_no, job_id, source_table, target_table) VALUES (2, 'job_dept','departments','new_departments')
SELECT * FROM dual;
select banner from v$version where rownum = 1;

select a.*, rownum from MONITORING_PARAMETERS a;
