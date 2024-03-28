DROP VIEW IF EXISTS hotel_total_room_capacity;
DROP VIEW IF EXISTS hotel_rooms_in_area;

CREATE VIEW hotel_rooms_in_area AS
SELECT city, COUNT(*) hotel_count
FROM Hotel
GROUP BY city;

CREATE VIEW hotel_total_room_capacitiy AS
SELECT HID, SUM(capacity) AS total_capacity
FROM Room
GROUP BY HID;
