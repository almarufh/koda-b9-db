-- CREATE DATABASE movies
-- OWNER cuanbot;

-- DROP DATABASE movies;

CREATE TABLE "movies" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "title" VARCHAR(255) NOT NULL,
  "release_date" TIMESTAMP,
  "rating" DECIMAL(4,2),
  "director_id" INT,
  "genre_id" INT
);

CREATE TABLE "actors" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "first_name" VARCHAR(255),
  "last_name" VARCHAR(255)
);

CREATE TABLE "movies_actors" (
  "movie_id" INT,
  "actor_id" INT,
  "role" VARCHAR(255)
);

CREATE TABLE "directors" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "first_name" VARCHAR(255),
  "last_name" VARCHAR(255)
);

CREATE TABLE "genres" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(255)
);


ALTER TABLE "movies_actors" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "movies_actors" ADD FOREIGN KEY ("actor_id") REFERENCES "actors" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "movies" ADD FOREIGN KEY ("director_id") REFERENCES "directors" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "movies" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id") DEFERRABLE INITIALLY IMMEDIATE;


insert into directors (first_name, last_name) values ('Morgan', 'Reeders');
insert into directors (first_name, last_name) values ('Eyde', 'Penelli');
insert into directors (first_name, last_name) values ('Rey', 'Farmery');
insert into directors (first_name, last_name) values ('Calla', 'Claiton');
insert into directors (first_name, last_name) values ('Lisa', 'Kairns');
insert into directors (first_name, last_name) values ('Reinhold', 'Shilladay');
insert into directors (first_name, last_name) values ('Rubina', 'Finessy');
insert into directors (first_name, last_name) values ('Robbie', 'Strewthers');
insert into directors (first_name, last_name) values ('Caryl', 'Challiner');
insert into directors (first_name, last_name) values ('Adelind', 'Batt');

insert into actors (first_name, last_name) values ('Babara', 'Hansley');
insert into actors (first_name, last_name) values ('Kinnie', 'Deighan');
insert into actors (first_name, last_name) values ('Ruy', 'Ranklin');
insert into actors (first_name, last_name) values ('Hatti', 'Cucinotta');
insert into actors (first_name, last_name) values ('Cherianne', 'Heigho');
insert into actors (first_name, last_name) values ('Trisha', 'Edlestone');
insert into actors (first_name, last_name) values ('Thorpe', 'Ong');
insert into actors (first_name, last_name) values ('Deborah', 'Sandlin');
insert into actors (first_name, last_name) values ('Gusty', 'Meach');
insert into actors (first_name, last_name) values ('Elwood', 'Hedman');

insert into genres (name) values ('Action|Adventure|Thriller');
insert into genres (name) values ('Crime|Romance|Thriller');
insert into genres (name) values ('Action|Adventure|Romance');
insert into genres (name) values ('Drama|Thriller');
insert into genres (name) values ('Documentary');
insert into genres (name) values ('Action|Drama');
insert into genres (name) values ('Drama|Thriller');
insert into genres (name) values ('Action|Adventure|Comedy|Drama');
insert into genres (name) values ('Documentary|War');
insert into genres (name) values ('Comedy');

insert into movies (title, release_date, rating, director_id, genre_id) values ('Burn Paris Burn', '2022-12-10 18:28:22', 1.91, 1, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Child Bride', '2025-10-23 07:07:55', 1.05, 9, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('My Darling Clementine', '2024-04-28 13:55:32', 2.03, 9, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Sometimes in April', '2024-10-24 01:14:11', 4.12, 5, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Austin High', '2025-12-27 08:44:28', 1.96, 10, 10);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Believe Me', '2024-08-20 21:57:08', 1.64, 3, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('When I Walk', '2021-07-03 18:32:58', 3.91, 3, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Report, The (Gozaresh)', '2020-09-29 15:18:06', 2.61, 2, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Naked City, The', '2023-01-25 08:17:10', 4.83, 9, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Texas', '2023-05-16 07:48:34', 3.6, 7, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Kansas City Confidential', '2026-09-03 20:56:16', 2.54, 5, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Gamera the Brave', '2022-12-14 14:21:56', 7.0, 10, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Colors', '2024-02-07 00:38:38', 2.5, 5, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('In a Town This Size', '2024-04-05 23:57:40', 6.67, 9, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('War of the Dead - Stone''s War ', '2021-03-21 04:54:05', 2.99, 5, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Bride with White Hair, The (Bai fa mo nu zhuan)', '2024-06-25 20:40:59', 5.95, 2, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Drugstore Cowboy', '2021-12-13 15:40:24', 6.96, 8, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('False Trail (Jägarna 2)', '2021-07-16 01:34:50', 7.56, 3, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Slipper and the Rose, The', '2024-03-17 17:36:43', 4.63, 3, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Heavy Petting', '2023-04-18 19:59:47', 2.13, 1, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Thank Your Lucky Stars', '2021-07-12 09:09:21', 5.42, 4, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Illegal', '2025-12-18 00:44:53', 4.67, 10, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('One Mile Away', '2025-03-28 22:58:04', 7.27, 4, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('First Name: Carmen (Prénom Carmen)', '2020-12-25 06:25:34', 1.86, 7, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Open Range', '2022-06-08 05:15:43', 6.42, 3, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Christmas in Connecticut', '2025-01-28 10:50:50', 5.23, 4, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Barfi!', '2025-11-15 01:31:26', 2.58, 10, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Go Now', '2026-08-17 21:34:39', 2.49, 2, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('California Dreamin'' (Nesfarsit)', '2026-04-25 14:24:14', 5.38, 5, 9);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Zatoichi and the Chest of Gold (Zatôichi senryô-kubi) (Zatôichi 6)', '2021-10-21 05:33:49', 1.8, 6, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Butcher''s Wife, The', '2020-10-17 03:32:30', 4.62, 5, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Machine Gun Preacher', '2024-05-05 22:17:16', 5.68, 4, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Man, Woman and the Wall (Kikareta onna no mirareta yoru)', '2020-11-26 04:41:49', 2.11, 8, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('It''s Impossible to Learn to Plow by Reading Books', '2023-09-18 08:46:32', 1.45, 3, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Science of Sleep, The (La science des rêves)', '2021-07-26 22:50:52', 4.42, 7, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Subway', '2026-07-19 04:55:32', 7.28, 10, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Confessions of a Nazi Spy', '2025-04-09 10:24:57', 5.16, 6, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Woman in Black, The', '2024-03-30 14:06:38', 6.71, 8, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Hush... Hush, Sweet Charlotte', '2026-04-26 11:46:46', 4.35, 8, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Disorderly Orderly, The', '2024-12-02 19:50:03', 4.73, 5, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Book of Eli, The', '2024-06-08 02:13:10', 1.71, 8, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Wild Zero', '2022-08-30 06:16:39', 3.69, 9, 9);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Koko, a Talking Gorilla', '2022-11-19 12:56:28', 4.96, 4, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Tevye', '2021-12-31 14:00:11', 6.41, 8, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('The Diary of Preston Plummer', '2025-07-11 15:43:39', 2.98, 6, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Treasure Hunter, The (Ci ling)', '2021-08-06 03:28:37', 2.96, 10, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Honeymoon', '2023-12-07 22:38:35', 2.89, 4, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Ulysses', '2021-02-05 14:47:54', 4.42, 2, 8);
insert into movies (title, release_date, rating, director_id, genre_id) values ('World War II: When Lions Roared', '2021-05-21 12:10:43', 7.94, 10, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('So Much So Fast', '2021-07-08 02:16:03', 5.69, 7, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Romance on the High Seas', '2023-04-09 08:55:06', 5.85, 9, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('The Strange Affair', '2022-08-28 08:08:44', 6.81, 3, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Chains (Catene)', '2025-02-22 23:45:38', 3.72, 6, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Mad Max', '2026-04-20 09:38:04', 7.46, 9, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('It''s My Party', '2021-12-19 15:42:28', 1.89, 6, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Scott of the Antarctic', '2024-08-08 14:51:34', 7.02, 1, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('All About the Benjamins', '2022-04-17 17:42:29', 4.15, 9, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Forever', '2022-02-22 01:32:46', 1.75, 4, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Specialist, The', '2021-12-12 06:49:31', 3.02, 3, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Killing Bono', '2026-02-01 22:43:55', 7.23, 4, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('War Game, The', '2025-01-01 18:07:08', 4.8, 1, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Metalstorm: The Destruction of Jared-Syn', '2025-06-08 07:48:33', 5.81, 8, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Carbine Williams', '2022-01-03 07:46:29', 5.48, 1, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Entr''acte', '2026-03-12 19:47:37', 7.43, 4, 8);
insert into movies (title, release_date, rating, director_id, genre_id) values ('24th Day, The', '2021-07-02 07:53:19', 2.39, 5, 8);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Passion of Ayn Rand, The', '2021-08-27 08:03:05', 1.71, 6, 9);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Surrogates', '2025-08-16 00:30:33', 6.38, 2, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Next of Kin', '2026-06-26 14:32:56', 1.44, 5, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('South, The (Lomalla)', '2026-07-02 05:37:12', 2.25, 5, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Arrival of a Train, The', '2024-11-06 23:20:05', 3.45, 7, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Girl Shy', '2022-01-30 15:33:47', 7.16, 4, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Love Finds Andy Hardy', '2022-12-11 09:42:41', 3.93, 10, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Blade: Trinity', '2021-05-01 02:01:14', 1.47, 10, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Fifth Element, The', '2023-11-13 23:29:57', 6.55, 5, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Last Dance', '2024-04-16 08:29:40', 1.08, 3, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Dreams That Money Can Buy', '2021-06-16 15:26:36', 7.98, 7, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Judas Kiss', '2021-06-23 21:30:50', 6.9, 6, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('She Creature (Mermaid Chronicles Part 1: She Creature)', '2025-08-31 07:44:57', 2.27, 3, 9);
insert into movies (title, release_date, rating, director_id, genre_id) values ('How to Die in Oregon', '2021-08-04 14:21:28', 7.03, 2, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Mann tut was Mann kann', '2023-11-29 07:03:48', 5.1, 4, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Unholy Three, The', '2024-02-10 22:46:39', 2.46, 8, 7);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Ten Minutes Older', '2024-07-03 15:56:14', 1.95, 1, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Clear History', '2022-03-17 04:10:39', 4.77, 8, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('House Party 3', '2022-04-13 11:46:18', 7.42, 9, 8);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Genocide (Konchû daisensô)', '2026-05-10 01:02:59', 6.44, 4, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Vanilla Sky', '2025-12-31 02:12:09', 2.01, 2, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Honeymoon Killers, The', '2022-09-13 23:47:51', 1.59, 3, 1);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Two for the Money', '2022-11-18 13:36:26', 5.09, 8, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Runaways, The', '2022-12-24 13:44:28', 1.12, 2, 10);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Sky Captain and the World of Tomorrow', '2024-11-02 10:28:36', 3.45, 1, 9);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Shorts', '2026-06-02 08:52:03', 7.01, 2, 2);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Valhalla', '2024-01-14 11:02:29', 2.77, 1, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Zack and Miri Make a Porno', '2022-09-30 20:50:28', 7.99, 7, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('The Story of Asya Klyachina', '2021-04-29 21:52:32', 3.63, 7, 5);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Chinese Coffee', '2020-12-18 06:10:36', 7.48, 4, 4);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Serpent''s Egg, The (Schlangenei, Das)', '2023-07-06 04:59:27', 1.69, 8, 3);
insert into movies (title, release_date, rating, director_id, genre_id) values ('What the #$*! Do We Know!? (a.k.a. What the Bleep Do We Know!?)', '2020-11-15 09:03:43', 7.58, 9, 8);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Family, The (Famiglia, La)', '2023-02-23 05:00:06', 3.25, 10, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Night of the Lepus', '2022-01-16 08:08:44', 7.07, 1, 6);
insert into movies (title, release_date, rating, director_id, genre_id) values ('Our Town', '2021-07-07 08:50:30', 1.26, 5, 10);