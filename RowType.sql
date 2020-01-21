SET SERVEROUTPUT ON;
DECLARE
    v_mon MONITORING_PARAMETERS%ROWTYPE;
BEGIN
    select table_no, job_id, source_table, target_table
    into v_mon.table_no, v_mon.job_id, v_mon.source_table, v_mon.target_table
    from MONITORING_PARAMETERS
    where rownum = 1;
    
    DBMS_OUTPUT.put_line('Source Table Name: ' ||v_mon.source_table);
END;
/