# Database Normalization Report – Airbnb Schema

## Objective
To ensure that all entities in the Airbnb database schema conform to the principles of Third Normal Form (3NF) by eliminating redundancy and ensuring data integrity.

---

## 1. User Table
- **1NF**: All attributes are atomic.
- **2NF**: The table has a single-column primary key (`user_id`); all non-key attributes fully depend on it.
- **3NF**: No transitive dependencies between non-key attributes.

✅ **Already in 3NF**

---

## 2. Property Table
- **1NF**: Atomic values.
- **2NF**: Single-column PK; all other attributes depend on it.
- **3NF**: No transitive dependencies; `host_id` is a foreign key to `User`.

✅ **Already in 3NF**

---

## 3. Booking Table
- **1NF**: All values are atomic.
- **2NF**: All non-key attributes depend on `booking_id`.
- **3NF**: `total_price` is derived (from `price_per_night × number of nights`). This introduces redundancy.

❌ **Not in 3NF**

### ✅ Fix:
- Removed `total_price` from `Booking` table.
- Instead, calculate it in queries or using a view:
```sql
SELECT 
  b.booking_id,
  DATEDIFF(b.end_date, b.start_date) * p.pricepernight AS total_price
FROM Booking b
JOIN Property p ON b.property_id = p.property_id;
```

---

## 4. Payment Table
- Fully dependent on `payment_id`
- No derived values

✅ **Already in 3NF**

---

## 5. Review Table
- Atomic fields
- No derivations or transitive dependencies

✅ **Already in 3NF**

---

## 6. Message Table
- Each message is atomic and depends only on `message_id`

✅ **Already in 3NF**

---

## Summary of Changes
| Table   | Change Made             | Reason                            |
|---------|--------------------------|-----------------------------------|
| Booking | Removed `total_price`    | It was a derived value (violated 3NF) |

All tables are now fully normalized to **3NF**.