-- Indexes for high-usage columns in User, Booking, and Property tables

-- User table: user_id (JOIN), email (WHERE), role (WHERE/ORDER BY)
CREATE INDEX idx_user_user_id ON "User" (user_id);
CREATE INDEX idx_user_email ON "User" (email);
CREATE INDEX idx_user_role ON "User" (role);

-- Booking table: booking_id (JOIN), user_id (JOIN/WHERE), property_id (JOIN/WHERE), status (WHERE/ORDER BY), created_at (ORDER BY)
CREATE INDEX idx_booking_booking_id ON Booking (booking_id);
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_booking_created_at ON Booking (created_at);

-- Property table: property_id (JOIN/WHERE), host_id (JOIN/WHERE), location (WHERE/ORDER BY), pricepernight (ORDER BY)
CREATE INDEX idx_property_property_id ON Property (property_id);
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_pricepernight ON Property (pricepernight); 