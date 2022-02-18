create table INGREDIENT
(
    name varchar(20) not null,
    ingid int not null,
    constraint pking primary key (ingid)
);


create table PIZZA
(
    ingName varchar(20) not null,
    crustName varchar(20) not null,
    name varchar(30) not null,
    pizzaid int not null,
    constraint pkpizza primary key (pizzaid)
);

create table INGREDIENT_PIZZA
(
    pizzaid int not null,
    ingid int not null,
    constraint ingpzfk1 foreign key (pizzaid) references PIZZA (pizzaid),
    constraint ingpzfk2 foreign key (ingid) references INGREDIENT(ingid)
);

create table SIZE
(
    name varchar(20) not null,
    diam float not null,
    sizeid int not null,
    constraint pksize primary key (sizeid)
);

create table COST
(
    pizzaName int not null,
    pizzaSize int not null,
    total float not null,
    constraint fkcost foreign key (pizzaName) references PIZZA (pizzaid),
    constraint fkcost1 foreign key (pizzaSize) references SIZE (sizeid)
);

insert into INGREDIENT (name, ingid)
values ('Pepperoni', 1);

insert into INGREDIENT (name, ingid)
values ('Sausage', 2);

insert into INGREDIENT (name, ingid)
values ('Pineapple', 3);

insert into INGREDIENT (name, ingid)
values ('Anchovies', 4);

insert into INGREDIENT (name, ingid)
values ('Olives', 5);



insert into PIZZA (crustName, name, pizzaid)
values ('Deep Dish', 'Pepperoni', 1);

insert into PIZZA (crustName, name, pizzaid)
values ('New York', 'Sausage and Olives', 2);

insert into PIZZA (crustName, name, pizzaid)
values ('Hand Tossed', 'Meatlovers', 3);

insert into PIZZA (crustName, name, pizzaid)
values ('Deep Dish', 'Olives and Anchovies', 4);

insert into PIZZA (crustName, name, pizzaid)
values ('Chicago', 'pineapple and sausage and olives', 5);

insert into SIZE (name, diam, sizeid) VALUES ('individual', 5,1);

insert into SIZE (name, diam, sizeid) VALUES ('small', 10,2);

insert into SIZE (name, diam, sizeid) VALUES ('medium', 15,3);

insert into SIZE (name, diam, sizeid) VALUES ('large', 20,4);

insert into SIZE (name, diam, sizeid) VALUES ('wow!', 30,5);

insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (1,1);

insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (2,2);
insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (2,5);

insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (3,1);
insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (3,2);

insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (4,4);
insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (4,5);

insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (5,2);
insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (5,3);
insert into INGREDIENT_PIZZA (pizzaid, ingid) VALUES (5,5);

insert into COST (pizzaName, pizzaSize, total) VALUES (1,1,5.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (1,2,7.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (1,3,9.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (1,4,11.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (1,5,13.00);

insert into COST (pizzaName, pizzaSize, total) VALUES (2,1,7.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (2,2,8.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (2,3,9.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (2,4,11.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (2,5,15.00);

insert into COST (pizzaName, pizzaSize, total) VALUES (3,1,7.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (3,2,9.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (3,3,11.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (3,4,13.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (3,5,17.00);

insert into COST (pizzaName, pizzaSize, total) VALUES (4,1,6.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (4,2,8.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (4,3,10.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (4,4,12.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (4,5,14.00);

insert into COST (pizzaName, pizzaSize, total) VALUES (5,1,4.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (5,2,6.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (5,3,8.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (5,4,10.00);
insert into COST (pizzaName, pizzaSize, total) VALUES (5,5,12.00);

select PIZZA.name, SIZE.name, SIZE.diam
from COST
inner join PIZZA on PIZZA.pizzaid = COST.pizzaName
inner join SIZE on SIZE.sizeid = COST.pizzaSize
order by PIZZA.name, SIZE.diam;

select INGREDIENT.name, PIZZA.name, PIZZA.crustName
from INGREDIENT_PIZZA
inner join PIZZA on INGREDIENT_PIZZA.pizzaid = PIZZA.PIZZAID
inner join INGREDIENT on INGREDIENT.ingid = INGREDIENT_PIZZA.ingid
order by PIZZA.NAME
