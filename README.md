# Vehicle rental system

## Project overview
This project demonstrates sql queries for a vehicle rental system database. it includes practical queries for retrieving booking information, checking vehicle availability, and analyzing rental patterns.

## sql queries

### query 1: retrieve booking details with customer and vehicle information
```sql
select booking_id, u.name as customer_name, v.name as vehicle_name, start_date, end_date, b.status 
from bookings b
join vehicles v on b.vehicle_id = v.vehicle_id
join users u on u.user_id = b.user_id;
```

**Explanation:** This query joins three tables to show complete booking information. it combines data from bookings, vehicles, and users tables to display who booked which vehicle and when. this is useful for customer service and generating booking reports.

### query 2: find vehicles that have never been booked
```sql
select v.*
from vehicles v
left join bookings b on v.vehicle_id = b.vehicle_id
where b.vehicle_id is null
order by v.vehicle_id;
```

**Explanation:** this query identifies vehicles with no booking history. it uses a left join to include all vehicles and filters for those without matching booking records. this helps identify underused vehicles in the fleet.

### query 3: find available vehicles of specific type
```sql
select * 
from vehicles
where status = 'available' and type = 'car';
```

**Explanation:** This simple query filters vehicles based on availability and type. it shows all cars currently available for rental, helping customers and staff check real-time availability.

### query 4: find frequently booked vehicles
```sql
select v.name as vehicle_name, count(b.booking_id) as total_bookings
from vehicles v
join bookings b on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;
```

**Explanation:** This query analyzes booking patterns by counting how many times each vehicle has been rented. it groups bookings by vehicle and shows only those with more than 2 bookings, helping identify popular vehicles in the fleet.

