/* 4 */

select count(cus_name) total, cus_gender from customer 
where cus_id in (select cus_id from orders where ord_amount >= 3000)
group by cus_gender;

/* 5 */
select o.*, p.pro_name 
from orders o inner join supplier_pricing s on o.pricing_id = s.pricing_id and o.cus_id = 2
inner join product p on s.pro_id = p.pro_id
inner join customer c on o.cus_id = c.cus_id;

/* 6 */
select subquery.* from(
select s.*,count(sp.pro_id) total_product from supplier s 
inner join supplier_pricing sp on s.supp_id = sp.supp_id
group by sp.supp_id
) subquery where total_product >1;




