SELECT  statement_string,  
        last_execution_timestamp,
        last_preparation_timestamp 
         FROM M_SQL_PLAN_CACHE 
           WHERE statement_string LIKE  '%"<your_container_schema>"."get\_products\_cumulative"%FILTERED\_PRODUCTS%' ESCAPE '\'
              ORDER BY LAST_EXECUTION_TIMESTAMP, LAST_PREPARATION_TIMESTAMP DESC;