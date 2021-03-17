SELECT *
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
;

SELECT nev, COUNT(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
;

SELECT nev, COUNT(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
HAVING COUNT(*)>1
;


SELECT nev, MIN(kezdet), MAX(kezdet) , COUNT(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
HAVING COUNT(*)>1
;

SELECT nev, MIN(kezdet), MAX(kezdet) , COUNT(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
HAVING COUNT(*)>1
;

SELECT nev, MIN(kezdet) as elso, MAX(kezdet) as utolso
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY nev
HAVING COUNT(*)>1;

SELECT urhajos.id as urhajosid, MIN(kezdet) as elso, MAX(kezdet) as utolso
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY urhajos.id
HAVING COUNT(*)>1;
-- ez ment a 4 segedlekerdezesbe


SELECT *
FROM urhajos INNER JOIN 4seged ON urhajos.id = [4seged].urhajosid;

SELECT nev, YEAR(elso)-szulev, YEAR(utolso)-szulev
FROM urhajos INNER JOIN 4seged ON urhajos.id = [4seged].urhajosid;

-- egybe is lehetett volna

SELECT nev, Min(Year(kezdet)-szulev) AS eloszor, Max(Year(kezdet)-szulev) AS utoljara
FROM urhajos, repules, kuldetes
WHERE urhajos.id=urhajosid AND kuldetesid=kuldetes.id
GROUP BY nev
HAVING Count(urhajos.id)>1;



