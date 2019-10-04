-- Dohvati imena i prezimena zaposlenika i ime poslovnice u kojoj radi

SELECT zaposlenici.ime, zaposlenici.prezime, poslovnica.naziv 
    FROM zaposlenici, poslovnica
    WHERE zaposlenici.poslovnica_id = poslovnica.id;

SELECT z.ime, z.prezime, p.naziv 
    FROM zaposlenici z, poslovnica p
    WHERE z.poslovnica_id = p.id;


SELECT z.ime, z.prezime, p.naziv 
    FROM zaposlenici z
    INNER JOIN poslovnica p ON p.id = z.poslovnica_id;

/*
INNER JOIN
OUTER LEFT JOIN
OUTER RIGHT JOIN
*/

UPDATE zaposlenici SET poslovnica_id = null WHERE id = 5 OR id = 6;

-- Dohvati imena i prezimena zaposlenika i ime poslovnice u kojoj radi ako rade u poslovnici sa ID-jem 1

SELECT z.ime, z.prezime, p.naziv 
    FROM zaposlenici z
    INNER JOIN poslovnica p ON p.id = z.poslovnica_id
    WHERE z.poslovnica_id = 3;

-- Dohvati imena i prezimena zaposlenika i ima poslovnice u kojoj radi i grad u kojem se nalazi
-- te ih sortiraj po imenu uzlazno

SELECT z.ime, z.prezime, p.naziv, g.ime 'Ime grada'
FROM zaposlenici z
JOIN poslovnica p ON p.id = z.poslovnica_id
JOIN grad g ON p.grad_id = g.id
ORDER BY z.ime ASC;

-- Dohvati imena i prezimena zaposlenika i ima poslovnice u kojoj radi i grad u kojem se nalazi
-- te ih grupiraj po gradu i izbroji gradove


SELECT g.ime 'Ime grada', count(g.ime) 'Broj poslovnica u gradu'
FROM zaposlenici z
JOIN poslovnica p ON p.id = z.poslovnica_id
JOIN grad g ON p.grad_id = g.id
GROUP BY g.ime;

SELECT DISTINCT g.ime Grad
FROM zaposlenici z
JOIN poslovnica p ON p.id = z.poslovnica_id
JOIN grad g ON p.grad_id = g.id;


-- Dohvati sve poslovnice koje imaju voditelja

SELECT p.naziv, p.id FROM poslovnica p
JOIN voditelj_poslovnice vp ON p.id = vp.poslovnica_id;


-- Dohvati sve poslovnice koje imaju voditelja i imena voditelja i konkatenirajte ime u jedno polje

SELECT p.naziv AS Poslovnica, p.id, CONCAT (z.ime, ' ',z.prezime) AS Voditelj 
FROM poslovnica p
JOIN voditelj_poslovnice vp ON vp.poslovnica_id = p.id
JOIN zaposlenici z ON vp.zaposlenik_id = z.id;

/************************* OPERATOR IN i PODUPITI ****************************/

SELECT p.naziv, p.id
    FROM poslovnica p
    WHERE p.id NOT IN (1,4);

    SELECT poslovnica_id FROM voditelj_poslovnice;

-- Dohvati sve poslovnice koje imaju voditelja

SELECT p.naziv, p.id
    FROM poslovnica p
    WHERE p.id IN (SELECT vp.poslovnica_id FROM voditelj_poslovnice vp);

 --   SELECT poslovnica_id FROM voditelj_poslovnice; --> vraća skup [1,2]

-- Dohvati sve poslovnice koje nemaju voditelja

SELECT p.naziv, p.id
    FROM poslovnica p
    WHERE p.id NOT IN (SELECT vp.poslovnica_id FROM voditelj_poslovnice vp);

-- Dohvati sve poslovnice koje imaju zaposlenike 

SELECT p.naziv, p.id
    FROM poslovnica p
    WHERE p.id IN (SELECT z.poslovnica_id FROM zaposlenici z);

-- Dohvati sve poslovnice koje nemaju zaposlenike 

SELECT p.naziv, p.id
    FROM poslovnica p
    WHERE p.id NOT IN (SELECT z.poslovnica_id FROM zaposlenici z);


CREATE TABLE zaposlenici_poslovnica_grad AS 
    SELECT z.ime, z.prezime, p.naziv, g.ime 'Ime grada'
    FROM zaposlenici z
    JOIN poslovnica p ON p.id = z.poslovnica_id
    JOIN grad g ON p.grad_id = g.id
    ORDER BY z.ime ASC;

CREATE OR REPLACE VIEW view_zaposlenici_poslovnica_grad AS 
    SELECT z.ime, z.prezime, p.naziv, g.ime 'Ime grada'
    FROM zaposlenici z
    JOIN poslovnica p ON p.id = z.poslovnica_id
    JOIN grad g ON p.grad_id = g.id
    ORDER BY z.ime ASC;