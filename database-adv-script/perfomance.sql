-- Initial query: Retrieve all bookings with user, property, and payment details
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    Booking.created_at AS booking_created_at,
    "User".user_id,
    "User".first_name,
    "User".last_name,
    "User".email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id; 