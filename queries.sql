--Retrieve booking information along with: Customer name, Vehicle name
select booking_id, u.name as customer_name, v.name as vehicle_name, start_date, end_date, b.status from bookings b
join vehicles v
on b.vehicle_id = v.vehicle_id
join users u
on u.user_id = b.user_id


--Find all vehicles that have never been booked.
select v.*
from vehicles v
left join bookings b
on v.vehicle_id = b.vehicle_id
where b.vehicle_id is null
order by v.vehicle_id

--Find all vehicles that have never been booked.
select * from vehicles
where status = 'available' and type = 'car';

-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
select v.name as vehicle_name, count(b.booking_id) as total_bookings
from vehicles v
join bookings b on v.vehicle_id = b.vehicle_id
group by v.vehicle_id, v.name
having count(b.booking_id) > 2;




