DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Chain;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Rent;

CREATE TABLE Chain (
    chain_name VARCHAR(50) PRIMARY KEY,
    num_of_hotels INTEGER NOT NULL,
    street_num INTEGER NOT NULL,
    street_name VARCHAR(50) NOT NULL,
    apartment_num INTEGER,
    city VARCHAR(50) NOT NULL,
    province_state VARCHAR(2) NOT NULL,
    postal_code VARCHAR(7) NOT NULL,
    country VARCHAR(50) NOT NULL,
    contact_email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(14) NOT NULL
);

CREATE TABLE Hotel (
    HID INTEGER PRIMARY KEY AUTOINCREMENT,
    chain_name VARCHAR(50) NOT NULL,
    num_of_stars TINYINT NOT NULL,
    num_of_rooms INTEGER NOT NULL,
    street_num INTEGER NOT NULL,
    street_name VARCHAR(50) NOT NULL,
    apartment_num INTEGER,
    city VARCHAR(50) NOT NULL,
    province_state VARCHAR(2) NOT NULL,
    postal_code VARCHAR(7) NOT NULL,
    country VARCHAR(50) NOT NULL,
    contact_email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(14) NOT NULL,
    FOREIGN KEY(chain_name) REFERENCES Chain(chain_name) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE Room (
    room_num INTEGER PRIMARY KEY AUTOINCREMENT,
    HID INTEGER FOREIGN KEY,
    price NUMERIC(6, 2) NOT NULL,
    amenities VARCHAR(50) NOT NULL,
    capacity TINYINT NOT NULL,
    view VARCHAR(50) NOT NULL,
    extendable BOOLEAN NOT NULL,
    probs_or_dmgs VARCHAR(50)
    FOREIGN KEY(HID) REFERENCES Hotel(HID) ON DELETE CASCADE
);

CREATE TABLE Customer(
    CID INTEGER PRIMARY KEY AUTOINCREMENT,  
    HID INTEGER FOREIGN KEY,
    SIN VARCHAR(11) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    mid_init VARCHAR(1),
    last_name VARCHAR(50) NOT NULL,
    street_num INTEGER NOT NULL,
    street_name VARCHAR(50) NOT NULL,
    apartment_num INTEGER,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(50),
    province_state VARCHAR(2) NOT NULL,
    postal_code VARCHAR(7) NOT NULL
    date_of_reg DATE NOT NULL,
    FOREIGN KEY(HID) REFERENCES Hotel(HID) ON DELETE CASCADE
);

CREATE TABLE Employee(
    EID INTEGER PRIMARY KEY AUTOINCREMENT,
    HID INTEGER FOREIGN KEY,
    SIN VARCHAR(11) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    mid_init VARCHAR(1),
    last_name VARCHAR(50) NOT NULL,
    street_num INTEGER NOT NULL,
    street_name VARCHAR(50) NOT NULL,
    apartment_num INTEGER,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(50),
    province_state VARCHAR(2) NOT NULL,
    postal_code VARCHAR(7) NOT NULL,
    position VARCHAR(50) NOT NULL,
    FOREIGN KEY(HID) REFERENCES Hotel(HID) ON DELETE CASCADE
);

CREATE TABLE Book(
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    room_num SMALLINT,
    customer_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY(room_num) REFERENCES Room(room_num),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY(room_num) REFERENCES Room(room_num) ON DELETE SET NULL,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE SET NULL
);

CREATE TABLE Rent(
    rent_id INTEGER PRIMARY KEY AUTOINCREMENT,
    room_num SMALLINT,
    customer_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
	FOREIGN KEY(room_num) REFERENCES Room(room_num) ON DELETE SET NULL,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE SET NULL
);
