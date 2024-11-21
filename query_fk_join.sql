

-- creo rappresentanti
create table test.rappresentanti(
id_rappresentanti int primary key auto_increment,
nome varchar(30),
cognome varchar(30)
);

INSERT INTO test.rappresentanti (nome, cognome) VALUES
('Paolo', 'Rossi'),
('Anna', 'Bianchi'),
('Francesco', 'Verdi'),
('Giulia', 'Gialli'),
('Roberto', 'Neri'),
('Sofia', 'Blu'),
('Marco', 'Arancio'),
('Loredana', 'Marrone'),
('Matteo', 'Grigi'),
('Lucia', 'Viola');


-- creo clienti
create table test.clienti(
id_cliente int primary key,
id_rappresentante int,
nome varchar(30),
cognome varchar(30),
constraint fk_rappresentante 
foreign key(id_rappresentante) references test.rappresentanti(id_rappresentanti)
);

-- popolo clienti
INSERT INTO test.clienti (id_cliente, nome, cognome, id_rappresentante) VALUES
(1, 'Luca', 'Bianchi',1),
(2, 'Maria', 'Rossi',2),
(3, 'Giovanni', 'Verdi',3),
(4, 'Sara', 'Gialli',4),
(5, 'Andrea', 'Neri',5),
(6, 'Francesca', 'Blu',6),
(7, 'Marco', 'Arancio',7),
(8, 'Elena', 'Marrone',8),
(9, 'Matteo', 'Grigi',9),
(10, 'Laura', 'Viola',10);

select * from test.clienti c;


-- creazione fatture
create table test.fatture(
id_fattura int primary key auto_increment,
costo int,
data_fattura datetime,
id_cliente int,
constraint fk_cliente 
foreign key(id_cliente) references test.clienti(id_cliente)
);

-- riempio tabella
INSERT INTO test.fatture (costo, data_fattura,id_cliente) VALUES
(150, '2024-01-10 14:30:00',1),
(200, '2024-01-12 09:15:00',2),
(350, '2024-01-15 11:45:00',3),
(120, '2024-01-17 16:00:00',4),
(220, '2024-01-20 10:30:00',5),
(450, '2024-01-22 13:00:00',5),
(300, '2024-01-25 15:45:00',7),
(180, '2024-01-28 17:00:00',6),
(500, '2024-02-01 12:30:00',8),
(650, '2024-02-05 14:15:00',9),
(175, '2024-02-07 16:00:00',9),
(400, '2024-02-10 11:30:00',10),
(600, '2024-02-12 08:45:00',10),
(280, '2024-02-15 18:00:00',2),
(550, '2024-02-18 09:00:00',6);

select * from test.fatture f ;

-- faccio la seconda join, e come argomanto ci metto la prima join; nel primo join,quello in parentesi,
-- il campo che poi uso per il secondo deve avere un alias, così poi posso usare
-- abbreviativodelle parentesi.alias nella seconda join

select *, count(*) as cont from (select * from (select c.id_rappresentante as id_rap, c.nome, c.cognome from test.rappresentanti r 
				inner join test.clienti c
				on id_rappresentanti = c.id_rappresentante) j
inner join test.fatture f 
on j.id_rap = f.id_cliente) x group by x.id_rap;


