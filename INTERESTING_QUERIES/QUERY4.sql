

select * from ( select u.Name,count(c.Coupon_code) as NUMBER_OF_COUPONS
from user u
inner join coupon c
on c.E_id=u.Email_id
group by u.Name) as p order by NUMBER_OF_COUPONS desc limit 5;
