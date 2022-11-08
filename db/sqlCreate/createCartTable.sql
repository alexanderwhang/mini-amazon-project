--Cart Table (Alex)

drop table if exists Cart;
CREATE TABLE Carts (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    uid INT NOT NULL REFERENCES Users(id),
    pid INT NOT NULL REFERENCES Products(id),
    quantity INT NOT NULL DEFAULT 1,
    time_added_to_cart timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC')
);