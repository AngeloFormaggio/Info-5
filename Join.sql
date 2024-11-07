create database libreria;


create table libreria.libri(
titolo varchar(20),
argomento varchar(20),
pagine int,
cognome_autore varchar(20)
);

create table libreria.autori(
cognome varchar(20),
nome varchar(20),
data_nascita datetime,
nazionalita varchar(20)
);

insert into libreria.libri 
(titolo, argomento, pagine, cognome_autore) values
("Il nome della rosa", "Mistero storico", 512, "Eco"),
("1984", "Distopia politica", 328, "Orwell"),
("Il grande Gatsby", "Romanzo psicologico", 180, "Fitzgerald"),
("La divina commedia", "Poesia epica", 1000, "Dante"),
("Il piccolo principe", "Fiaba filosofica", 96, "Saint-Exupéry");

insert into libreria.libri 
(titolo, argomento, pagine, cognome_autore) values
("Il confucio", "Confucico", 100, "ElCofucier");

insert into libreria.autori 
(cognome, nome, data_nascita, nazionalita) values
("Eco", "Umberto", "1932-01-05", "Italiana"),
("Orwell", "George", "1903-06-25", "Britannica"),
("Fitzgerald", "F. Scott", "1896-09-24", "Americana"),
("Dante", "Alighieri", "1265-06-01", "Italiana"),
("Saint-Exupéry", "Antoine de", "1900-06-29", "Francese"),
("Hemingway", "Ernest", "1899-07-21", "Americana"),
("Austen", "Jane", "1775-12-16", "Britannica");

-- inner join
select * from libreria.libri l inner join libreria.autori a on cognome = l.cognome_autore ;

-- left join
select * from libreria.libri l left join libreria.autori a on cognome = l.cognome_autore ;

-- right join
select * from libreria.libri l right join libreria.autori a on cognome = l.cognome_autore ;


-- full join = un right e un left uniti
(select * from libreria.libri l left join libreria.autori a on cognome = l.cognome_autore) union 
(select * from libreria.libri l right join libreria.autori a on cognome = l.cognome_autore) ;


