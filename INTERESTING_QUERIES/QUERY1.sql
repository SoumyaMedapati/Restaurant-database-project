# LIST THE NAMES OF RESTAURANTS, NAMES AND TRUSTWORTHYNESS OF ALL USERS WHO HAVE RATED THE OVERALL 
# EXPERIENCE OF ETHNIC RESTAURANTS AS 5
                   
select u.Name as USER_NAME, u.Trustworthyness as TRUSTWORTHYNESS ,r.Name as ETHNIC_RESTAURANT_NAME  
from review rv
inner join user u
on rv.em_id=u.Email_id
inner join restaurant_table r
on rv.Rest_id=r.Restaurant_id
where rv.overall_experience=5
order by u.Trustworthyness DESC;
                   