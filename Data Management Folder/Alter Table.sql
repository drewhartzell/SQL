ALTER TABLE orders
ADD COLUMN Sale_Year INT;
UPDATE orders
SET  Sale_Year = YEAR(Sale_Date);

//
//

ALTER TABLE orders
ADD COLUMN Sale_Month INT;
UPDATE orders
SET Sale_Month = MONTH(Sale_Date);

//
//

ALTER TABLE orders
ADD COLUMN Sale_Month_Name char(225);
UPDATE orders
SET Sale_Month_Name = MONTHNAME(Sale_Date);

//
//

ALTER TABLE orders
ADD COLUMN Sale_Day INT;
UPDATE orders
SET Sale_Day = DAY(Sale_Date);
UPDATE orders
SET Order_Net = ROUND(Order_Net,2);
