--make chaneg in Config File: /etc/mysql/my.cnf as below
--[mysqld] 
--sql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
--to Remove ONLY_FULL_GROUP_BY sql mode from console


--STEP 1: list the order items with details of products and then order by order_id

SELECT O.order_id, O.product_id, P.name, P.unit_price, O.quantity\
FROM order_items O, products P\
WHERE O.product_id = P.product_id\
ORDER BY order_id;


--STEP 2: concatenate all of the columns found in above query. Use "|" (Any arbitrary it can be) as a seperator

SELECT O.order_id, CONCAT(O.product_id, '|' , P.name, '|', P.unit_price, '|', O.quantity) AS STRINGED\
FROM order_items O, products P\
WHERE O.product_id = P.product_id\
ORDER BY order_id;


--STEP 3: group by the rows per order_id and concatenate the results

SELECT O.order_id, GROUP_CONCAT(CONCAT(O.product_id, '|' , P.name, '|', P.unit_price, '|', O.quantity) SEPARATOR '|') AS details\
FROM order_items O, products P\
WHERE O.product_id = P.product_id\
GROUP BY O.order_id\
ORDER BY O.order_id;

