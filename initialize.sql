DROP TABLE IF EXISTS users, entree, side, recipe, ingredient;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  cooking_style VARCHAR(50),
  country VARCHAR(50),
  email VARCHAR(50),
  birthday VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE entree (
  entree_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  name_of_entree VARCHAR(100),
  style VARCHAR(50),
  cuisine VARCHAR(50),
  recipe_id INT NOT NULL,
  PRIMARY KEY (entree_id),
  FOREIGN KEY (user_id, recipe_id)
  REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE side (
  side_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  name_of_side VARCHAR(100),
  style VARCHAR(50),
  cuisine VARCHAR(50),
  recipe_id INT NOT NULL,
  PRIMARY KEY (side_id),
  FOREIGN KEY (user_id, recipe_id)
  REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE recipe (
  recipe_id INT NOT NULL AUTO_INCREMENT,
  entree_id VARCHAR(100),
  side_id VARCHAR(100),
  recipe_name VARCHAR(50),
  PRIMARY KEY (recipe_id),
  FOREIGN KEY (entree_id, side_id)
  REFERENCES entree (entree_id), side (side_id)
    ON DELETE CASCADE
);

CREATE TABLE ingredients (
  ingredient_id INT NOT NULL AUTO_INCREMENT,
  recipe_id INT NOT NULL,
  food_type VARCHAR(100),
  quantity VARCHAR(50),
  unit_of_measure VARCHAR(50),
  PRIMARY KEY (ingredient_id),
  FOREIGN KEY (recipe_id)
  REFERENCES recipe (recipe_id)
    ON DELETE CASCADE
);

-- INSERT INTO users
-- 	(first_name, last_name)
-- VALUES 
--   ("James","Butt");

-- INSERT INTO usersContact
-- 	(user_id, phone1, phone2, email)
-- VALUES 
--   (92,"626-572-1096","626-696-2777","cory.gibes@gmail.com");

-- INSERT INTO usersAddress
-- 	(user_id, address, city, county, state, zip)
-- VALUES 
--   (92,"6649 N Blue Gum St","New Orleans","Orleans","LA",70116);