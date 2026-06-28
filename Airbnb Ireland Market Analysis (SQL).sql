#What information is available in the Airbnb Ireland dataset?

select * 
from listings_clean lc ;

# How many Airbnb listings are there in Ireland?

select count(*) as total_listings
from listings_clean lc ;

# Which areas have the highest number of Airbnb listings?

select count(*) as total_listings
from listings_clean lc
group by lc.neighbourhood 
order by total_listings DESC 
limit 10;

# Which neighbourhoods have the most Airbnb listings?

select neighbourhood, 
count(*) as total_listing
from listings_clean lc 
group by  neighbourhood
order by total_listing DESC
limit 10;

# Which areas are the most expensive?

SELECT 
    neighbourhood,
    AVG(price) AS avg_price
    from listings_clean lc
    group by neighbourhood
    order by avg_price desc;

#Which room types are the most common?

SELECT
    room_type,
    COUNT(*) AS total_listings
FROM listings_clean
GROUP BY room_type
ORDER BY total_listings DESC;


# What is the average price for each room type?

select room_type,
AVG(price) AS avg_price,
 count(*) as total_listings
from listings_clean lc
group by room_type 
order by avg_price desc;

Which neighbourhoods receive the highest number of guest reviews?

SELECT
    neighbourhood,
    SUM(number_of_reviews) AS total_reviews,
    ROUND(AVG(number_of_reviews),2) AS avg_reviews,
    COUNT(*) AS total_listings
FROM listings_clean
GROUP BY neighbourhood
ORDER BY total_reviews DESC
LIMIT 10;


# Which areas receive the most guest reviews on average?

SELECT 
    neighbourhood,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    COUNT(*) AS total_listings
    from listings_clean lc
    group by neighbourhood
    order by avg_reviews desc;

#Which room types have the highest average annual availability?

SELECT
    room_type,
    ROUND(AVG(availability_365),2) AS avg_availability
FROM listings_clean
GROUP BY room_type
ORDER BY avg_availability DESC;




#Is the Airbnb market dominated by private hosts or professional hosts?

SELECT
    CASE
        WHEN calculated_host_listings_count = 1 THEN 'Single Listing'
        ELSE 'Multiple Listings'
    END AS host_type,
    COUNT(*) AS total_properties
FROM listings_clean
GROUP BY host_type;

    
