/*Вывести 5 последних записей с Id customer, firstname, lastname, email and phone
из таблиц customer и address*/
select customer.id_customer, customer.firstname, customer.lastname, 
customer.email, address.phone, address.city, address.address1 from customer
inner join address on customer.id_customer = address.id_customer 
ORDER BY id_customer DESC LIMIT 10


/*Вывести 5 последних записей из таблиц cart и cart_product с Id_cart, id_customer, 
id_product, id_product_attribute, quantity */
select cart.id_cart, cart.id_customer, cart_product.id_product, cart_product.id_product_attribute, 
cart_product.quantity from cart
inner join cart_product on cart_product.id_cart = cart.id_cart 
order by id_cart desc limit 5


/*Номер заказа взять из response в Postman (request "Create order"). 
 * Вывести запись из response в Postman (create order) из таблиц orders 
 * и order_datail с Id_order, product_id, 
id_customer, id_cart, product_price, product_quantity, total_paid. Проверить условие: 
цена*количество=сумма. */

SELECT orders.id_order, order_detail.product_id, orders.id_customer, orders.id_cart, 
order_detail.product_price, order_detail.product_quantity, orders.total_paid   
FROM orders
inner join order_detail on order_detail.id_order = orders.id_order
where  product_price * product_quantity = total_paid and orders.id_order = 557
ORDER BY id_order DESC LIMIT 5


/*Вывести последние 10 записей с id_order lastname, firstname, phone, product_name, unit_price_tax_incl, product_quantity, total_paid
 * из таблиц customer, address, orders, order_detail */

select orders.id_order, customer.firstname, customer.lastname, address.phone, 
order_detail.product_name, order_detail.unit_price_tax_incl, 
order_detail.product_quantity, orders.total_paid    
from customer
inner join address on customer.id_customer = address.id_customer
inner join orders on  customer.id_customer = orders.id_customer
inner join order_detail on orders.id_order = order_detail.id_order
GROUP BY orders.id_order 
ORDER BY orders.id_order DESC LIMIT 10




select orders.id_order, total_paid, order_invoice.date_add from orders
inner join order_detail on orders.id_order = order_detail.id_order
inner join order_invoice on orders.id_order = order_invoice.id_order 
where total_paid BETWEEN 900 and 2000 
order by total_paid desc




select * from stock_available
where id_product = 1152 and id_product_attribute = 0;




SELECT * FROM order_detail
ORDER BY id_order DESC LIMIT 5

SELECT * FROM order_detail


UPDATE orders 
SET valid = 0, current_state = 6
where id_order = 553;

select * from shop_url



