-- Proizione intera tabella
select * from amministrazione.test t ;
-- Proiezione solo degli attributi elencati
select t.codice_fiscale ,t.cognome ,t.nome  from amministrazione.test t ;
-- Proiezione di determinati attributi, senza ripetizione nel caso di tuple uguali(unique)
select distinct t.codice_fiscale ,t.cognome ,t.nome  from amministrazione.test t ;
-- Conta le righe dell'attributo tra parentesi, in questo caso di tuta la tabella pk ho *
select count(*) from amministrazione.test t ;
-- Proiezione di alcuni attrubuti con selezione
select distinct t.codice_fiscale ,t.cognome ,t.nome,t.ingresso ,t.uscita  from amministrazione.test t where t.nome like "%a";
-- Proiezione con selezione ordinata in ordine crescente
select * from amministrazione.test t order by t.ingresso asc;
-- Proiezione con selezione ordinata in ordine crescente
select * from amministrazione.test t order by t.ingresso desc;
-- Proiezione ordinata per data assunzione(uso distinct per evitare ripetizioni)
select distinct t.nome ,t.cognome ,t.data_assunzione from amministrazione.test t order by t.data_assunzione asc;
-- Stessa roba di prima, ma ora aggiungo Now() che da la data e ora corrente
select distinct t.nome ,t.cognome ,t.data_assunzione, now() from amministrazione.test t;
-- Uso datediff()per calcolare il tempo di assunzione, calcola i giorni trascorsi, as giorni serve per far mostrare a video la scritta 
-- giorni al posto del nome della funz. e della firma di essa
select distinct t.nome ,t.cognome ,t.data_assunzione, now(), datediff(now(),t.data_assunzione) as giorni from amministrazione.test t;
-- Stesso di quello sopra ma in anni
select distinct t.nome ,t.cognome ,t.data_assunzione, now(), datediff(now(),t.data_assunzione)/365 as anni from amministrazione.test t;
-- Stesso di quello sopra ma zenza virgola nell'anno, uso div alposto di / per dividere
select distinct t.nome ,t.cognome ,t.data_assunzione, now(), datediff(now(),t.data_assunzione) div 365 as anni from amministrazione.test t;
-- Stesso di quello sopra ma uso mod al posto di div, mod da il resto, quindi sono i giorni di resto
select distinct t.nome ,t.cognome ,t.data_assunzione, now(), datediff(now(),t.data_assunzione) mod 365 as giorniResto
from amministrazione.test t;
-- Stesso di quelo sopra ma aggiungo la divisione per i mesi
select distinct t.nome ,t.cognome ,t.data_assunzione, now(), datediff(now(),t.data_assunzione) mod 365 div 30 as mesi 
from amministrazione.test t;
-- Scrivo da quanti giorni, mesi, anni, uno lavora in azienda
select distinct t.codice_fiscale, t.cognome, t.nome,
datediff(now(),t.data_assunzione)as giorniTotali,
datediff(now(),t.data_assunzione) div 365 as anni,
datediff(now(),t.data_assunzione)mod 365 div 30 as mesi,
datediff(now(),t.data_assunzione)mod 365 mod 30 as giorni
from amministrazione.test t ; 
-- Scrivo da quanti giorni, mesi, anni, uno lavora in azienda e uso formattazione data
select distinct t.codice_fiscale, t.cognome, t.nome,
datediff(now(),t.data_assunzione)as giorniTotali,
datediff(now(),t.data_assunzione) div 365 as anni,
datediff(now(),t.data_assunzione)mod 365 div 30 as mesi,
datediff(now(),t.data_assunzione)mod 365 mod 30 as giorni,
date_format(now(), "%d %M %Y") as annoCorrente,-- modo per formattare la data
date_format(t.data_assunzione, "%d %M %Y") as dataAssunzione
from amministrazione.test t ;


-- inseriment multiplo di righe da una tabella ad un altra tabella:
-- insert into <nome database.nome tabella> select...

-- creo nuova tabella
create table amministrazione.personale(
codice_fiscale nvarchar(16), 
nome nvarchar(50),
cognome nvarchar(50),
fascia_stipendio int,
data_assunzione datetime
);
-- inserisco i dati nella nuova tabella da quella vecchia
insert into amministrazione.personale 
select distinct t.codice_fiscale, t.nome, t.cognome, t.fascia_stipendio, t.data_assunzione
from amministrazione.test t;
-- controllo stampando la nuova tabella
select * from amministrazione.personale p;


