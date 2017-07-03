PROCEDURE "get_address" ( IN IM_ADDRESSID NVARCHAR(10),
                          OUT EX_ADDRESS TABLE (
                               "ADDRESSID" NVARCHAR(10) ,  "CITY" VARCHAR(40),
                               "POSTALCODE" NVARCHAR(10), "STREET" NVARCHAR(60),
                               "BUILDING" NVARCHAR(10) , "COUNTRY" NVARCHAR(3),
                               "REGION" NVARCHAR(4) , "ADDRESSTYPE" NVARCHAR(2),
                               "VALIDITY.STARTDATE" DATE , "VALIDITY.ENDDATE" DATE ,
                               "LATITUDE" DOUBLE , "LONGITUDE" DOUBLE ) )
   LANGUAGE SQLSCRIPT
   SQL SECURITY INVOKER
   --DEFAULT SCHEMA <default_schema_name>
   READS SQL DATA AS
BEGIN
  ex_address = SELECT * FROM "MD.Addresses"
                    WHERE ADDRESSID = :im_addressid;
END