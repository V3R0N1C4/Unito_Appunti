select Registi.nome, Registi.cognome
from registi_docente as Registi
where (Registi.nome, Registi.cognome) not in (
select Registi.nome, Registi.cognome
from registi_docente as Registi join film_docente as Film on (Registi.Nominativo=Film.regista )
join attori_docente as Attori on Film.attoreprotagonista=Attori.nominativo
where Attori.nazione<>Registi.nazione );