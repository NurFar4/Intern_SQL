-- Get Name, Price, Quantity AND UOM FROM Product
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
ON a.id = d.product_id;

-- Populate Customer
-- Get Name, Address Line 1, Address Line 2, City, State, Zip Code, Country
SELECT a.id "id",a.name "name", a.street "address_line_1", a.street2 "address_line_2", a.city "city", a.zip "zip_code", c.name "state", b.name "country"
FROM public.res_partner a
LEFT JOIN public.res_country b
ON a.country_id = b.id 
LEFT JOIN public.res_country_state c
ON a.state_id = c.id
ORDER BY a.id ASC;

-- Populate Order
-- Get Order Title, Order Date, Customer, Order Status
SELECT a.id "id", a.name "name", a.date_order "created_date", b.name "customer_name", a.state "status_name"
FROM public.sale_order a 
LEFT JOIN public.res_partner b 
ON a.partner_id = b.id
WHERE a.state IN ('sale', 'cancel')
ORDER BY a.name ASC;

-- Populate Order Item
-- Get Order ID, Product, UOM, Quantity, Unit Price, Sub Total, Discount Fee, tax, Total
SELECT e.id "id", c.name "product_name", d.name "uom_name", (a.qty_to_invoice + a.qty_invoiced) "quantity", a.price_unit "unit_price", a.price_total "total"
FROM public.sale_order_line a 
LEFT JOIN public.product_product b 
ON a.product_id = b.id 
LEFT JOIN public.product_template c 
ON b.product_tmpl_id = c.id
LEFT JOIN public.uom_uom d 
ON a.product_uom = d.id
LEFT JOIN public.sale_order e 
ON a.order_id = e.id
WHERE e.state = 'sale'
AND c.name IS NOT NULL
AND e.id = {order_id}
ORDER BY e.name ASC;

-- Get All Job Order [From Odoo]

-- Get All Job Order Item [From Odoo

DROP VIEW IF EXISTS VNtlPickingSummary;
DROP VIEW IF EXISTS VNtlPickingList;
DROP VIEW IF EXISTS VNtlSummary;

CREATE OR REPLACE VIEW VNtlSummary AS 
	SELECT b.id, b.name AS ItemDescription
	FROM public.sale_order a 
	INNER JOIN public.sale_order_line b 
	ON a.id = b.order_id 
	WHERE 1 = 1
	AND b.qty_delivered = 0
    AND a.invoice_status NOT IN ('invoiced', 'to invoice')
	ORDER BY b.id;

SELECT * FROM VNtlSummary WHERE item_description LIKE '%|%';
	 
CREATE OR REPLACE VIEW VNtlPickingList AS 
	SELECT 2 AS no, a.id, a.name, a.client_order_ref, b.name AS ItemDescription 
	FROM public.sale_order a 
	INNER JOIN public.sale_order_line b 
	ON a.id = b.order_id 
	WHERE 1 = 1
	AND b.qty_delivered = 0 
	AND a.id IN (SELECT id FROM VNtlSummary)
	ORDER BY a.id, b.id; 
	 
CREATE OR REPLACE VIEW VNtlPickingSummary AS 
	SELECT 1 AS no, id, name, client_order_ref, '' AS ItemDescription
	FROM VNtlPickingList 
	GROUP BY id, name, client_order_ref;
	 
-- Picking Summary
SELECT * FROM VNtlPickingSummary 
UNION ALL 
SELECT * FROM VNtlPickingList
ORDER BY id, no;

-- Job Order Item Listing
CREATE OR REPLACE VIEW VNtlJobOrderItem AS 
	SELECT b.id "id", b.name "item_description", b.product_uom_qty "quantity",c.name "uom", b.price_unit "unit_price", b.price_tax "tax_price", b.price_total "total_price", b.order_id "order_id"
	FROM public.sale_order a 
	INNER JOIN public.sale_order_line b 
	ON a.id = b.order_id
    LEFT JOIN public.uom_uom c
	ON b.product_uom = c.id
	WHERE 1 = 1
	ORDER BY b.id;


-- Customer Listing
CREATE OR REPLACE VIEW VNtlCustomer AS
    SELECT DISTINCT c.id "customer_id", c.display_name "customer_name", c.street "customer_street", c.street2 "customer_street2", c.zip "customer_zip_code", c.city "customer_city", d.name "customer_state", e.name "customer_country"
    FROM public.res_partner c
    INNER JOIN public.sale_order a
    ON a.partner_id = c.id
    LEFT JOIN public.res_country_state d
    ON c.state_id = d.id 
    LEFT JOIN public.res_country e 
    ON c.country_id = e.id
    WHERE 1 = 1;


-- Job Order Listing
CREATE OR REPLACE VIEW VNtlJobOrder AS
    SELECT a.id "id", a.name "name", a.name "code", a.client_order_ref "client_order_ref", a.date_order "created_date", a.amount_untaxed "sub_total_price", a.amount_tax "tax_price", a.amount_total "total_price", c.id "customer_id", c.display_name "customer_name", c.street "customer_street", c.street2 "customer_street2", c.zip "customer_zip_code", c.city "customer_city", d.name "customer_state", e.name "customer_country"
    FROM public.sale_order a
	LEFT JOIN public.res_partner c 
    ON a.partner_id = c.id
    LEFT JOIN public.res_country_state d
    ON c.state_id = d.id 
    LEFT JOIN public.res_country e 
    ON c.country_id = e.id
    WHERE 1 = 1;

SELECT * FROM VNtlCustomer;
SELECT * FROM VNtlJobOrderItem WHERE item_description LIKE '%|%';
SELECT * FROM VNtlJobOrder;

