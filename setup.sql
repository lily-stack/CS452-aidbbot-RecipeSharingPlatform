-- Users
CREATE TABLE User (
    user_id INTEGER PRIMARY KEY,
    user_name TEXT NOT NULL,
    user_password TEXT NOT NULL,
    date_joined DATETIME NOT NULL,
    email TEXT NOT NULL
);

-- Followers (composite key)
CREATE TABLE Follower (
    user_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, followee_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (followee_id) REFERENCES User(user_id)
);

-- Recipes
CREATE TABLE Recipe (
    recipe_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    dish_description TEXT NOT NULL,
    creation_date DATETIME NOT NULL,
    cooking_time INTEGER NOT NULL,
    servings INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Favorites
CREATE TABLE Favorite (
    favorite_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    recipe_id INTEGER NOT NULL,
    date_hearted DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-- Ingredients
CREATE TABLE Ingredient (
    ingredient_id INTEGER PRIMARY KEY,
    ingredient_name TEXT NOT NULL
);

-- Recipe Ingredients (many-to-many)
CREATE TABLE RecipeIngredient (
    recipe_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

-- Tags
CREATE TABLE Tag (
    tag_id INTEGER PRIMARY KEY,
    tag TEXT NOT NULL
);

-- Recipe Tags (many-to-many)
CREATE TABLE RecipeTag (
    recipe_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, tag_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);

-- Recipe Steps
CREATE TABLE RecipeStep (
    step_id INTEGER PRIMARY KEY,
    recipe_id INTEGER NOT NULL,
    step_number INTEGER NOT NULL,
    step_description TEXT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-- Ratings
CREATE TABLE Rating (
    rating_id INTEGER PRIMARY KEY,
    recipe_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    score INTEGER NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);