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
