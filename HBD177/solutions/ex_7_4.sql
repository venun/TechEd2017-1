PROCEDURE "calculate_cumulative_sum_of_delivered_products" (  
    IN IM_PRODUCTS TABLE ( PRODUCTID NVARCHAR(10),  
                           DELIVERYDATE DAYDATE,
                          NUM_DELIVERED_PRODUCTS BIGINT ),
    OUT EX_PRODUCTS TABLE ( PRODUCTID NVARCHAR(10), 
                            DELIVERYDATE DAYDATE,
                            NUM_DELIVERED_PRODUCTS BIGINT,
                          CUMULATIVE_SUM BIGINT )  )
   LANGUAGE SQLSCRIPT
   SQL SECURITY INVOKER
   --DEFAULT SCHEMA <default_schema_name>
   READS SQL DATA AS
BEGIN

    DECLARE tmp_productid NVARCHAR(10) = '';
    DECLARE tmp_cumulated BIGINT       = 0;
    DECLARE i             INTEGER      = 1;

    IF NOT IS_EMPTY(:im_products) THEN
 
     ex_products = select products.*, NULL AS CUMULATIVE_SUM FROM :im_products as products;  

      FOR i IN 1..record_count(:EX_PRODUCTS) DO 
       
       IF :tmp_productid <> :ex_products.PRODUCTID[:i] THEN
        tmp_productid  = :ex_products.PRODUCTID[:i];
        :ex_products.(CUMULATIVE_SUM).update((:ex_products.NUM_DELIVERED_PRODUCTS[:i]), :i );
       ELSE
        :ex_products.(CUMULATIVE_SUM).update((:ex_products.CUMULATIVE_SUM[:i-1]
                    + :ex_products.NUM_DELIVERED_PRODUCTS[:i]), :i );
       END IF;

      END FOR;

    END IF;

END