#LIST THE NAME AND DISCOUNT RATE OF RESTAURANTS WHICH GIVES MAXIMUM DISCOUNT YEAR WISE FROM 2010 ONWARDS 

select EXTRACT(YEAR from c.Date) as YEAR,MAX(c.Discount) as DISCOUNT_PERCENTAGE , r.Name as NAME_OF_RESTAURANT
from coupon c, restaurant_table r
where c.R_id=r.Restaurant_id
group by YEAR
having YEAR>2010 ;
