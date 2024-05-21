SELECT * FROM Customer
WHERE Deleted = 1;

SELECT * FROM product
WHERE Brand = 'Apple';

SELECT * FROM orders
WHERE customerID = 1;

UPDATE customer
SET email = 'johndoe@gmail.com'
WHERE customerid = 1;

UPDATE product
SET price = 399.99
WHERE productID = 147;

DELETE FROM orders
WHERE OrdersID = 201;

DELETE FROM customer
WHERE customerid = 1;

SELECT * FROM product
WHERE price < 100;

SELECT * FROM orders
WHERE ordersdate BETWEEN '01-01-2023' AND '05-01-2023';
