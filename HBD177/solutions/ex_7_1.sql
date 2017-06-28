PROCEDURE "get_product_by_filter" ( 
      IN im_product_filter_string varchar(5000),
      OUT ex_user_filtered_products "MD.Products" )
   LANGUAGE SQLSCRIPT
   SQL SECURITY INVOKER
   --DEFAULT SCHEMA <default_schema_name>
   READS SQL DATA AS
BEGIN

 pre_filtered_products = SELECT * FROM "MD.Products"
                              WHERE CATEGORY NOT IN ('Laser printers');
       
 ex_user_filtered_products = APPLY_FILTER(:pre_filtered_products, 
                                         :im_product_filter_string ) ;

END