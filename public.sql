-- EXERCISE 1

-- Obtenez une liste de toutes les langues du film.
SELECT name FROM language;

-- Obtenez tous les films, même s'ils n'ont pas de langues.
SELECT film.title, film.description, language.name FROM film LEFT JOIN language ON film.language_id = language.language_id;

-- Obtenez tous les films, même s'ils n'ont pas de langues.
SELECT film.title, film.description, language.name FROM film RIGHT JOIN language ON film.language_id = language.language_id;

-- Créez une nouvelle table nommée new_film avec les colonnes suivantes : id, name
CREATE TABLE new_film ( id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL);

-- Ajoutez quelques nouveaux films à la table.
INSERT INTO new_film (name) VALUES ('Robin des Bois'),('Pretty Woman'),('Jurrassic Park'),('PULP FICTION'),('LÉON'),('JUMANJI'),('TITANIC');

-- Créez une nouvelle table appelée customer_review , qui contiendra les critiques de films que les clients feront.
CREATE TABLE customer_review ( review_id SERIAL, film_id INT, language_id INT NOT NULL, title VARCHAR(255) NOT NULL, score INT NOT NULL, review_text TEXT NOT NULL, last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(film_id), CONSTRAINT fk_film FOREIGN KEY(film_id) REFERENCES new_film(id) ON DELETE CASCADE, UNIQUE (language_id), CONSTRAINT fk_language FOREIGN KEY (language_id) REFERENCES language(language_id));
 
-- Ajoutez 2 critiques de films. Assurez-vous de les lier à des objets valides dans les autres tables.
INSERT INTO customer_review (film_id, language_id, title, score, review_text)VALUES (1, 1, 'BON FILM', 9, 'jaime ce film');

-- Supprimer un film qui a une critique de la table new_film , qu'advient-il de la table customer_review ?
INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES (2, 2, 'top', 8, 'film trop wahou'), (2, 2, 'top', 8, 'film trop wahou');

-- Supprimer un film qui a une critique de la table new_film
DELETE FROM