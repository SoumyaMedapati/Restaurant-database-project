select TIMESTAMPDIFF(YEAR, u.DOB, CURDATE()) AS AGE,c.Name as MOST_PREFERED_CUISINE_NAME
from user u,cuisine c,cuisine_preference uc 
where u.Email_id=uc.eid and uc.cuis_id=c.Cuisine_id
group by AGE
having max(uc.preference)
order by AGE ASC



