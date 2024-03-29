/* data base creation*/
create database movie;
use movie;


/* directors table creation*/
create table directors(director_id varchar(10) primary key, director_name varchar(20));
desc directors;

/* Movie table creation*/
create table movies(movie_id varchar(10) primary key, title varchar(20), release_year int, director_id varchar(10),foreign key(director_id) references directors(director_id) );
desc movies;

/* genres table creation*/
create table genre(genre_id varchar(10) primary key, genre_name varchar(20));
desc genre;

/* movie genres table creation*/
create table movie_genres(movie_id varchar(10),genre_id varchar(10),foreign key(movie_id) references movies(movie_id),foreign key(genre_id) references genre(genre_id));
desc movie_genres;


/*Insrrting values into directors table*/
insert into directors values("D1","Karthik varma Dandu"),("D2","Rajamouli"),("D3","Shankar"),("D4","Anil ravipudi"),("D5","");
select * from directors;

/* Inserting values into movies table*/
insert into movies values("M1", "Virupaska", 2023, "D1"),("M2", "Baahubali-2",2017,"D2"),("M3", "Robo", 2010, "D3"),("M4","F2",2019,"D4"),("M5","Hit",2020,"D5");
select * from movies;

/*Inserting values into genre table*/
insert into genre values("G1","Mystery"),("G2","Adventure"),("G3","Action"),("G4","Comedy");
select * from genre;

/* Inserting values into movie_genre table*/
insert into movie_genres values("M1","G1"),("M2","G2"),("M3","G3"),("M4","G4"),("M3","G1");
select * from movie_genres;



/* TASKS*/
/* 1.Write a query to retrieve the movie title and the corresponding director name for all movies.*/
select m.title,d.director_name 
from movies m,directors d 
where m.director_id=d.director_id;

/* 2.Write a query to retrieve the movie title, release year, and the corresponding director name (if available) for all movies.*/
select m.title,m.release_year,d.director_name 
from movies m 
left join directors d 
on m.director_id=d.director_id 
where d.director_name IS NOT NULL AND d.director_name <> "";

/* 3.Write a query to retrieve the director name and the titles of the movies they have directed (if available) for all directors.*/
select d.director_name,m.title 
from directors d 
left join movies m 
on d.director_id=m.director_id 
where m.title IS NOT NULL AND d.director_name <> "";  

/* 4.Write a query to retrieve the movie title, release year, and the corresponding director name (if available) for all movies and directors.*/
SELECT m.title, m.release_year, d.director_name 
FROM movies m 
JOIN directors d 
ON m.director_id = d.director_id and d.director_name!="";

/* 5.Write a query to retrieve the movie title and genre name for all combinations of movies and genres*/
SELECT m.title, g.genre_name
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genre g ON mg.genre_id = g.genre_id;

