-- Sample data for User table
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'host', '2024-01-01 10:00:00'),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', 'guest', '2024-01-02 11:00:00'),
  ('33333333-3333-3333-3333-333333333333', 'Carol', 'Williams', 'carol@example.com', 'hash3', '3456789012', 'host', '2024-01-03 12:00:00'),
  ('44444444-4444-4444-4444-444444444444', 'David', 'Brown', 'david@example.com', 'hash4', '4567890123', 'guest', '2024-01-04 13:00:00'),
  ('55555555-5555-5555-5555-555555555555', 'Eve', 'Davis', 'eve@example.com', 'hash5', '5678901234', 'admin', '2024-01-05 14:00:00');

-- Sample data for Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Cozy Cottage', 'A small, cozy cottage in the countryside.', 'Countryside', 120.00, '2024-02-01 09:00:00', '2024-02-01 09:00:00'),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 'City Apartment', 'Modern apartment in the city center.', 'City Center', 200.00, '2024-02-02 10:00:00', '2024-02-02 10:00:00');

-- Sample data for Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2024-03-01', '2024-03-05', 'confirmed', '2024-02-10 15:00:00'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2024-03-10', '2024-03-12', 'pending', '2024-02-15 16:00:00');

-- Sample data for Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
  ('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, '2024-02-11 17:00:00', 'credit_card'),
  ('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 400.00, '2024-02-16 18:00:00', 'paypal');

-- Sample data for Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 5, 'Amazing stay! Highly recommend.', '2024-03-06 12:00:00'),
  ('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 4, 'Great location, clean apartment.', '2024-03-13 13:00:00');

-- Sample data for Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, is the cottage available for next weekend?', '2024-02-05 08:00:00'),
  ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, yes it is available!', '2024-02-05 08:10:00'),
  ('eeeeeee3-eeee-eeee-eeee-eeeeeeeeeee3', '44444444-4444-4444-4444-444444444444', '33333333-3333-3333-3333-333333333333', 'Is the city apartment pet-friendly?', '2024-02-20 09:00:00');
