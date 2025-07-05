# Partitioning Performance Report

## Partitioning Strategy

To improve query performance on a large `Booking` table, we implemented table partitioning by RANGE on the `start_date` column. This approach divides the data into smaller, more manageable partitions (e.g., by year), allowing the database to scan only relevant partitions for date-based queries.

## Implementation

- Created a new partitioned table `Booking_partitioned` using `PARTITION BY RANGE (start_date)`.
- Defined yearly partitions: `Booking_2023`, `Booking_2024`, `Booking_2025`.
- Example query to fetch bookings by date range:
  ```sql
  SELECT * FROM Booking_partitioned
  WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';
  ```

## Performance Testing

- Used `EXPLAIN` to analyze the query plan before and after partitioning.
- With partitioning, the query plan shows **partition pruning**: only the relevant partition(s) are scanned, reducing I/O and improving speed.
- For example:
  - Before partitioning: the entire Booking table is scanned.
  - After partitioning: only `Booking_2024` is scanned for March 2024 queries.

## Observed Improvements

- **Faster query execution** for date range queries, especially as the table grows.
- **Reduced I/O**: Only relevant partitions are accessed.
- **Scalability**: Easier to manage and archive old data by dropping or detaching partitions.

## Summary

Partitioning the Booking table by `start_date` significantly improves performance for date-based queries by enabling partition pruning and reducing the amount of data scanned. This is especially beneficial for large tables with frequent range queries on the partitioned column.
