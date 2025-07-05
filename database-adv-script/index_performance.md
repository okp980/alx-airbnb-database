# Index Performance Analysis

## Identifying High-Usage Columns

To optimize query performance, we identified columns in the `User`, `Booking`, and `Property` tables that are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses:

- **User table:**

  - `user_id`: Used in JOINs and WHERE conditions.
  - `email`: Used in WHERE conditions (e.g., user lookup).
  - `role`: Used in filtering and ordering users.

- **Booking table:**

  - `booking_id`: Used in JOINs and WHERE conditions.
  - `user_id`: Used in JOINs and WHERE conditions.
  - `property_id`: Used in JOINs and WHERE conditions.
  - `status`: Used in filtering and ordering bookings.
  - `created_at`: Used in ordering bookings by date.

- **Property table:**
  - `property_id`: Used in JOINs and WHERE conditions.
  - `host_id`: Used in JOINs and WHERE conditions.
  - `location`: Used in filtering and ordering properties.
  - `pricepernight`: Used in ordering properties by price.

## Index Creation

The following indexes were created in `database_index.sql`:

- User table: `user_id`, `email`, `role`
- Booking table: `booking_id`, `user_id`, `property_id`, `status`, `created_at`
- Property table: `property_id`, `host_id`, `location`, `pricepernight`

## Measuring Query Performance

To measure the impact of these indexes, use the `EXPLAIN` or `ANALYZE` command before and after creating the indexes. For example:

```sql
-- Before creating indexes
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-user-id';

-- After creating indexes
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

You can also use `ANALYZE` for more detailed timing:

```sql
ANALYZE SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

Compare the query plans and execution times. With indexes, you should see:

- Faster query execution
- Use of index scans instead of sequential scans
- Lower cost estimates in the query plan

## Example Impact

- Queries filtering or joining on indexed columns will be significantly faster, especially as the table size grows.
- Ordering by indexed columns (e.g., `ORDER BY created_at`) will also benefit from the indexes.

Indexes improve read/query performance but may add slight overhead to write operations (INSERT/UPDATE/DELETE). Choose indexes based on actual query patterns and performance needs.
