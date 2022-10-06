BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, pizza_ingredients, pizzas, ingredients, orders;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE boards (
    id serial PRIMARY KEY,
    title varchar NOT NULL,
    background_color varchar(8) NOT NULL
);

CREATE TABLE ingredients(
    id SERIAL,
    ingredient_name varchar(50) NOT NULL UNIQUE,
    tier varchar(50) NOT NULL,
    available boolean NOT NULL,
    ingredient_price decimal(13, 2) NOT NULL,
    CONSTRAINT PK_ingredients PRIMARY KEY (id)
);

CREATE TABLE orders(
    id SERIAL UNIQUE,
    order_status varchar(50) NOT NULL,
    is_delivery boolean NOT NULL,
    employee_name varchar(50),
    order_time TIMESTAMP,
    cust_address varchar(50),
    cust_email varchar(50) NOT NULL
);

CREATE TABLE pizzas(
    id SERIAL,
    pizza_size varchar(50) NOT NULL,
    dough varchar(50) NOT NULL,
    shape varchar(50) NOT NULL,
    sauce_type varchar(50) NOT NULL,
    description varchar(500) NOT NULL,
    is_available boolean NOT NULL,
    pizza_price decimal(13, 2) NOT NULL,
    is_specialty boolean NOT NULL,
    status varchar NOT NULL,
    order_id int,
    board_id int,
    CONSTRAINT PK_pizzas PRIMARY KEY (id),
    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
		REFERENCES orders(id),
	CONSTRAINT fk_board
        FOREIGN KEY (board_id)
    	REFERENCES boards(id)
);

CREATE TABLE pizza_ingredients (
    pizza_id int,
    ingredient_id int,
    CONSTRAINT fk_pizza
        FOREIGN KEY (pizza_id)
		 REFERENCES pizzas(id),
    CONSTRAINT fk_ingredient
        FOREIGN KEY (ingredient_id)
		 REFERENCES ingredients(id)
);


COMMIT TRANSACTION;