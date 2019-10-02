SELECT * FROM zaposlenici; --dohvati sve stupce iz tablice 

SELECT ime, prezime FROM zaposlenici;

--pseudonimi atributa
SELECT ime AS Ime, prezime AS Prezime FROM zaposlenici;
SELECT ime Ime, prezime 'Prezime osobe' FROM zaposlenici;

SELECT * FROM zaposlenici
WHERE ime = 'Ivan' OR ime = 'Marko' AND prezime = 'Markić';

SELECT * FROM zaposlenici WHERE created_at > NOW();

SELECT ime, prezime, sada FROM zaposlenici;

SELECT ime, prezime, now() sada FROM zaposlenici;

SELECT * FROM zaposlenici WHERE updated_at IS NOT NULL;

SELECT TIMEDIFF(created_at, updated_at) AS vremenska_razlika FROM zaposlenici WHERE updated_at IS NOT NULL;

SELECT CONCAT(ime, ' ', prezime) AS 'Ime i Prezime' FROM zaposlenici; -- spajanje dviju tablicu u jednu

SELECT * FROM zaposlenici WHERE ime LIKE 'Iv%';


SELECT * FROM zaposlenici WHERE ime LIKE '%a_';

SELECT ime FROM zaposlenici GROUP BY ime;
SELECT DISTINCT ime FROM zaposlenici;
SELECT ime, count(*) AS Broj FROM zaposlenici GROUP BY ime;

SELECT * FROM zaposlenici ORDER BY ime;
SELECT * FROM zaposlenici ORDER BY ime DESC;
SELECT * FROM zaposlenici ORDER BY ime, prezime;

