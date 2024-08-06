SELECT
    date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
    date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
    date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
    date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
    date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
    date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
    date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
    date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
    date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
    date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";

-- Bonus: Using the SQL-standard extract() for similar datetime parsing:

SELECT extract('year' from '2019-12-01 18:37:12 EST'::timestamptz) AS "year";


-- Listing 11-2: Three functions for making datetimes from components

-- make a date
SELECT make_date(2018, 2, 22);
-- make a time
SELECT make_time(18, 4, 30.3);
-- make a timestamp with time zone
SELECT make_timestamptz(2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

-- Bonus: Retrieving the current date and time

SELECT
    current_date,
    current_time,
    current_timestamp,
    localtime,
    localtimestamp,
    now();

CREATE TABLE current_time_example (
    time_id bigserial,
    current_timestamp_col timestamp with time zone,
    clock_timestamp_col timestamp with time zone
);

INSERT INTO current_time_example (current_timestamp_col, clock_timestamp_col)
    (SELECT current_timestamp,
            clock_timestamp()
     FROM generate_series(1,1000));

SELECT * FROM current_time_example;



-- Listing 11-4: Showing your PostgreSQL server's default time zone

SHOW timezone; -- Note: You can see all run-time defaults with SHOW ALL;

-- Listing 11-5: Showing time zone abbreviations and names

SELECT * FROM pg_timezone_abbrevs;
SELECT * FROM pg_timezone_names;

-- Filter to find one
SELECT * FROM pg_timezone_names
WHERE name LIKE 'Europe%';




