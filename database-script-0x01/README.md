# Database Schema – Airbnb Clone

This directory contains the SQL schema for the Airbnb database, as defined in `schema.sql`.

## What is in `schema.sql`?

- **Table Definitions:**

  - `User`: Stores user information (guests, hosts, admins) with unique email constraint.
  - `Property`: Represents properties listed by hosts.
  - `Booking`: Tracks reservations made by users for properties.
  - `Payment`: Records payments for bookings.
  - `Review`: Allows users to leave reviews for properties.
  - `Message`: Enables messaging between users.

- **Constraints:**

  - Primary keys on all tables (UUIDs).
  - Foreign keys to enforce relationships (e.g., bookings reference users and properties).
  - Unique and not-null constraints for data integrity.
  - Enum-like checks for roles, booking status, payment methods, and review ratings.

- **Indexes:**

  - Indexes on frequently queried columns for performance:
    - `email` in User
    - `property_id` in Property and Booking
    - `booking_id` in Booking and Payment

- **Normalization:**
  - The schema is normalized to Third Normal Form (3NF). Derived fields (like `total_price` in Booking) are not stored, but can be calculated in queries.

## Usage

Run the SQL statements in `schema.sql` to create the database structure for your Airbnb clone project.
