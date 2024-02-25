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
       
 
    