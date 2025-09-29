DELETE FROM Rating;
DELETE FROM RecipeStep;
DELETE FROM RecipeTag;
DELETE FROM Tag;
DELETE FROM RecipeIngredient;
DELETE FROM Ingredient;
DELETE FROM Favorite;
DELETE FROM Recipe;
DELETE FROM Follower;
DELETE FROM User;

INSERT INTO User (user_name, user_password, date_joined, email) VALUES
('chef_anna', 'pass1234', '2023-01-10 09:30:00', 'anna@example.com'),
('grillmaster77', 'steaklover', '2023-03-15 12:00:00', 'grill@example.com'),
('veganvibes', 'tofuRules', '2023-05-01 08:15:00', 'vegan@example.com');

-- Followers
INSERT OR IGNORE INTO Follower (user_id, followee_id) VALUES
(2, 1),
(3, 1),
(3, 2);

-- Recipes
INSERT INTO Recipe (user_id, title, dish_description, creation_date, cooking_time, servings) VALUES
(1, 'Classic Spaghetti Bolognese', 'A hearty Italian pasta dish with beef sauce.', '2023-06-01 14:00:00', 45, 4),
(2, 'Grilled BBQ Chicken', 'Smoky and sweet barbecue chicken grilled to perfection.', '2023-06-10 17:00:00', 30, 3),
(3, 'Vegan Tofu Stir Fry', 'Colorful veggies and crispy tofu with soy-ginger sauce.', '2023-06-15 11:30:00', 20, 2);

-- Favorites
INSERT INTO Favorite (user_id, recipe_id, date_hearted) VALUES
(2, 1, '2023-06-02 10:00:00'),
(3, 1, '2023-06-03 08:00:00'),
(1, 3, '2023-06-16 09:00:00');

-- Ingredients
INSERT INTO Ingredient (ingredient_name) VALUES
('Spaghetti'),
('Ground Beef'),
('Tomato Sauce'),
('Chicken Breast'),
('BBQ Sauce'),
('Tofu'),
('Bell Pepper'),
('Soy Sauce'),
('Garlic');

-- Recipe Ingredients
INSERT OR IGNORE INTO RecipeIngredient (recipe_id, ingredient_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9);

-- Tags
INSERT INTO Tag (tag) VALUES
('Italian'),
('BBQ'),
('Vegan'),
('Quick'),
('Dinner');

-- Recipe Tags
INSERT INTO RecipeTag (recipe_id, tag_id) VALUES
(1, 1),
(1, 5),
(2, 2),
(2, 5),
(3, 3),
(3, 4),
(3, 5);

-- Recipe Steps
INSERT INTO RecipeStep (recipe_id, step_number, step_description) VALUES
(1, 1, 'Boil pasta until al dente.'),
(1, 2, 'Cook ground beef in pan.'),
(1, 3, 'Add tomato sauce to beef and simmer.'),
(1, 4, 'Combine sauce and pasta.'),
(2, 1, 'Season and grill chicken.'),
(2, 2, 'Brush with BBQ sauce.'),
(3, 1, 'Chop vegetables.'),
(3, 2, 'Pan-fry tofu until crispy.'),
(3, 3, 'Add veggies and stir-fry with sauce.');

-- Ratings
INSERT INTO Rating (recipe_id, user_id, score) VALUES
(1, 2, 5),
(1, 3, 4),
(2, 1, 4),
(3, 1, 5),
(3, 2, 4);