select 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) as 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) as 'total_units',
	sum(ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(stf.first_name,' ',stf.last_name) as 'sales_rep'
	,br.brand_name
from sales.orders as ord
join sales.customers as cus
on ord.customer_id = cus.customer_id
join sales.order_items as ite
on ord.order_id = ite.order_id
join production.products as pro
on ite.product_id = pro.product_id
join production.categories as cat
on pro.category_id = cat.category_id
join sales.stores as sto
on ord.store_id = sto.store_id
join sales.staffs as stf
on ord.staff_id = stf.staff_id
join production.brands as br
on br.brand_id = pro.brand_id
group by 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(stf.first_name,' ',stf.last_name),
	br.brand_name,
	store_name













