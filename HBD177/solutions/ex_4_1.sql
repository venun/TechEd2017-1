FUNCTION "get_po_counts"( im_fdate DATE ) 
    RETURNS TABLE (EMPLOYEEID NVARCHAR(10),
			       FULLNAME NVARCHAR(256), 
			       CREATE_CNT INTEGER, 
			       CHANGE_CNT INTEGER,
			       COMBINED_CNT INTEGER)
	LANGUAGE SQLSCRIPT 
	SQL SECURITY INVOKER AS 
BEGIN 

END;
