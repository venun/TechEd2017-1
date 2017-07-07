select * from M_ACTIVE_PROCEDURES 
   where procedure_name = 'long_running_proc' 
   and procedure_schema_name = '<your_container_schema>';
