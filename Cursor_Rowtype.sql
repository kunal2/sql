SET SERVEROUTPUT ON;
DECLARE
   -- Test
    CURSOR cur_etl_monitor IS
       select table_no, source_table, target_table from MONITORING_PARAMETERS
       where table_no = 1;
       
    --Create a cursor based record
    v_mon cur_etl_monitor%ROWTYPE;
BEGIN
    OPEN cur_etl_monitor;
    FETCH cur_etl_monitor into v_mon;
        DBMS_OUTPUT.put_line('Source Table Name: ' ||v_mon.source_table);
        DBMS_OUTPUT.put_line('Target Table Name: ' ||v_mon.target_table);
    CLOSE cur_etl_monitor;
END;
/

