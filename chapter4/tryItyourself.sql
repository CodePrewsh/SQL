COPY (
    SELECT  geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010
	order by housing_unit_count_100_percent desc
	LIMIT 20
     )
TO 'C:\YourDirectory\us_countries_2010.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');