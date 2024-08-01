WITH ny_counties AS (
    SELECT geo_name,
           p0010001 AS total_population,
           p0010005 AS american_indian_alaska_native_alone
    FROM us_counties_2010
    WHERE state_us_abbreviation = 'NY'
)

SELECT geo_name AS county,
       (american_indian_alaska_native_alone::float / total_population::float) * 100 AS percentage
FROM ny_counties
ORDER BY percentage DESC
LIMIT 1;
