SELECT guest_id, COUNT(*) AS total_bookings
FROM booking
GROUP BY guest_id;

SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON b.property_id = p.property_id
GROUP BY p.property_id, p.name;