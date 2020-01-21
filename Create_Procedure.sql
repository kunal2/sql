create or replace procedure proc_data_monitoring is
--cursor c_emp is select * from employees;
    cursor cur_etl_param is 
	select table_no, source_table, source_schema, target_table, target_schema from MONITORING_PARAMETERS;
 record_etl_param cur_etl_param%ROWTYPE;
 sql_stmt  VARCHAR2(200);
 /*v_table varchar(200);
 s_table varchar(200);
 t_table varchar(200);
 s_schema varchar(200);
 t_schema varchar(200);
 */
 s_count integer;
 t_count integer;
 begin
	for ind_cur in cur_etl_param
	loop
		--dbms_output.put_line(ind_cur.source_table);
        -- determine if a valid column name has been given as input
        --select ind_cur.source_table into s_table from all_tables where owner = ind_cur.source_schema and table_name = ind_cur.source_table;
        --select ind_cur.target_table into t_table from all_tables where owner = ind_cur.target_schema and table_name = ind_cur.target_table;
        --select  count(*)  from  ind_cur.source_schema.ind_cur.source_table ||) as src_total_count;
        
        --EXECUTE IMMEDIATE 'SET SERVEROUTPUT ON';
        --EXECUTE IMMEDIATE 'SET DEFINE OFF'; 
        --EXECUTE IMMEDIATE 'SPOOL C:\Test_Files\Test.log append';
        
        sql_stmt :=  'select '''|| ind_cur.source_table ||''',(select to_char(count(*))  from ' || ind_cur.source_schema||'.'||ind_cur.source_table ||') as src_total_count,
        (select to_char(count(*))  from ' || ind_cur.target_schema ||'.'|| ind_cur.target_table ||') as trg_total_count ' || 'from dual';
       --EXECUTE IMMEDIATE sql_stmt;
       --EXECUTE IMMEDIATE 'SPOOL OFF';
       --EXECUTE IMMEDIATE 'SET DEFINE ON';
       --EXECUTE IMMEDIATE 'SET SERVEROUTPUT OFF';
       
        --dbms_output.put_line(sql_stmt);
       -- dbms_output.put_line(ind_cur.source_schema || ind_cur.source_table );
        /*
            select 'table' ,(select count(*)  from employees) as src_total_count,
        (select count(*)  from new_employees) as trg_total_count
        from dual;
        */
        /*
            IF SQL%ROWCOUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE('Salaries have been updated for: ' || emp_column 
                        || ' = ' || column_value);
            END IF
        */
	end loop;
	/*
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Invalid Table: ' || s_table ||' Schema: '||s_schema);
        --DBMS_OUTPUT.PUT_LINE ('Invalid Table: ' || t_table);
    */
 end;
/
/*
begin 
    proc_data_monitoring;
end;

select * from MONITORING_PARAMETERS;
*/