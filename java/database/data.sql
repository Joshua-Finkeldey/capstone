
BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- boards
INSERT INTO boards (id, title, background_color) VALUES (1, 'Pizza Orders', '#20b2aa');
INSERT INTO boards (id, title, background_color) VALUES (2, 'Current Specialties', '#20b2aa');
INSERT INTO boards (id, title, background_color) VALUES (3, 'Fun Board 1', '#20b2aa');
INSERT INTO boards (id, title, background_color) VALUES (4, 'Fun Board 2', '#20b2aa');
INSERT INTO boards (id, title, background_color) VALUES (5, 'Fun Board 3', '#20b2aa');
INSERT INTO boards (id, title, background_color) VALUES (6, 'Fun Board 4', '#20b2aa');


-- Insert large specialty pies
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('large','classic','round','traditional red','THE FETTIG - balsamic drizzle, housemade mozzarella, sundried tomato, walnuts, basil',TRUE,19.99,TRUE, 'Pending',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('large','classic','round','traditional red','THE FINKELDEY - smoked bbq sauce, housemade mozzarella, fontina, roasted chicken, red onion, banana pepper',TRUE,19.99,TRUE, 'Pending',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('large','classic','round','traditional red','THE NOWELL - parmigiano, ricotta fonduta, baby spinach, onion, roasted garlic, chili flake',TRUE,19.99,TRUE, 'Pending',1);
--
--
---- Insert medium specialty pies
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('medium','classic','round','traditional red','THE FETTIG - balsamic drizzle, housemade mozzarella, sundried tomato, walnuts, basil',TRUE,16.99,TRUE, 'Pending',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('medium','classic','round','traditional red','THE FINKELDEY - smoked bbq sauce, housemade mozzarella, fontina, roasted chicken, red onion, banana pepper',TRUE,16.99,TRUE, 'Pending',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('medium','classic','round','traditional red','THE NOWELL - parmigiano, ricotta fonduta, baby spinach, onion, roasted garlic, chili flake',TRUE,16.99,TRUE, 'Ready',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('medium','classic','round','traditional red','THE STILL - white pie, sriracha honey, cheese blend, brussels, bacon, , shaved red onion',TRUE,16.99,TRUE, 'Ready',1);
--
---- Insert small specialty pies
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('small','classic','round','traditional red','THE FETTIG - balsamic drizzle, housemade mozzarella, sundried tomato, walnuts, basil',TRUE,14.99,TRUE, 'Ready',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('small','classic','round','traditional red','THE FINKELDEY - smoked bbq sauce, housemade mozzarella, fontina, roasted chicken, red onion, banana pepper',TRUE,14.99,TRUE, 'Completed', 1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('small','classic','round','traditional red','THE NOWELL - parmigiano, ricotta fonduta, baby spinach, onion, roasted garlic, chili flake',TRUE,14.99,TRUE, 'Completed',1);
--
--INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id)
--VALUES ('small','classic','round','traditional red','THE STILL - white pie, sriracha honey, cheese blend, brussels, bacon, , shaved red onion',TRUE,14.99,TRUE, 'Cancelled',1);


--add standard toppings to the ingredient table
INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Red onion','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Sweet peppers','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Spinach','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Broccoli','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Mushroom','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Ham','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Jalapeño','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Black olive','Standard',TRUE,.25);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Pepperoni','Standard',TRUE,.25);

--add premium toppings to the ingredient table
INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Grilled Chicken','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Spicy Meatball','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Broccoli Rabe','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Fennel sausage','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Marinated tofu','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Fried chickpeas','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Crispy Pancetta','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Sauteed spinach','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Grilled pineapple','Premium',TRUE,.50);

--these are to reconcile ingredients in DB with the first two specialty pizzas

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Balsamic drizzle','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Housemade mozzarella','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Sundried tomato','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Walnuts','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Basil','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Smoked bbq sauce','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Fontina','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Roasted chicken','Premium',TRUE,.50);

INSERT INTO ingredients (ingredient_name,tier,available,ingredient_price)
VALUES ('Banana pepper','Premium',TRUE,.50);

--test ingredient-pizza associations

--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (1, 19);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (1, 20);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (1, 21);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (1, 22);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (1, 23);
--
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (2, 24);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (2, 20);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (2, 25);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (2, 26);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (2, 1);
--INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES (2, 27);

--test order
INSERT INTO orders (order_status, is_delivery, employee_name, order_time, cust_address, cust_email) VALUES ('test7',TRUE,'test employee',current_timestamp,'123 Maple Street','test@gmail.com');
INSERT INTO pizzas (pizza_size,dough,shape,sauce_type,description,is_available,pizza_price,is_specialty, status, board_id, order_id) VALUES ('large','classic','round','traditional red',
	'Test 7 - THE FINKELDEY - smoked bbq sauce, housemade mozzarella, fontina, roasted chicken, red onion, banana pepper',TRUE,19.99,TRUE, 'Pending',1, (SELECT MAX(id)FROM orders));
INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES ((SELECT MAX(id)FROM pizzas), (SELECT (id)FROM ingredients where ingredient_name = 'Red onion' ));
INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES ((SELECT MAX(id)FROM pizzas), (SELECT (id)FROM ingredients where ingredient_name = 'Housemade mozzarella' ));
INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES ((SELECT MAX(id)FROM pizzas), (SELECT (id)FROM ingredients where ingredient_name = 'Fontina' ));
INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES ((SELECT MAX(id)FROM pizzas), (SELECT (id)FROM ingredients where ingredient_name = 'Roasted chicken' ));
INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES ((SELECT MAX(id)FROM pizzas), (SELECT (id)FROM ingredients where ingredient_name = 'Banana pepper' ));
INSERT INTO pizza_ingredients (pizza_id, ingredient_id) VALUES ((SELECT MAX(id)FROM pizzas), (SELECT (id)FROM ingredients where ingredient_name = 'Smoked bbq sauce' ));



COMMIT TRANSACTION;
