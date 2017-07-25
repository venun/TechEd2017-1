PROCEDURE "addresses_from_employees" ( 
            out ex_emp_addr TABLE (
                  "ADDRESSID" NVARCHAR(10),
                  "CITY" VARCHAR(40),
                  "POSTALCODE" NVARCHAR(10), 
                  "STREET" NVARCHAR(60),
                  "BUILDING" NVARCHAR(10),
                  "COUNTRY" NVARCHAR(3),
                  "REGION" NVARCHAR(4), 
                  "ADDRESSTYPE" NVARCHAR(2),
                  "VALIDITY.STARTDATE" DATE,
                  "VALIDITY.ENDDATE" DATE,
                  "LATITUDE" DOUBLE,
                  "LONGITUDE" DOUBLE )   )
   LANGUAGE SQLSCRIPT
   SQL SECURITY INVOKER
   --DEFAULT SCHEMA <default_schema_name>
   READS SQL DATA AS
BEGIN
  
  declare i int;
  declare lv_addressid nvarchar(10);
  
  lt_employees = select * from "MD.Employees";
  
  FOR i in 1..record_count(:lt_employees) DO
      lv_addressid = :lt_employees."ADDRESSES.ADDRESSID"[:i];
      CALL "get_address"(IM_ADDRESSID => :lv_addressid,
                         EX_ADDRESS => lt_addresses);
      ex_emp_addr = select * from :lt_addresses UNION ALL select * from :ex_emp_addr;
  END FOR;
  
END 