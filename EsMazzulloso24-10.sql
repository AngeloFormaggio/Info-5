-- 1) visualizza i dati relativi alle pianta senza ripetizioni
-- 2) visualizza i dati dei fornitori senza ripetizioni
-- 3) visualizza da quanti fornitori viene fornita una pianta al vivaio
-- 4) visualizza quante piante fornisce ogni fornitore
-- 5) creare 2 tabelle in base ai dati presenti nel database e popolale

-- 1)
select count(distinct r.id) from vivaio.report r; -- conto in numero di piante diverse tra loro
select r.id, r.nome_latino ,r.nome_comune ,r.esotica from vivaio.report r order by r.nome_latino asc;

-- 2)
select count(distinct r.fornitore_id)from vivaio.report r;-- conto fornitori
select distinct r.fornitore_id, r.cognome ,r.nome, r.comune,r.cap,r.provincia,r.indirizzo,r.partita_iva ,r.codice_fiscale from vivaio.report r order by cognome asc;

-- 3)
select r.nome_latino from vivaio.report r;
