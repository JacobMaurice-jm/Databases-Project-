DROP VIEW IF EXISTS hotel_total_room_capacities;
DROP VIEW IF EXISTS hotel_free_rooms_in_area;

CREATE VIEW hotel_free_rooms_per_area AS
SELECT city, COUNT(*) hotel_count
FROM Hotel
GROUP BY city;

CREATE VIEW hotel_total_room_capacities AS
SELECT HID, SUM(capacity) AS total_capacity
FROM Room
GROUP BY HID;
