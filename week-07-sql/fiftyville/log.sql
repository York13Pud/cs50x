-- Keep a log of any SQL queries you execute as you solve the mystery.

-- List the crime scene reports for the 28/7/2021:
SELECT id, year, month, day, street, description
FROM crime_scene_reports
WHERE 
    year = 2021 AND 
    month = 7 AND 
    day = 28 AND
    street = "Humphrey Street";

-- One for the duck and another for littering.
-- Bakery mentioned by three witnesses.
-- Theft was at 10:15am.

-- Look at the interviews for the day of the theft:
SELECT id, name, year, month, day, transcript
FROM interviews
WHERE 
    year = 2021 AND 
    month = 7 AND 
    day >= 28;

-- Narrow down the results to include thief:
SELECT id, name, year, month, day, transcript
FROM interviews
WHERE 
    year = 2021 AND 
    month = 7 AND 
    day >= 28 
    AND transcript LIKE "%thief%";

-- Results:
-- Ruth: Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
-- Eugene: I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
-- Raymond:	As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.

-- Next up, look at ATM withdraw transactions for the 28/7/2021:
SELECT 
    atm_transactions.account_number, people.name, year, month, day, atm_location, transaction_type, amount
FROM 
    atm_transactions
INNER JOIN 
    bank_accounts ON bank_accounts.account_number = atm_transactions.account_number
INNER JOIN 
    people ON people.id = bank_accounts.person_id
WHERE 
    year = 2021 AND 
    month = 7 AND 
    day = 28 AND
    atm_location = "Leggett Street" AND
    transaction_type = "withdraw";

-- Results:
-- Bruce   -  50
-- Diana   -  35
-- Brooke  -  80
-- Kenny   -  20
-- Iman    -  20
-- Luca    -  48
-- Taylor  -  60
-- Benista -  30

-- No timestamps were available so nothing can be concluded for the above results
-- but it does narrow the list down.ABORT

-- Next, look at the bakery security logs:
SELECT 
    people.name, bakery_security_logs.license_plate, year, month, day, hour, minute, activity
FROM 
    bakery_security_logs
INNER JOIN
    people ON people.license_plate = bakery_security_logs.license_plate
WHERE 
    year = 2021 AND 
    month = 7 AND 
    day = 28 AND
    hour = 10 AND
    minute >= 15 AND minute <= 25 AND
    activity = "exit";

-- Results:
-- Name       Car_reg
-- Vanessa	- 5P2BI95
-- Bruce	- 94KL13X
-- Barry	- 6P58WS2
-- Luca	    - 4328GD8
-- Sofia	- G412CB7
-- Iman	    - L93JTIZ
-- Diana	- 322W7JE
-- Kelsey	- 0NTHK55

-- Common names between the bakery and ATM are: Bruce, Luca, Iman, Diana

-- Next, let's look at the phone logs as one person mentioned a short call:
SELECT 
    phone_calls.caller, 
    cp.name, 
    phone_calls.receiver, 
    rp.name, 
    phone_calls.year, 
    phone_calls.month, 
    phone_calls.day, 
    phone_calls.duration
FROM 
    phone_calls
INNER JOIN
    people AS cp ON cp.phone_number = phone_calls.caller
INNER JOIN
    people AS rp ON rp.phone_number = phone_calls.receiver
WHERE 
    phone_calls.year = 2021 AND 
    phone_calls.month = 7 AND 
    phone_calls.day = 28 AND
    phone_calls.duration <= 60;

-- Phone Call Results:
-- caller	        name	receiver	    name	
-- (130) 555-0289	Sofia	(996) 555-8899	Jack    	2021	7	28	51
-- (499) 555-9472	Kelsey	(892) 555-8872	Larry	    2021	7	28	36
-- (367) 555-5533	Bruce	(375) 555-8161	Robin	    2021	7	28	45
-- (609) 555-5876	Kathryn	(389) 555-5198	Luca	    2021	7	28	60
-- (499) 555-9472	Kelsey	(717) 555-1342	Melissa	    2021	7	28	50
-- (286) 555-6063	Taylor	(676) 555-6554	James	    2021	7	28	43
-- (770) 555-1861	Diana	(725) 555-3243	Philip	    2021	7	28	49
-- (031) 555-6622	Carina	(910) 555-3251	Jacqueline	2021	7	28	38
-- (826) 555-1652	Kenny	(066) 555-9701	Doris	    2021	7	28	55
-- (338) 555-6650	Benista	(704) 555-2131	Anna	    2021	7	28	54

-- Common names: Bruce, Diana, Luca

-- Next, look at the flights as one witness mentioned the caller wanted the earliest flight
-- out the next day (29/07/2021):


-- Results:
-- id	origin_name	                city	    dest_name	                        city	        year	month	day	hour	minute
-- 36	Fiftyville Regional Airport	Fiftyville	LaGuardia Airport	                New York City	2021	7	    29	8	    20
-- 43	Fiftyville Regional Airport	Fiftyville	O'Hare International Airport	    Chicago	        2021	7	    29	9	    30
-- 23	Fiftyville Regional Airport	Fiftyville	San Francisco International Airport	San Francisco	2021	7	    29	12	    15
-- 53	Fiftyville Regional Airport	Fiftyville	Tokyo International Airport	        Tokyo           2021	7	    29	15	    20
-- 18	Fiftyville Regional Airport	Fiftyville	Logan International Airport	        Boston          2021	7	    29	16	    0

-- id 36 is the earliest flight out of Fiftyville the following day. 

-- Next, Let's have a look at the passengers for that flight:
SELECT 
    flight_id, 
    passengers.passport_number, 
    people.name,
    seat
FROM 
    passengers
INNER JOIN
    people ON people.passport_number = passengers.passport_number
WHERE 
    flight_id = 36;

-- Results: 
-- flight_id	passport_number	name	seat
-- 36	        7214083635	    Doris	2A
-- 36	        1695452385	    Sofia	3B
-- 36	        5773159633	    Bruce	4A
-- 36	        1540955065	    Edward	5C
-- 36	        8294398571	    Kelsey	6C
-- 36	        1988161715	    Taylor	6D
-- 36	        9878712108	    Kenny	7A
-- 36	        8496433585	    Luca	7B

-- Conclusion:
-- After going through the tables, the only common name that came up was Bruce.
-- Bruce made a call to Robin so my conclusion is Bruce is the thief, who escaped to New York City and Robin
-- is the accomplice.
