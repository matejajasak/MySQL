CREATE TABLE IF NOT EXISTS korisnik(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

DESCRIBE korisnik;

CREATE TABLE IF NOT EXISTS sastanak(
    korisnik_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    FOREIGN KEY (korisnik_id) REFERENCES korisnik(id)
) ENGINE = InnoDB;

INSERT INTO korisnik (ime, prezime) VALUES ('Pero', 'Perić');
INSERT INTO korisnik (ime, prezime) VALUES ('Marko', 'Markić');
