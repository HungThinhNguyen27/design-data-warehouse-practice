-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
BEGIN;


CREATE TABLE DimDate (
    Dateid INT PRIMARY KEY,
    date DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    QuarterName VARCHAR(2) NOT NULL,
    Month INT NOT NULL,
    Monthname VARCHAR(255) NOT NULL,
    Day INT NOT NULL,
    Weekday INT NOT NULL,
    WeekdayName VARCHAR(255) NOT NULL
);

CREATE TABLE DimProduct (
    Productid INT PRIMARY KEY,
    Producttype VARCHAR(255) NOT NULL
);

CREATE TABLE DimCustomerSegment (
    Segmentid INT PRIMARY KEY,
    City VARCHAR(255) NOT NULL
);

CREATE TABLE FactSales (
    Salesid VARCHAR(255) PRIMARY KEY,
    Dateid INT NOT NULL,
    Productid INT NOT NULL,
    Segmentid INT NOT NULL,
    Price_PerUnit DECIMAL(10, 2) NOT NULL,
    QuantitySold INT NOT NULL,
    FOREIGN KEY (Dateid) REFERENCES DimDate(Dateid),
    FOREIGN KEY (Productid) REFERENCES DimProduct(Productid),
    FOREIGN KEY (Segmentid) REFERENCES DimCustomerSegment(Segmentid)
);

END;



-- # Firstly, run the command below to set your PostgreSQL password for authentication. Replace <your_password> with your actual PostgreSQL password, and then execute the command:
-- export PGPASSWORD=RXUavy6IOhKZEteGFKbhheqJ

-- # Now, run the command below to create a database named <tu dat ten>.
-- createdb -h postgres -U postgres -p 5432 salesDW

-- # Run the command below to create the schema in the under <name> database.
-- psql  -h postgres -U postgres -p 5432 salesDW < star-schema.sql

-- Copy data from csv file to DW using command line
-- psql -h postgres -U postgres -d salesDW -c "\copy dimProduct FROM '/home/project/DimProduct.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')"


