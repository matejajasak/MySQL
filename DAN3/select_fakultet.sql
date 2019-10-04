--Zadatak 2.17
/*Ispišite imena i prezimena nastavnika s nazivom mjesta u kojem stanuju*/

SELECT n.imeNastavnik, n.prezNastavnik, m.nazMjesto 
FROM nastavnik n
JOIN mjesto m ON n.pbrStan = m.pbr;

-- 2.18
/*Ispišimo imena i prezimena svih studentata zajedno s ispitima na koej su izašli i ocjenama koje su dobbili. Naravno, bit će studenata koji nisu ni jednom izašli na neki ispit, pa kod njih ne možemo ispisati šifru ispita.*/

SELECT s.imeStud, s.prezStud, i.ocjena, p.nazPred 
FROM stud s
LEFT JOIN ispit i ON s.mbrStud = i.mbrStud
LEFT JOIN pred p ON i.sifPred = p.sifPred;

-- 2.19
/* Ispišimo sve predmete i dvorane u kojima se predaje. Kako se neki predmeti ne predaju ovaj semestar, oni nemaju rezerviranu dvoranu, pa će to biti reprezentirano NULL vrijednostima.*/ 

SELECT p.*, d.* FROM pred p
LEFT JOIN rezervacija r ON p.sifPred = r.sifPred
LEFT JOIN dvorana d ON r.oznDvorana = d.oznDvorana;
