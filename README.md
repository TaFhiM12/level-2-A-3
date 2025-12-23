````md
# Vehicle Rental System – SQL Queries Documentation

## Project Overview

This project demonstrates the use of SQL queries in a Vehicle Rental System database. The objective is to retrieve meaningful information using joins, filtering, grouping, and aggregate functions while following standard relational database principles.

The database consists of the following main tables:

- users – stores customer information  
- vehicles – stores vehicle details  
- bookings – stores booking records that link users and vehicles  


## File: `queries.sql`

This file contains SQL queries that solve common business requirements in a vehicle rental system.

---

## Query 1: Retrieve Booking Information with Customer and Vehicle Names

### Requirement

Retrieve booking details along with:
- customer name  
- vehicle name  
- booking start date  
- booking end date  
- booking status  

### Solution

```sql
select booking_id,
       u.name as customer_name,
       v.name as vehicle_name,
       start_date,
       end_date,
       b.status
from bookings b
join vehicles v on b.vehicle_id = v.vehicle_id
join users u on u.user_id = b.user_id;
````

### Explanation

* joins the bookings table with vehicles to get vehicle information
* joins the bookings table with users to get customer information
* returns only matching records from all three tables
* table aliases improve query readability

---

## Query 2: Find All Vehicles That Have Never Been Booked

### Requirement

Identify vehicles that have no booking history.

### Solution

```sql
select v.*
from vehicles v
left join bookings b on v.vehicle_id = b.vehicle_id
where b.vehicle_id is null
order by v.vehicle_id;
```

### Explanation

* left join ensures all vehicles are included
* vehicles without bookings return null values from the bookings table
* the where condition filters only unbooked vehicles

---

## Query 3: Find Available Cars

### Requirement

Retrieve all vehicles that:

* are currently available
* are of type car

### Solution

```sql
select *
from vehicles
where status = 'available'
  and type = 'car';
```

### Explanation

* the where clause applies multiple conditions
* only vehicles matching both conditions are returned

---

## Query 4: Vehicles with More Than 2 Bookings

### Requirement

Find vehicles that have been booked more than two times and display:

* vehicle name
* total number of bookings

### Solution

```sql
select v.name as vehicle_name,
       count(b.booking_id) as total_bookings
from vehicles v
join bookings b on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;
```

### Explanation

* count calculates the total number of bookings per vehicle
* group by groups records by vehicle
* having filters grouped results based on aggregate values
* only vehicles with more than two bookings are shown

