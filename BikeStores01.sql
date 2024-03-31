Select 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) as 'Customer_name',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) as 'total_units',
	SUM(ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) as 'sales_rep',
	bra.brand_name

From sales.orders ord
join sales.customers cus
On ord.customer_id = cus.customer_id
join sales.order_items ite
On ord.order_id = ite.order_id
join production.products pro
On ite.product_id = pro.product_id
join production.categories cat
On pro.category_id = cat.category_id
join sales.stores sto
On ord.store_id = sto.store_id
join sales.staffs sta
On ord.staff_id = sta.staff_id
JOIN production.brands bra
ON pro.brand_id = bra.brand_id

GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name),
	bra.brand_name