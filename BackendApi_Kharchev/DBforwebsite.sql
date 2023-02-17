use master
drop database if exists BlenderProjectWebsite

create database [BlenderProjectWebsite]

use BlenderProjectWebsite

create table CustomUser
(
id int primary key identity(1,1),
first_name varchar(17) not null,
user_email varchar(127) unique not null,
user_role varchar(17) not null,
user_passord varchar(17) not null
)

create table Category
(
category_id int primary key identity(1,1),
category_name varchar(50) not null,
category_rating varchar(50) not null,
category_type varchar(50) not null
)

create table Model 
(
model_id int primary key identity(1,1),
category_id int not null,
model_name varchar(50) not null,
model_description varchar(127),
model_price int not null,
model_stock int not null, 
model_rating int not null, 
foreign key (category_id) references Category(category_id)
)

create table Review 
(
model_id int,
customer_id int,
review_text varchar(527) null,
review_rating int not null,
foreign key (model_id) references Model(model_id),
foreign key (customer_id) references CustomUser(id),
primary key (model_id, customer_id)
)
create table Cart 
(
cart_id int primary key identity(1,1),
customer_id int not null,
foreign key (customer_id) references CustomUser(id)
)

create table CartItem
(
model_id int not null,
cart_id int not null,
qty int not null,
price int, 
foreign key (model_id) references Model(model_id),
foreign key (cart_id) references Cart(cart_id),
primary key (model_id, cart_id)
)
