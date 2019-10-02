
UPDATE zaposlenici SET ime = 'Saša' WHERE ime = 'Pero'; 
UPDATE zaposlenici SET ime = 'Pero' WHERE id = 1; 


SELECT * FROM zaposlenici;

DELETE FROM zaposlenici where id = 1 OR id = 3;
DELETE FROM zaposlenici where prezime = 'Perić' AND ime = 'Pero';

ALTER TABLE zaposlenici ADD COLUMN vrijeme INT AFTER prezime;

ALTER TABLE zaposlenici ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Zoran', 'Zoranić', 3);

ALTER TABLE zaposlenici ADD COLUMN updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP;
INSERT INTO zaposlenici (ime, prezime, poslovnica_id) VALUES ('Mijo', 'Mijić', 4);

UPDATE zaposlenici SET ime = 'Ivan' WHERE id = 2 OR id = 4;

ALTER TABLE zaposlenici
DROP COLUMN vrijeme;