select
count(id),
upper + lower + digit as complexity
from (
select
    id
    ,password
    ,CASE WHEN
        password similar to E'%[A-Z]%'
        THEN 1
        ELSE 0
    END as upper
    ,CASE WHEN
        password similar to E'%[a-z]%'
        THEN 1
        ELSE 0
    END as lower
    ,CASE WHEN
        password similar to E'%[0-9]%'
        THEN 1
        ELSE 0
    END as digit
    ,CASE WHEN
        password similar to E'[~!@#$%^&*()_+-={}\[\]\\;:\'",./<>?`]'
        THEN 1
        ELSE 0
    END as symbol
from
credentials) as calculated_complexity
GROUP BY complexity
