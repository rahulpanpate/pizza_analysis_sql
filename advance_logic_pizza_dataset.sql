use db_pizza;


/* -------------------  which day which category pizza sold highest  --------------- */


             select t.Day_Name,t.pizza_category,t.total_pizza_sold from 
             (select dayname(order_date) as Day_Name,pizza_category,sum(quantity) as total_pizza_sold, 
             row_number() over(partition by dayname(order_date) order by sum(quantity) desc ) as RN 
             from tbl_pizza
	         group by Day_Name,pizza_category)   t where t.RN<=1;
       
       
		   /*Verify above result in below query*/
            
               select dayname(order_date) as Day_Name,pizza_category,sum(quantity) as total_pizza_sold, 
               row_number() over(partition by dayname(order_date) order by sum(quantity) desc ) as RN 
               from tbl_pizza
	           group by Day_Name,pizza_category;
       
      
       

/* ---------------- which day which size pizza sold highest  --------------  */


             select t.Day_Name,t.pizza_size,t.total_pizza_sold from 
            (select dayname(order_date) as Day_Name,pizza_size,sum(quantity) as total_pizza_sold, 
            row_number() over(partition by dayname(order_date) order by sum(quantity) desc) as RN 
            from tbl_pizza
	        group by Day_Name,pizza_size)   t where t.RN<=1 ;   
            
             /*Verify above result in below query*/
             
                 select dayname(order_date) as Day_Name,pizza_size,sum(quantity) as total_pizza_sold, 
                 row_number() over(partition by dayname(order_date) order by sum(quantity) desc) as RN 
                 from tbl_pizza
	             group by Day_Name,pizza_size;
       
        
       

/*  -------------     which day which category pizza order highest  --------------- ---- */


	              select t.Day_Name,t.pizza_category,t.total_pizza_order from 
                  (select dayname(order_date) as Day_Name,pizza_category,count(distinct(order_id)) as total_pizza_order, 
                  row_number() over(partition by dayname(order_date) order by count(distinct(order_id)) desc ) as RN 
                  from tbl_pizza
	              group by Day_Name,pizza_category)   t where t.RN=1;  
                  
                   /*Verify above result in below query*/
                   
                     select dayname(order_date) as Day_Name,pizza_category,count(distinct(order_id)) as total_pizza_order, 
                     row_number() over(partition by dayname(order_date) order by count(distinct(order_id)) desc ) as RN 
                     from tbl_pizza
	                 group by Day_Name,pizza_category;
       
   
  /* ----------- which day which size pizza order highest --------------- */


	           select t.Day_Name,t.pizza_size,t.total_pizza_order from 
               (select dayname(order_date) as Day_Name,pizza_size,count(distinct(order_id)) as total_pizza_order, 
               row_number() over(partition by dayname(order_date) order by count(distinct(order_id)) desc ) as RN 
               from tbl_pizza
	           group by Day_Name,pizza_size)   t where t.RN=1;     
         
	          /*Verify above result in below query*/
          
                  select dayname(order_date) as Day_Name,pizza_size,count(distinct(order_id)) as total_pizza_order, 
                  row_number() over(partition by dayname(order_date) order by count(distinct(order_id)) desc ) as RN 
                  from tbl_pizza
		          group by Day_Name,pizza_size;
                  
                  

/* ----------- which day which  (pizza name) pizza order highest --------------- */


	           select t.Day_Name,t.pizza_name,t.total_pizza_order from 
               (select dayname(order_date) as Day_Name,pizza_name,count(distinct(order_id)) as total_pizza_order, 
               row_number() over(partition by dayname(order_date) order by count(distinct(order_id)) desc ) as RN 
               from tbl_pizza
	           group by Day_Name,pizza_name)   t where t.RN=1;     
         
	          /*Verify above result in below query*/
          
                  select dayname(order_date) as Day_Name,pizza_name,count(distinct(order_id)) as total_pizza_order, 
                  row_number() over(partition by dayname(order_date) order by count(distinct(order_id)) desc ) as RN 
                  from tbl_pizza
		          group by Day_Name,pizza_name;            
                  
  
  /* ----------- which day which  (pizza name) pizza sold  highest --------------- */


	           select t.Day_Name,t.pizza_name,t.total_pizza_sold from 
               (select dayname(order_date) as Day_Name,pizza_name,sum(quantity) as total_pizza_sold, 
               row_number() over(partition by dayname(order_date) order by sum(quantity) desc ) as RN 
               from tbl_pizza
	           group by Day_Name,pizza_name)   t where t.RN=1;     
         
	          /*Verify above result in below query*/
          
                  select dayname(order_date) as Day_Name,pizza_name,sum(quantity) as total_pizza_sold, 
                  row_number() over(partition by dayname(order_date) order by sum(quantity) desc ) as RN 
                  from tbl_pizza
		          group by Day_Name,pizza_name; 
                  
                  
 /*     ----------------    every day and every pizza category which pizza sold highest  -------------    */                 

               select t.day_name,t.pizza_category,t.pizza_name,t.total_pizza_sold from 
              (select dayname(order_date) as day_name,pizza_category,pizza_name,sum(quantity) as total_pizza_sold,
              row_number() over(partition by dayname(order_date),pizza_category    order by sum(quantity) desc) as rn
              from tbl_pizza
              group by day_name,pizza_category,pizza_name) t where t.rn=1;
                  
             /* Verify above result in below query  */ 
             
                 
                 select dayname(order_date) as day_name,pizza_category,pizza_name,sum(quantity) as total_pizza_sold,
                 row_number() over(partition by dayname(order_date),pizza_category    order by sum(quantity) desc) as rn
                 from tbl_pizza
                 group by day_name,pizza_category,pizza_name;
                  

                  