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
