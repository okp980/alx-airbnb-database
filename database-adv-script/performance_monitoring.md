# Performance Monitoring and Optimization

## Monitoring Query Performance

To monitor the performance of frequently used queries, use SQL commands such as `EXPLAIN ANALYZE` (PostgreSQL, MySQL) or `SHOW PROFILE` (MySQL). These tools provide detailed information about query execution plans, timing, and resource usage.

### Example: Using EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

- Reveals whether the query uses an index or performs a sequential scan.
- Shows the time spent in each step of the query plan.

### Example: Using SHOW PROFILE (MySQL)

```sql
SET profiling = 1;
SELECT * FROM Booking WHERE user_id = 'some-user-id';
SHOW PROFILE FOR QUERY 1;
```

- Displays resource usage (CPU, I/O, etc.) for each query phase.

## Identifying Bottlenecks

- **Sequential scans** on large tables indicate missing or unused indexes.
- **High execution time** for simple lookups or joins suggests a need for better indexing or schema adjustments.
- **Expensive joins** may be caused by lack of indexes on join columns or unnecessary joins.

## Suggested and Implemented Changes

- **Added new indexes** on columns frequently used in WHERE and JOIN clauses (see `database_index.sql`).
  - Example: `CREATE INDEX idx_booking_user_id ON Booking(user_id);`
- **Partitioned large tables** (e.g., Booking) by date to improve range query performance (see `partitioning.sql`).
- **Refactored queries** to select only necessary columns and reduce unnecessary joins (see `optimization_report.md`).

## Reporting Improvements

- After implementing indexes and partitioning, reran `EXPLAIN ANALYZE` on key queries.
- Observed:
  - **Index scans** replaced sequential scans.
  - **Lower execution times** and cost estimates.
  - **Partition pruning** for date-based queries, scanning only relevant partitions.

## Summary

Regularly monitoring query performance with `EXPLAIN ANALYZE` or `SHOW PROFILE` helps identify bottlenecks. Adding appropriate indexes, partitioning large tables, and optimizing queries can significantly improve performance. Always re-test queries after changes to confirm improvements.
