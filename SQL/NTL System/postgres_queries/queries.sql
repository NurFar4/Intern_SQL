-- Get Name, Price, Quantity and UOM from Product
-- Table Used:
-- product_id, product_product
-- name, price, product_template
-- UOM, product_template, uom_id
-- quantity, stock_quant
SELECT b.name "Name", b.list_price "Price", c.name "UOM", d.quantity "Quantity"
FROM public.product_product a
LEFT JOIN public.product_template b
ON a.product_tmpl_id = b.id
LEFT JOIN public.uom_uom c
ON b.uom_id = c.id
LEFT JOIN public.stock_quant d
ON a.id = d.product_id
WHERE b.name
LIKE 'Silver Blue Solar Tinting(%';

-- Populate Customer
-- Get Name, Address Line 1, Address Line 2, City, State, Zip Code, Country
SELECT a.name "Name", a.street "Address Line 1", a.street2 "Address Line 2", a.city "City", a.zip "Zip Code", c.name "State", b.name "Country"
FROM public.res_partner a
LEFT JOIN public.res_country b
ON a.country_id = b.id 
LEFT JOIN public.res_country_state c
ON a.state_id = c.id;
    