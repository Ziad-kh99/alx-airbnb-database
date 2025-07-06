SELECT *
FROM booking AS b
    INNER JOIN users AS u
        ON b.guest_id = u.user_id;

SELECT *
FROM property AS p
    LEFT JOIN review AS r
        ON p.property_id = r.property_id;

SELECT *
FROM users As u 
    FULL OUTER JOIN booking AS b 
        ON u.user_id = b.guest_id;
