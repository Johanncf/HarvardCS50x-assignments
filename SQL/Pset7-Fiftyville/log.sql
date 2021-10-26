-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Description in the crime scene report that matches place and date of the theft:
SELECT description FROM crime_scene_reports WHERE street = "Chamberlin Street" AND month = 7 AND day = 28 AND year = 2020;

-- description
-- Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse.
-- Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the courthouse.

--
-- Getting transcripts of witnesses reports:
SELECT transcript, name FROM interviews WHERE transcript LIKE "%courthouse%" AND month = 7 AND day = 28 AND year = 2020;

-- transcript

-- Witness 1 (Ruth):
-- Sometime within ten minutes of the theft --hour: 10:15/10:25--, I saw the thief get into a car in the courthouse parking lot and drive away. --activity=exit--
-- If you have security footage from the courthouse parking lot, you might want to look for cars that left the parking lot in that time frame.

-- Witness 2 (Eugene):
-- I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at the courthouse,
-- I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.

-- Witness 3 (Raymon):
-- As the thief was leaving the courthouse, they called someone who talked to them for less than a minute.
-- In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
-- The thief then asked the person on the other end of the phone to purchase the flight ticket.

--
-- Querying list of license plate of possible thief's car:
SELECT license_plate FROM courthouse_security_logs WHERE hour = 10 AND (15 < minute < 26) AND activity = "exit";
-- license_plate
-- 5209A97
-- 5P2BI95
-- 94KL13X
-- 6P58WS2
-- 4328GD8
-- G412CB7
-- L93JTIZ
-- 322W7JE
-- 0NTHK55
-- 1106N58
-- 11J91FW
-- PF37ZVK
-- 1M92998
-- XE95071
-- IH61GO8
-- 8P9NEU9
-- ET017P4
-- 4ZY7I8T
-- P14PE2Q
-- 84869TJ

--
-- Querying list of thief's possible account_numbers FROM atm_transactions TABLE:
SELECT account_number FROM atm_transactions WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = "Fifer Street" AND transaction_type = "withdraw";
-- account_number
-- 28500762
-- 28296815
-- 76054385
-- 49610011
-- 16153065
-- 25506511
-- 81061156
-- 26013199

--
-- Querying list of person_id from the list of possible account_number:
SELECT person_id FROM bank_accounts WHERE account_number IN (
    SELECT account_number FROM atm_transactions WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = "Fifer Street" AND transaction_type = "withdraw"
);

--
-- Querying list of names from the list of person_id:
SELECT name FROM people WHERE id IN (
    SELECT person_id FROM bank_accounts WHERE account_number IN (
        SELECT account_number FROM atm_transactions WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = "Fifer Street" AND transaction_type = "withdraw"
    )
);
-- names:
-- Bobby
-- Elizabeth
-- Victoria
-- Madison
-- Roy
-- Danielle
-- Russell
-- Ernest

--
-- Querying phone numbers of calls that fits Raymon description:
SELECT id FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60;
SELECT caller FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60;
SELECT receiver FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60;

--
-- Querying phone_number owner's names:
SELECT name, phone_number FROM people 
WHERE phone_number IN (
    SELECT caller FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60
)
AND name IN (
        SELECT name FROM people WHERE id IN (
            SELECT person_id FROM bank_accounts WHERE account_number IN (
                SELECT account_number FROM atm_transactions WHERE year = 2020 AND month = 7 AND day = 28 AND atm_location = "Fifer Street" AND transaction_type = "withdraw"
            )
        )
)
AND license_plate IN (
    SELECT license_plate FROM courthouse_security_logs WHERE hour = 10 AND minute > 15 AND minute < 26 AND activity = "exit"
);
-- name
-- Russell
-- Ernest

--
-- Fiftyville airport info:
-- 8 | CSF | Fiftyville Regional Airport | Fiftyville

--
-- Inspect first flight and passengers passports leaving from Fiftyville in the day after the robery:

-- Flight:
SELECT id FROM flights WHERE origin_airport_id = 8 AND year = 2020 AND month = 7 AND day = 29 ORDER BY hour, minute LIMIT 1;
-- 36

-- Passport numbers:
SELECT passport_number FROM passengers WHERE flight_id = 36;

-- Thief's name from passport numbers and list of suspects:
SELECT name FROM people 
WHERE passport_number IN (
    SELECT passport_number FROM passengers WHERE flight_id = 36
)
AND name IN ('Russell', 'Ernest');
-- Thief's name:
-- Ernest

-- Thief's partner's name:
SELECT name FROM people
WHERE phone_number = (
    SELECT receiver FROM phone_calls 
    WHERE (
        year = 2020 AND month = 7 AND day = 28 AND duration < 60 AND caller = '(367) 555-5533'
    ) 
);
-- Berthold

-- Scape location: 
SELECT city FROM airports WHERE id = (
    SELECT destination_airport_id FROM flights WHERE id = 36
);
-- city
-- London
    