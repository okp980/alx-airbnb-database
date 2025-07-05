-- Partition the Booking table by RANGE on the start_date column

-- 1. Create a new partitioned Booking table
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for each year (example: 2023, 2024, 2025)
CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. Example query to fetch bookings by date range (uses partition pruning)
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';

-- 4. To test performance, use EXPLAIN or ANALYZE on the above query
EXPLAIN SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31'; 