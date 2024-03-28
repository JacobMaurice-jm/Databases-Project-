CREATE UNIQUE INDEX login_index
ON Employee (first_name, password);

CREATE INDEX hotel_area_index
ON Hotel (city, country);

CREATE INDEX price_index
ON Room (price);
