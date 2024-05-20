create database ecommerce;

use ecommerce;

create table supplier(
supp_id int primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null
);

create table customer(
cus_id int primary key,
cus_name varchar(50) not null,
cus_city varchar(50) not null,
cus_phone varchar(50) not null,
cus_gender char
);

create table category(
cat_id int primary key,
cat_name varchar(20) not null
);

create table product(
pro_id int primary key,
pro_name varchar(20) not null default "Dummy",
pro_desc varchar(60) not null,
cat_id int,
constraint fk_cat_id foreign key (cat_id) references category(cat_id)
);

create table supplier_pricing(
pricing_id int primary key,
pro_id int,
supp_id int,
supp_price int default 0,
constraint fk_pro_id foreign key (pro_id) references product(pro_id),
constraint fk_supp_id foreign key (supp_id) references supplier(supp_id)
);

create table orders(
ord_id int primary key,
ord_amount int not null,
ord_date date not null,
cus_id int,
pricing_id int,
constraint fk_cus_id foreign key (cus_id) references customer(cus_id),
constraint fk_pricing_id foreign key (pricing_id) references supplier_pricing(pricing_id)
);

create table rating(
rat_id int primary key,
ord_id int,
rat_ratstars int not null,
constraint fk_ord_id foreign key (ord_id) references orders(ord_id)
);

