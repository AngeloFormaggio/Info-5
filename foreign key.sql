drop table piante_verifica2024.clienti ;
select * from piante_verifica2024.report r where id_cliente = 100;
-- TABELLA CLIENTI
create table piante_verifica2024.clienti
(
id_cliente int primary key,
nome_cliente varchar(50)
);
insert into piante_verifica2024.clienti (id_cliente, nome_cliente)
select distinct r.id_cliente, r.nome_cliente from piante_verifica2024.report r;

select * from piante_verifica2024.clienti c;


-- TABELLA PIANTE
create table piante_verifica2024.piante
(
id_pianta int primary key,
nome_pianta varchar(50),
pianta_esotica boolean,
prezzo_prodotto decimal
);
insert into piante_verifica2024.piante (id_pianta,nome_pianta,pianta_esotica ,prezzo_prodotto)
select distinct r.id_pianta , r.nome_pianta, r.pianta_esotica,r.prezzo_pianta from piante_verifica2024.report r group by id_pianta;

select * from piante_verifica2024.piante p;


-- TABELLA LUOGHI

create table piante_verifica2024.luoghi
(
id_luogo int primary key,
nome_luogo varchar(50)
);
insert into piante_verifica2024.luoghi(id_luogo,nome_luogo)
select distinct r.id_luogo,r.luogo from piante_verifica2024.report r;

select * from piante_verifica2024.luoghi l ;

-- TABELLA FATTURA
create table piante_verifica2024.fatture
(
id_fattura int primary key,
data_fatura datetime
);
insert into piante_verifica2024.fatture(id_fattura,data_fatura)
select distinct r.id_fattura ,r.data_fattura from piante_verifica2024.report r;

select * from piante_verifica2024.fatture f ;

-- FOREIGN KEY SU REPORT

alter table piante_verifica2024.report 
add constraint fk_report_cliente
foreign key (id_cliente) references piante_verifica2024.clienti(id_cliente);


alter table piante_verifica2024.report 
add constraint fk_report_piante
foreign key (id_pianta) references piante_verifica2024.piante(id_pianta);


alter table piante_verifica2024.report 
add constraint fk_report_fattura
foreign key (id_fattura) references piante_verifica2024.fatture(id_fattura);



alter table piante_verifica2024.report 
add constraint fk_report_luoghi
foreign key (id_luogo) references piante_verifica2024.luoghi(id_luogo);


select * from piante_verifica2024.report r ;























