drop table if exists Users cascade;
drop table if exists Orders cascade;
DROP TABLE IF EXISTS Products cascade;
DROP TABLE IF EXISTS Categories cascade;

CREATE TABLE IF NOT EXISTS Categories(
    cat VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE if not exists Users (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    address VARCHAR NOT NULL,
    seller BOOLEAN DEFAULT FALSE,
    balance REAL DEFAULT 0 CHECK(balance >= 0) NOT NULL
);

CREATE TABLE if not exists Orders (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INT NOT NULL REFERENCES Users(id),
    total_price REAL NOT NULL CHECK(total_price >= 0),
    total_items INT NOT NULL CHECK(total_items > 0),
    time_stamp timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
);

CREATE TABLE IF NOT EXISTS Products (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INT NOT NULL REFERENCES Users(id),
    category VARCHAR(255) NOT NULL REFERENCES Categories(cat),
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(4095) UNIQUE,
    price DECIMAL(12,2) NOT NULL,
    imageurl VARCHAR(255),
    quantity INT NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    avg_rating DECIMAL(2,1)
);

-- Product Feedback (Aaric)
drop table if exists Review;
CREATE TABLE if not exists Review (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    uid INT NOT NULL REFERENCES Users(id),
    pid INT NOT NULL REFERENCES Products(id),
    review_time timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    review_content VARCHAR(255) NOT NULL,
    review_rating INT NOT NULL CHECK (review_rating BETWEEN 1 AND 5)
);