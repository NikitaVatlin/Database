--Represents Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ShopID INT,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Quantity INT,
    Brand VARCHAR(50),
    ImageURL VARCHAR(255),
    Reviews TEXT,
    Characteristics TEXT,
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

--represents Customer information
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    Birthday DATE,
    Gender VARCHAR(10)
);

--represents Orders
CREATE TABLE Orders (
    OrdersID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrdersDate DATE,
    Price DECIMAL(10, 2),
    Status VARCHAR(50),
    ShippingAddress VARCHAR(255),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

--represents Shop
CREATE TABLE Shop (
    ShopID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Rating DECIMAL(3, 2),
    Reviews INT,
    Logo VARCHAR(255),
    Geolocation VARCHAR(255),
    OwnerInformation TEXT
);

--indexes created
CREATE INDEX idx_price ON Product (Price);
CREATE INDEX idx_order_date ON Orders (OrdersDate);
CREATE INDEX idx_customer_id ON Orders (CustomerID);
CREATE INDEX idx_brand ON Product (Brand);
CREATE INDEX customer_search ON Customer (FirstName,LastName,Email,Address);
CREATE INDEX product_search ON Product (name);
CREATE INDEX shop_search ON Shop (name);


--Представление для отображения всех продуктов с их ценами: (SELECT * FROM ProductPrices;)
CREATE VIEW ProductPrices AS
    SELECT Name, Price
    FROM Product;

--Представление для отображения всех заказов с датами размещения:
CREATE VIEW OrdersDates AS
    SELECT OrdersID, OrdersDate
    FROM Orders;

--Представление для отображения продуктов с количеством единиц их наличия:
CREATE VIEW ProductQuantities AS
    SELECT Name, Quantity
    FROM Product;

--Представление для отображения заказов и соответствующих клиентов:
CREATE VIEW OrdersWithCustomers AS
    SELECT OrdersID, CustomerID, Customer.FirstName AS Customer
    FROM Orders
    INNER JOIN Customer ON Orders.CustomerID = Customer.CustomerID;

--Представление для отображения средней цены продуктов по брендам:
CREATE VIEW AverageProductPriceByBrand AS
    SELECT Brand, AVG(Price) AS AvgPrice
    FROM Products
    GROUP BY Brand;

--Представление для отображения самых популярных продуктов по количеству отзывов:
CREATE VIEW PopularProducts AS
    SELECT Name, COUNT(Reviews) AS ReviewCount
    FROM Products
    GROUP BY Name
    ORDER BY ReviewCount DESC;

--Представление для отображения продуктов с их характеристиками:
CREATE VIEW ProductCharacteristics AS
    SELECT Name, Characteristics
    FROM Products;

--Создание представления для отображения суммы заказов по месяцам:
CREATE VIEW MonthlyOrdersTotal AS
    SELECT YEAR(OrdersDate) AS Year, MONTH(OrdersDate) AS Month, SUM(TotalAmount) AS Total
    FROM Orders
    GROUP BY YEAR(OrdersDate), MONTH(OrdersDate);
