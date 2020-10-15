
-- Table Creation
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR (60) NOT NULL,
  password VARCHAR (60) NOT NULL,
  full_name VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL,
  phone INT NOT NULL,
  delivery_address VARCHAR (60) NOT NULL,
  is_admin BOOLEAN NOT NULL DEFAULT FALSE,
  is_disabled BOOLEAN DEFAULT FALSE
);

CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR (60) NOT NULL,
  price FLOAT NOT NULL,
  img_url VARCHAR(200) NOT NULL,
  description VARCHAR(150) NOT NULL,
  is_disabled BOOLEAN DEFAULT FALSE
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  status VARCHAR(60) NOT NULL,
  date DATETIME NOT NULL,
  description VARCHAR(150) NOT NULL,
  payment_method VARCHAR (60) NOT NULL,
  total FLOAT NOT NULL,
  user_id INT NOT NULL DEFAULT "0",
  is_disabled BOOLEAN DEFAULT FALSE,
  FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE orders_products (
  order_prod_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  product_amount INT NOT NULL,
  FOREIGN KEY(order_id) REFERENCES orders(order_id),
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- Populate users table
INSERT INTO
  users
VALUES
  (
    NULL,
    "fedeborsalino",
    "fede123",
    "federico borsalino",
    "fborsalino@gmail.com",
    3513262626,
    "colon 4200",
    TRUE,
    FALSE
  );

INSERT INTO
  users
VALUES
  (
    NULL,
    "rgenaizir",
    "riki123",
    "ricardo genaizir",
    "riki@gmail.com",
    3513292929,
    "duarte quiros 1500",
    FALSE,
    FALSE
  );

INSERT INTO
  users
VALUES
  (
    NULL,
    "armandoParedes",
    "armando123",
    "Armando Paredes",
    "armandop@gmail.com",
    3513279878,
    "velez sarfield 1599",
    FALSE,
    FALSE
  );

-- Populate products table
INSERT INTO
  products
VALUES
  (
    NULL,
    "Doble con Cheddar y cebolla acompañado con papas",
    360,
    "https://via.placeholder.com/732",
    "Dos medallones de carne con cheddar y bacon entre 2 panes con cebolla y pan de campo",
    FALSE
  );

INSERT INTO
  products
VALUES
  (
    NULL,
    "bisteca caprese",
    300,
    "https://via.placeholder.com/237",
    "medallon de carne de 350g acompañado con pure mixto perfumado con oregano",
    FALSE
  );

INSERT INTO
  products
VALUES
  (
    NULL,
    "Berenjenas al forno",
    265,
    "https://via.placeholder.com/200",
    "lasagña de berenjena con queso jamon tomate con una lluvia de oregano con salsa a eleccion",
    FALSE
  );

INSERT INTO
  products
VALUES
  (
    NULL,
    "Pepsi Max 500ml",
    60,
    "https://via.placeholder.com/666",
    "pepsi de medio litro ligth",
    FALSE
  );

INSERT INTO
  products
VALUES
  (
    NULL,
    "ñoquis a la marsala",
    400,
    "https://via.placeholder.com/444",
    "ñoquis de papa acompañado con una salsa de vino a la marsalla con matambre picado a cuchillo",
    FALSE
  );

INSERT INTO
  products
VALUES
  (
    NULL,
    "fideos de espinaca",
    450,
    "https://via.placeholder.com/999",
    "fideos caseros de espinaca acompañado con salsa bolognesa",
    FALSE
  );

INSERT INTO
  products
VALUES
  (
    NULL,
    "milanesa napolitana",
    450,
    "https://via.placeholder.com/888",
    "milanesa con jamon queso huevo tomate acompañado con papas españolas",
    FALSE
  );

-- Populate orders table
INSERT INTO
  orders
VALUES
  (
    NULL,
    "delivered",
    NOW(),
    "1x bisteca caprese, vino rutini",
    "efectivo",
    1500,
    1,
    FALSE
  ),
  (
    NULL,
    "canceled",
    NOW(),
    "2x pepsi500ml",
    "efectivo",
    300,
    3,
    FALSE
  ),
  (
    NULL,
    "sending",
    NOW(),
    "1x pepsi500ml",
    "cash",
    150,
    1,
    FALSE
  ),
  (
    NULL,
    "preparing",
    NOW(),
    "1x Berenjenas al forno",
    "cash",
    950,
    3,
    FALSE
  ),
  (
    NULL,
    "confirmed",
    NOW(),
    "1x ñoquis de espinaca",
    "card",
    450,
    2,
    FALSE
  ),
  (
    NULL,
    "new",
    NOW(),
    "1x fideos de calabaza",
    "cash",
    450,
    1,
    FALSE
  );

-- Populate orders_products table
INSERT INTO
  orders_products
VALUES
  (NULL, 1, 1, 1),
  (NULL, 1, 4, 2),
  (NULL, 2, 4, 2),
  (NULL, 3, 4, 2),
  (NULL, 4, 5, 1),
  (NULL, 5, 6, 1),
  (NULL, 6, 7, 1);

