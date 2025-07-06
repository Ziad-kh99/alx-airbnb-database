SELECT
    b.booking_id,
    b.check_in,
    b.check_out,
    b.total_price,
    b.status AS booking_status,
    b.created_at AS booking_created_at,

    -- User details
    u.user_id AS guest_id,
    u.first_name AS guest_first_name,
    u.last_name AS guest_last_name,
    u.email AS guest_email,

    -- Property details
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.price_per_night,
    p.property_type,

    -- Payment details
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method

FROM booking b
JOIN "user" u ON b.guest_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id;


EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.check_in,
    b.check_out,
    b.total_price,
    b.status AS booking_status,
    b.created_at AS booking_created_at,
    u.user_id AS guest_id,
    u.first_name AS guest_first_name,
    u.last_name AS guest_last_name,
    u.email AS guest_email,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.price_per_night,
    p.property_type,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM booking b
JOIN "user" u ON b.guest_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id;

SELECT
    b.booking_id,
    b.check_in,
    b.check_out,
    b.total_price,
    b.status,

    u.first_name,
    u.last_name,
    u.email,

    p.name AS property_name,
    p.location,
    p.price_per_night,

    pay.amount,
    pay.payment_date

FROM booking b
JOIN "user" u ON b.guest_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'; -- Optional filter to improve performance
