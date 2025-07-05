# Advanced SQL JOIN Queries

This directory contains advanced SQL queries demonstrating the use of different types of JOINs on the Airbnb database schema.

## joins_queries.sql

This file includes the following queries:

1. **INNER JOIN (Bookings and Users):**

   - Retrieves all bookings along with the details of the users who made those bookings.
   - Only bookings that have a corresponding user in the database are included in the result.
   - Example columns: booking_id, property_id, user_id, start_date, end_date, status, created_at, first_name, last_name, email.

2. **LEFT JOIN (Properties and Reviews):**

   - Retrieves all properties and their associated reviews.
   - Includes properties even if they have no reviews (review columns will be NULL for such properties).
   - Example columns: property_id, host_id, name, description, location, pricepernight, review_id, reviewer_id, rating, comment, review_created_at.

3. **FULL OUTER JOIN (Users and Bookings):**
   - Retrieves all users and all bookings, even if a user has not made any bookings or a booking is not linked to a user.
   - Ensures that every user and every booking appears at least once in the result, with NULLs where there is no match.
   - Example columns: user_id, first_name, last_name, email, role, created_at, booking_id, property_id, start_date, end_date, status, booking_created_at.

These queries are useful for analyzing relationships between users, properties, bookings, and reviews in the Airbnb database.

## subqueries.sql

This file includes the following queries:

1. **Properties with Average Rating Greater Than 4.0 (Subquery):**

   - Finds all properties where the average rating from reviews is greater than 4.0.
   - Uses a subquery in the WHERE clause to group reviews by property and filter by average rating.
   - Returns all columns from the Property table for qualifying properties.

2. **Users with More Than 3 Bookings (Correlated Subquery):**
   - Finds users who have made more than 3 bookings.
   - Uses a correlated subquery in the WHERE clause to count bookings for each user.
   - Returns all columns from the User table for users meeting the criteria.
