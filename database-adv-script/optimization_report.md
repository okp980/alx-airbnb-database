# Query Optimization Report

## Initial Query

The initial query retrieves all bookings along with the associated user details, property details, and payment details:

```sql
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
```

## Performance Analysis

To analyze the query's performance, use the `EXPLAIN` or `ANALYZE` command:

```sql
EXPLAIN SELECT ... -- (the query above)
```

Look for the following in the query plan:

- Sequential scans on large tables (inefficient)
- Join algorithms (nested loop, hash join, etc.)
- Use of indexes (look for "Index Scan" instead of "Seq Scan")
- Estimated cost and row counts

### Potential Inefficiencies

- **Unnecessary columns:** Selecting all columns from joined tables can increase I/O and memory usage.
- **Unnecessary joins:** If not all details are needed, joining all tables may be wasteful.
- **Missing indexes:** If join/filter columns are not indexed, the database may use slow sequential scans.

## Refactored Query & Optimization

### 1. Select Only Needed Columns

Only select columns required for the result, as shown in the initial query (already optimized for column selection).

### 2. Ensure Indexes Exist

Indexes on `Booking.user_id`, `Booking.property_id`, and `Booking.booking_id` (as well as corresponding columns in `User`, `Property`, and `Payment`) are critical for fast joins. These were created in `database_index.sql`.

### 3. Reduce Join Scope (if possible)

If you only need bookings with payments, use an `INNER JOIN` instead of `LEFT JOIN` for the Payment table. If you only need recent bookings, add a `WHERE` clause to limit the result set:

```sql
-- Example: Only bookings with payments
SELECT ...
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
JOIN Payment ON Booking.booking_id = Payment.booking_id;
```

Or, filter by date:

```sql
WHERE Booking.created_at >= '2024-01-01'
```

### 4. Analyze Again

After refactoring, run `EXPLAIN` or `ANALYZE` again to confirm improvements:

- Look for index scans and lower cost estimates.
- Confirm that unnecessary joins are removed.

## Summary

- The initial query retrieves comprehensive booking data using multiple joins.
- Performance can be improved by indexing join/filter columns, selecting only needed columns, and reducing unnecessary joins.
- Use `EXPLAIN`/`ANALYZE` to measure and confirm performance improvements.
