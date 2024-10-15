-- conta il numero di righe, uso funzione count, che è una funz. che mi restituisce 1 solo valore, valori di aggregazione, chiedono 1 solo valore, non posso mettere prima un p.nome ad esempio
select count(*) from amministrazione.personale p ;

-- ma posso accoppiarle a altre funz di aggregazione.(piu e meno)
select max(datediff (now(), p.data_assunzione)), min(datediff (now(), p.data_assunzione)) as giorni from amministrazione.personale p;

-- posso fare queste op su stringhe
select max(p.nome) as giorni from amministrazione.personale p;

-- posso fare queste op su stringhe e filtrarle
select max(p.nome) as giorni from amministrazione.personale p where p.nome like "a%";

-- conto persone con a
select count(*) from amministrazione.personale p where p.nome like "a%";

-- operazione somma(devo avere un campo numeico), in questo caso sommo tutti i giorni lavorativi sum()
select sum(datediff (now(), p.data_assunzione)) as giorni from amministrazione.personale p;

-- la media...avg()
select avg(datediff (now(), p.data_assunzione)) as giorni from amministrazione.personale p;

-- chi lavora di piu... max()
select max(datediff (now(), p.data_assunzione)) as giorni from amministrazione.personale p;

-- chi lavora di meno... min()
select min(datediff (now(), p.data_assunzione)) as giorni from amministrazione.personale p;


-- conto in base a un certo codice fiscale, quindi quante volte una stessa persona ha fatto qualcosa
select count(*)
from amministrazione.test t
where t.codice_fiscale = "00010";

-- conta i dati per gruppi di codici fiscali
select count(*)
from amministrazione.test t
group by t.codice_fiscale;

-- conta i dati per gruppi di codici fiscali, ma voglio vedere cosa mostro, quindi ora posso aggiungere il t.<atributo>, ma SOLO l'attributo per cui raggruppo
select t.codice_fiscale ,count(*)
from amministrazione.test t
group by t.codice_fiscale;