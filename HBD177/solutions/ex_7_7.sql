FUNCTION "get_address_func" ( IN im_addressid NVARCHAR(10))
    RETURNS TABLE ( "ADDRESSID" NVARCHAR(10) , "CITY" VARCHAR(40),
                    "POSTALCODE" NVARCHAR(10), "STREET" NVARCHAR(60),
                    "BUILDING" NVARCHAR(10) , "COUNTRY" NVARCHAR(3),
                    "REGION" NVARCHAR(4) , "ADDRESSTYPE" NVARCHAR(2),
                    "VALIDITY.STARTDATE" DATE , "VALIDITY.ENDDATE" DATE ,
                    "LATITUDE" DOUBLE , "LONGITUDE" DOUBLE )
	LANGUAGE SQLSCRIPT 
	SQL SECURITY INVOKER AS 
BEGIN 

  RETURN SELECT * FROM "MD.Addresses"
                    WHERE ADDRESSID = :im_addressid;

END;