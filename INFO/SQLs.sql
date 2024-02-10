
-- БАЗА ДАНИХ
-- Можливість створення БД з метою уникнення некваліфікованих
-- дій, краще залишити за розробником.
-- Тому такий функціонал у додатку не прописуємо.
-- Тут, БД створюємо через візуальний інструмент, наприклад,
-- MySQL Workbench.
CREATE DATABASE demo_db;


-- ТАБЛИЦІ
-- Можливість створення таблиць БД, з метою уникнення некваліфікованих
-- дій, краще залишити за розробником.
-- Тому такий функціонал у додатку не прописуємо.
-- Попередньо, необхідно спроектувати таблиці та їх зв'язки,
-- на основі сутностей реального світу.
-- Тут, таблиці БД створюємо через візуальний інструмент, наприклад,
-- MySQL Workbench.


CREATE TABLE IF NOT EXISTS users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(128) NOT NULL,
  lastName VARCHAR(128) NOT NULL,
  email VARCHAR(128) NOT NULL,
  PRIMARY KEY (id)
);


INSERT INTO users (firstName, lastName, email) VALUES (?, ?, ?);


SELECT * FROM users;

SELECT firstName, lastName, email FROM users;

SELECT firstName, lastName, email FROM users ORDER BY lastName ASC;


UPDATE users SET lastName = ? WHERE id = ?;

UPDATE users SET email = ? WHERE id = ?;


DELETE FROM users WHERE id = ?;
