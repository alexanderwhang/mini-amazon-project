--Product Tables (Advaita)

DROP TABLE IF EXISTS Categories cascade;
DROP TABLE IF EXISTS Products cascade;

CREATE TABLE IF NOT EXISTS Categories(
    cat VARCHAR(255) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Products (
    product_id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INT NOT NULL REFERENCES Users(user_id),
    category NOT NULL REFERENCES Categories(cat),
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(4095) UNIQUE,
    price DECIMAL(12,2) NOT NULL,
    imageurl VARCHAR(255) UNIQUE,
    quantity INT NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    avg_rating DECIMAL(2,1)
);