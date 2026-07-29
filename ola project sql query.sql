select * from ola_data_sql;

use my_projects;

select * from ola_data_sql;

alter table ola_data_sql
add hr int;

set sql_safe_updates = 0;

update ola_data_sql
set hr = hour(time);

select vehicle_type, avg(ride_distance) from ola_data_sql
group by Vehicle_Type;



-- --------------------------------------------------------------------------------------------------------

-- ANALYSIS PART
select * from ola_data_sql;
-- Revenue
-- Total revenue
select sum(revenue_made) as total_revenue from ola_data_sql;

-- Date wise revenue
select date, sum(revenue_made) as date_wise_revenue from ola_data_sql
group by date
order by date;

-- Which vehicle type generates the most revenue ?
select vehicle_type, sum(revenue_made) from ola_data_sql
group by Vehicle_Type
order by sum(revenue_made) desc
limit 1;

-- Which vehicle type generates the least revenue ?
select vehicle_type, sum(revenue_made) from ola_data_sql
group by Vehicle_Type
order by sum(revenue_made) asc
limit 1;

 -- Booking status
 --  total Successful ride
 select count(booking_status) from ola_data_sql
 where booking_status = "Success";
 
-- Driver not found
 select count(booking_status) from ola_data_sql
 where booking_status = "Driver Not Found";

 -- Cancel by driver
 select count(booking_status) from ola_data_sql
 where booking_status = "Canceled by Driver";
 
-- Cancel by customer
select count(booking_status) from ola_data_sql
 where booking_status = "Canceled by Customer";


-- Success
-- Which vehicle type has the most no. of successful rides ?
select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Success"
group by Vehicle_Type
order by count(Booking_Status) desc
limit 1;

-- Which vehicle type has the least no. of successful rides ?
select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Success"
group by Vehicle_Type
order by count(Booking_Status) asc
limit 1;

--  Driver not found
--   Which vehicle type has the most rides cancelled due to driver’s unavailability ? 
select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Driver Not Found"
group by Vehicle_Type
order by count(Booking_Status) desc
limit 1;
 
 -- Which vehicle type has the least rides cancelled due to driver’s unavailability ? 
 select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Driver Not Found"
group by Vehicle_Type
order by count(Booking_Status) asc
limit 1;

-- Cancel by driver
-- Which vehicle type has the most rides cancelled by drivers ?
select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Canceled by Driver"
group by Vehicle_Type
order by count(Booking_Status) desc
limit 1;
    
-- Which vehicle type has the least rides cancelled by drivers ?
select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Canceled by Driver"
group by Vehicle_Type
order by count(Booking_Status) asc
limit 1;

-- Cancel by customer
-- Which vehicle type has the most cancellation due to customers ?
select vehicle_type, count(Booking_Status) from ola_data_sql
where Booking_Status = "Canceled by Customer"
group by vehicle_type
order by count(Booking_Status) desc
limit 1;
     
-- Which vehicle type has the least cancellation due to customers ?
select vehicle_type, count(booking_status) from ola_data_sql
where Booking_Status = "Canceled by Customer"
group by Vehicle_type
order by count(booking_status) asc
limit 1;

-- Ride distance
-- Which vehicle has covered the most distance ?
select vehicle_type, sum(ride_distance) from ola_data_sql
group by vehicle_type
order by sum(Ride_Distance) desc
limit 1;

-- Which vehicle has covered the least distance ?
select vehicle_type, sum(ride_distance) from ola_data_sql
group by vehicle_type
order by sum(Ride_Distance) asc
limit 1;

-- count of each Payment method
select Payment_Method, count(payment_method) from ola_data_sql
group by Payment_Method;
    
--  Customer rating for each vehicle
select vehicle_type, round(avg(customer_rating),2) from ola_data_sql
group by vehicle_type;









