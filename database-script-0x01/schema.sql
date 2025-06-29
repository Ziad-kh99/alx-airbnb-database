-- Extension to make UUID auto-increamented:
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Custom ENUMs:
CREATE TYPE role AS ENUM('admin', 'host', 'guest');
CREATE TYPE property_type AS ENUM('house', 'experience', 'service');
CREATE TYPE booking_status AS ENUM('pending', 'confirmed', 'cancelled');
CREATE TYPE payment_method AS ENUM('credit_card', 'paypal', 'strip');
-- ALTER TYPE role ADD VALUE 'operator';

-- User table:
CREATE TABLE user (
	user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	password_hashed TEXT NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	country VARCHAR(100) NOT NULL,
	city VARCHAR(255) NOT NULL,
	user_role role NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Property table:
CREATE TABLE property (
	property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	host_id UUID REFERENCES user(user_id) ON DELETE CASCADE,
	name VARCHAR(255) NOT NULL,
	description TEXT NOT NULL,
	location TEXT NOT NULL,
	price_per_night DECIMAL(10, 2) NOT NULL,
	property_type property_type NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMPTZ NOT NULL
);

-- Booking table:
CREATE TABLE booking(
	booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	property_id UUID REFERENCES property(property_id) ON DELETE CASCADE,
	guest_id UUID REFERENCES user(user_id) ON DELETE CASCADE,
	check_in TIMESTAPMTZ NOT NULL,
	check_out TIMESTAMPTZ NOT NULL,
	total_price DECIMAL(10, 2) NOT NULL,
	status booking_status NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMPTZ NOT NULL
);

-- Payment table:
CREATE TABLE payment (
	payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	booking_id UUID REFERENCES booking(booking_id),
	amount DECIMAL(10, 2) NO NULL,
	payment_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	payment_method payment_method NOT NULL
);
	
