--1 Get all customers and their addresses
SELECT * FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id;

--2 Get all orders and their line items.
SELECT * FROM "orders"
LEFT OUTER JOIN "line_items" ON "line_items".order_id = "orders".id;

--3 Which warehouses have cheetos?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos';

--4 Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';

--5 Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".id, "customers".first_name, count(*) FROM "orders"
JOIN "addresses" ON "addresses".id = "orders".address_id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "customers".id;

--6