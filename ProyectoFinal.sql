select * from customer;


--Ingresos totales por género
Select gender as genero, sum(purchase_amount) as Ingresos from customer
group by gender;

--Que clientes usaron descuentos pero aún asi gastaron más que el comprador promedio
Select customer_id, age,gender, category, purchase_amount from customer
where discount_applied = 'Yes' and purchase_amount>(select avg(purchase_amount) from customer);

--Top 5 productos con el puntaje de review más alto

Select item_purchased as item_comprado, round(avg(review_rating::numeric),2) as promedio_review from customer
group by item_purchased
order by promedio_review desc
limit 5;

--Comparar la compra promedio entre Standard vs Express
Select shipping_type as "Tipo de Compra",
		round(avg(purchase_amount::numeric),2) as "Monto Promedio de Compra" from customer
where shipping_type ='Express' or shipping_type='Standard'
group by shipping_type
order by avg(purchase_amount::numeric) desc;

--Los Clientes suscriptos gastan más? 
--Comparar promedio y total de ingresos entre suscriptores y no suscriptores
Select count(customer_id) as "Total Clientes",
		subscription_status as "Clientes Suscriptos", 
		sum(purchase_amount) as "Ingreso total",
		round(avg(purchase_amount::numeric),2) as "Promedio de Compra"
from customer
Group by subscription_status;

-- Cuales son los 5 productos que tienen el mayor porcentaje  de compras
-- pero con descuentos aplicados?

Select item_purchased, 
		round((sum(case when discount_applied = 'Yes' then 1.0 Else 0.0 end)/count(*))*100,2) as proporcion_descuento
from customer
group by item_purchased
order by proporcion_descuento desc
limit 5;