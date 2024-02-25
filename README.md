/*  BASIC LEVEL PIZZA DATA ANALYSIS           */

/* 	SHOW ALL DATABASE NAME   */

      SHOW  DATABASES;
   
   
/* USE DATABASE DB_PIZZA  */

       USE DB_PIZZA;   
   

/* SHOW ALL TABLE NAME PRESENT IN DB_PIZZA  */

       SHOW TABLES;   
     
/*  FETCH ALL RECORD WITH ALL COLUMNS IN TBL_PIZZA   */

        SELECT * FROM TBL_PIZZA;     
    
/* FIND NUMBER OF RECORD  */ 

       SELECT COUNT(*) AS TOTAL_RECORD FROM TBL_PIZZA;
   
/* FIND lAST PIZZA ID  --> PIZZA-ID AUTO INCREMENT AND PRIMARY KEY */ 
   
	   SELECT MAX(PIZZA_ID) FROM TBL_PIZZA;
 
/* FIND LAST PIZZA ORDER DATE */
    
       SELECT ORDER_DATE FROM TBL_PIZZA ORDER BY PIZZA_ID DESC LIMIT 1;

/* FIND  HOW MANY ORDER IN LAST DATE*/


        SELECT ORDER_DATE,COUNT(distinct(ORDER_ID)) AS NUMBER_OF_ORDER FROM TBL_PIZZA
        WHERE ORDER_DATE  =  (SELECT ORDER_DATE FROM TBL_PIZZA ORDER BY PIZZA_ID DESC LIMIT 1)
		GROUP BY ORDER_DATE;     
  
/* FIND NUMBER OF  CATEGOTY OF PIZZA  */ 

        SELECT COUNT(distinct(PIZZA_CATEGORY)) AS PIZZA_CATEGORY FROM TBL_PIZZA;
 
/* FIND NAME OF   PIZZA CATEGORY */ 
 
        SELECT DISTINCT(PIZZA_CATEGORY) FROM TBL_PIZZA;
      
/* FIND HOW MANY NUMBER OF PIZZA SIZE  */    
   
        SELECT count(distinct(PIZZA_SIZE)) AS TYPE_OF_PIZZA_SIZE FROM TBL_PIZZA;
      
/* FIND NAME OF PIZZA SIZE  */   
        
        SELECT distinct(PIZZA_SIZE) AS NAME_OF_PIZZA_SIZE FROM TBL_PIZZA;
        
/* PIZZA NAME */ 

       SELECT DISTINCT(PIZZA_NAME) AS PIZZA_NAME  FROM TBL_PIZZA;   


/* NUMBER OF PIZZA NAME */ 

       SELECT COUNT(DISTINCT(PIZZA_NAME)) AS PIZZA_NAME  FROM TBL_PIZZA;   

/* HOW MANY PIZZA SOLD UPTO DATE */ 

      SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD FROM TBL_PIZZA; 
   
/* Total pizza order */ 

      SELECT count(distinct(order_id))  AS TOTAL_PIZZA_order FROM TBL_PIZZA;    
      
     SELECT * FROM TBL_PIZZA;   






/*        PIZZA DATASET ANALYSIS IN SQL     */

  use db_pizza;
/* CATEGORY WISE PIZZA SOLD */ 


      SELECT PIZZA_CATEGORY,SUM(QUANTITY) AS TOTAL_SOLD FROM TBL_PIZZA
      GROUP BY PIZZA_CATEGORY;

/* TOP TWO PIZZA CATEGORY */ 
     
      SELECT PIZZA_CATEGORY,SUM(QUANTITY) AS TOTAL_SOLD FROM TBL_PIZZA
      GROUP BY PIZZA_CATEGORY ORDER BY TOTAL_SOLD DESC LIMIT 2;

/* BOTTOM ONE PIZZA CATEGORY */
      
      SELECT PIZZA_CATEGORY,SUM(QUANTITY) AS TOTAL_SOLD FROM TBL_PIZZA
      GROUP BY PIZZA_CATEGORY ORDER BY TOTAL_SOLD  LIMIT 1;
      
/* PIZZA SIZE WISE PIZZA SOLD  */   

      SELECT PIZZA_SIZE,SUM(QUANTITY) AS TOTAL_PIZZA_SOLD  FROM TBL_PIZZA
      GROUP BY PIZZA_SIZE;
 
 /* TOP 2 PIZZA SOLD IN PIZZA SIZE */   

      SELECT PIZZA_SIZE,SUM(QUANTITY) AS TOTAL_PIZZA_SOLD  FROM TBL_PIZZA
      GROUP BY PIZZA_SIZE ORDER BY TOTAL_PIZZA_SOLD DESC LIMIT 2;


/* BOTTOM 2 PIZZA SOLD IN PIZZA SIZE */   

      SELECT PIZZA_SIZE,SUM(QUANTITY) AS TOTAL_PIZZA_SOLD  FROM TBL_PIZZA
      GROUP BY PIZZA_SIZE ORDER BY TOTAL_PIZZA_SOLD  LIMIT 2;
      
  
/* TOTAL REVENUE */   

      
    SELECT SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM TBL_PIZZA;
    
    
/* TOTAL REVENUE BY PIZZA_CATEGORY WISE */

      SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE) FROM TBL_PIZZA
      GROUP BY PIZZA_CATEGORY;

/* TOP 2  TOTAL REVENUE BY PIZZA_CATEGORY WISE */

      SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM TBL_PIZZA
      GROUP BY PIZZA_CATEGORY ORDER BY TOTAL_REVENUE DESC LIMIT 2;
      
/* BOTTOM  2  TOTAL REVENUE BY PIZZA_CATEGORY WISE */

      SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM TBL_PIZZA
      GROUP BY PIZZA_CATEGORY ORDER BY TOTAL_REVENUE  LIMIT 2;


/* TOTAL REVENUE BY PIZZA_SIZE WISE */

      SELECT PIZZA_SIZE,SUM(TOTAL_PRICE) FROM TBL_PIZZA
      GROUP BY PIZZA_SIZE;

/* TOP 2  TOTAL REVENUE BY PIZZA_SIZE WISE */

      SELECT PIZZA_SIZE,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM TBL_PIZZA
      GROUP BY PIZZA_SIZE ORDER BY TOTAL_REVENUE DESC LIMIT 2;
      
/* BOTTOM  2  TOTAL REVENUE BY PIZZA_SIZE WISE */

      SELECT PIZZA_SIZE,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM TBL_PIZZA
      GROUP BY PIZZA_SIZE ORDER BY TOTAL_REVENUE  LIMIT 2;
      
      
/* WHAT TOTAL NUMBER PIZZA SIZE AVAILABLE BY CATEGORY WISE */   
     
     SELECT PIZZA_CATEGORY,COUNT(DISTINCT(PIZZA_SIZE)) AS PIZZA_SIZE_TYPE FROM TBL_PIZZA
     GROUP BY PIZZA_CATEGORY;
  

SELECT * FROM TBL_PIZZA;

            

      
      

  /*   ------   DATE WISE ANALYSIS       -------  */
         
         use db_pizza;

/* i chang my order_date in yyyy-mm-dd format using below code */
   
     SET SQL_SAFE_UPDATES = 0;
     UPDATE tbl_pizza SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');
	 SELECT MONTHNAME(ORDER_DATE) FROM TBL_PIZZA;
     
/* find year wise order */

    select year(order_date) as order_year,count(distinct(order_id)) from 
    tbl_pizza group by order_year;
    
/* find Month wise order */  
  
    select monthname(order_date) as Month_Name,count(distinct(order_id))
    from tbl_pizza group by Month_Name;
    
/* find Date wise order */  
  
    select day(order_date) as Date_order,count(distinct(order_id))
    from tbl_pizza group by Date_order;  
    
/* Top 5 order in date */  
  
    select day(order_date) as Date_order,count(distinct(order_id)) as total_order
    from tbl_pizza group by Date_order order by total_order desc limit 5;   
  
/* OR  */
/* Top 5 order in date */  
  
    select order_date,count(distinct(order_id)) as total_order
    from tbl_pizza group by order_date order by total_order desc limit 5;  
    

/* find day name wise pizza order */  
  
      select dayname(order_date) as day_name,count(distinct(order_id)) as total_order
      from tbl_pizza group by day_name order by total_order desc ;  

/* find  week  wise pizza order */  
  
      select week(order_date) as week_name,count(distinct(order_id)) as total_order
      from tbl_pizza group by week_name order by total_order desc ;  

/* find  weekday  wise pizza order ---> one week only six day */  
  
      select weekday(order_date) as week_day,count(distinct(order_id)) as total_order
      from tbl_pizza group by week_day order by total_order desc ; 
      
/* find  weekofyear  wise pizza order ---->  total week in year 52*/  
  
      select weekofyear(order_date) as week_year,count(distinct(order_id)) as total_order
      from tbl_pizza group by week_year order by total_order desc ;   

/*  year wise pizza sold   */     

    select  year(order_date) as year_pizza_sold,sum(quantity) as pizza_sold
    from tbl_pizza group by year_pizza_sold;
    
/*  month wise pizza sold   */     

    select  MonthName(order_date) as Month_pizza_sold,sum(quantity) as pizza_sold
    from tbl_pizza group by Month_pizza_sold;  

/*  Day Name wise pizza sold   */     

    select  DayName(order_date) as day_name_pizza_sold,sum(quantity) as pizza_sold
    from tbl_pizza group by day_name_pizza_sold order by pizza_sold desc;  
    
/*  Day Name wise  Revenue   */     

    select  DayName(order_date) as day_name_pizza_sold,sum(total_price) as total_revenue
    from tbl_pizza group by day_name_pizza_sold order by total_revenue desc;  
    
    select pizza_category,DayName(order_date) as day_name_pizza_sold,sum(total_price) as total_revenue
    from tbl_pizza group by pizza_category,day_name_pizza_sold order by total_revenue desc;  
    
    
/*   -----  friday which pizza_category generate high revenue -----   */

      select pizza_category,sum(total_price) as friday_revenue from tbl_pizza 
      where dayname(order_date)="Friday"
      group by pizza_category order by friday_revenue desc limit 1;
 
    
    
    
  select * from tbl_pizza;    
       
 
    

/*  ------  Mathematicaly  Analysis  ------  */

      use tbl_pizza;

/*     Average Order Value  
    
    avr  = sum(number)/occurence 
*/

      select (sum(total_price)/count(distinct(order_id))) as average_order from tbl_pizza;
    
	  select cast(120.123540 as decimal(10,2));
    
/*  Average Pizzas Per Order  */

    
    select (sum(quantity)/count(distinct(order_id))) as avr_pizza from tbl_pizza;
    
/*    % wise sale by pizza_category   */   

       select pizza_category,sum(total_price) as category_wise_sale,
       ( sum(total_price)*100/(Select sum(total_price) from tbl_pizza))
       as percentage_category
       from tbl_pizza
       group by pizza_category;
       
 /*    % wise sale by pizza_size   */       
          
          
		select pizza_size,sum(total_price) as size_wise_sale,
       ( sum(total_price)*100/(Select sum(total_price) from tbl_pizza))
       as percentage_size
       from tbl_pizza
       group by pizza_size;

/* -----------   Pizza name wise analysis  ------------   */

/*   Top 5 revenue generate by pizza name  */
     
     select pizza_name,sum(total_price) as total_revenue 
     from tbl_pizza
     group by pizza_name order by total_revenue desc limit 5;


/*   Top 3 order  by pizza name  */
     
     select pizza_name,count(distinct(order_id)) as total_order 
     from tbl_pizza
     group by pizza_name order by total_order desc limit 3;
     

/*   Top 3 pizza sold  by pizza name  */
     
     select pizza_name,sum(quantity) as pizza_sold 
     from tbl_pizza
     group by pizza_name order by pizza_sold desc limit 3; 
     
/*  which day which pizza sold highest   */

     
   select * from tbl_pizza;
