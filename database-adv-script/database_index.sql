
-- Indexes for "user" table
CREATE INDEX idx_user_user_id ON "user"(user_id);
CREATE INDEX idx_user_email ON "user"(email);

-- Indexes for "booking" table
CREATE INDEX idx_booking_guest_id ON booking(guest_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_check_in ON booking(check_in);
CREATE INDEX idx_booking_status ON booking(status);

-- Indexes for "property" table
CREATE INDEX idx_property_property_id ON property(property_id);
CREATE INDEX idx_property_host_id ON property(host_id);
CREATE INDEX idx_property_price_per_night ON property(price_per_night);
CREATE INDEX idx_property_property_type ON property(property_type);

EXPLAIN ANALYZE SELECT * FROM booking WHERE guest_id = 'some-uuid';