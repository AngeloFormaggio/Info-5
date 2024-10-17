-- percentuale di quanta gente è in una certa fascia stipendio
select count(*)/max(p.codice_fiscale)*100, p.fascia_stipendio from amministrazione.personale p group by p.fascia_stipendio;

-- conto quanta gente è in una x fascia stipendio
select count(*), p.fascia_stipendio from amministrazione.personale p group by p.fascia_stipendio;

-- mostro il numero di persone nella fasci stiprndio 1 o 3 o 5 con nome che finisce per a e ordino in modo decrescente
select p.fascia_stipendio, count(*)
from amministrazione.personale p 
where p.nome like "%a"
group by p.fascia_stipendio
having p.fascia_stipendio in (1,3,5)
order by p.fascia_stipendio desc;

-- conto le singole timbrature
select t.codice_fiscale , count(*) 
from amministrazione.test t
group by t.codice_fiscale;

-- conto il numero si ore lavorate
select t.codice_fiscale, timediff(t.uscita,t.ingresso)
from amministrazione.test t;
