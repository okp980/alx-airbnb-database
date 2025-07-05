# Seed Data for Airbnb Database

This directory contains the `seed.sql` file, which provides sample data for the Airbnb database schema defined in `../database-script-0x01/schema.sql`.

## What is `seed.sql`?

The `seed.sql` script inserts realistic sample records into all major tables of the database:

- **User**: Hosts, guests, and admin users
- **Property**: Listings owned by hosts
- **Booking**: Reservations made by guests
- **Payment**: Payments for bookings
- **Review**: Reviews left by guests for properties
- **Message**: Messages exchanged between users

## Usage

Run this script after creating the database schema to populate your database with initial data for development or testing:

```sh
psql -U <username> -d <database> -f seed.sql
```

Replace `<username>` and `<database>` with your PostgreSQL credentials and database name.

This sample data helps simulate real-world scenarios and relationships in the Airbnb platform.
