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
  
  lt_employees = select * from "MD.Employees";
 
  ex_emp_addr = MAP_MERGE( :lt_employees, 
                           "get_address_func" (:lt_employees."ADDRESSES.ADDRESSID"));
  
END