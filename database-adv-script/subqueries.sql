SELECT *
FROM property
WHERE property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

SELECT u.*
FROM users AS u
WHERE (
    SELECT COUNT(*)
    FROM booking AS b
    WHERE b.guest_id = u.user_id
) > 3;