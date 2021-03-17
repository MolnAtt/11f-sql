SELECT *
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
;


-- 1.mo: GROUP BY: Group by-al próbálkozunk

SELECT megnevezes, nem, Count(*)
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY megnevezes, nem
;

SELECT megnevezes, nem
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
GROUP BY megnevezes, nem
;

SELECT DISTINCT megnevezes, nem
FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
;

-- az előző kettő valamelyikét lementjük egy 7groupbyseged segédlekérdezésbe!

SELECT *
FROM 7groupbyseged
;

SELECT megnevezes, COUNT(*)
FROM 7groupbyseged
GROUP BY megnevezes
;

SELECT megnevezes, COUNT(*)
FROM 7groupbyseged
GROUP BY megnevezes
HAVING COUNT(*)>1
;

SELECT megnevezes
FROM 7groupbyseged
GROUP BY megnevezes
HAVING COUNT(*)>1
;

-- 2.mo METSZET: Vegyük a férfias küldetéseket, vegyük a nőies küldetéseket, és vegyük a metszetét ennek a kettőnek.

  SELECT *
  FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
  ;

  -- férfias küldetések:
  SELECT *
  FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
  WHERE nem = "F"
  ;

  -- nőies küldetések:
  SELECT *
  FROM urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid
  WHERE nem = "N"
  ;

  -- férfias küldetések: küldetésid megjelenítése, mivel csak erre fogunk támaszkodni, így viszont a kuldetes tabla sem kell
  SELECT kuldetesid
  FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid
  WHERE nem = "F"
  ;

  -- nőies küldetések:
  SELECT kuldetesid
  FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid
  WHERE nem = "N"
  ;

-- METSZET:
SELECT megnevezes
FROM kuldetes
WHERE id IN (SELECT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem = "F")
  AND id IN (SELECT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem = "N")
;

SELECT DISTINCT megnevezes
FROM kuldetes
WHERE id IN (SELECT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem = "F")
  AND id IN (SELECT kuldetesid FROM urhajos INNER JOIN repules ON urhajos.id = repules.urhajosid WHERE nem = "N")
;


-- megjegyzés: nem kell ide két segédlekérdezés: egy segédlekérdezés kell, és azután where-rel szűrni


-- 3.mo: Relációs megközelítés: táblák többszöri szerepeltetése

SELECT *
FROM (urhajos AS urhajos_1 INNER JOIN repules AS repules_1 ON urhajos_1.id = repules_1.urhajosid) INNER JOIN (urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid) ON repules_1.kuldetesid = kuldetes.id;

SELECT *
FROM (urhajos AS urhajos_1 INNER JOIN repules AS repules_1 ON urhajos_1.id = repules_1.urhajosid) INNER JOIN (urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid) ON repules_1.kuldetesid = kuldetes.id
WHERE urhajos.nem = "N" AND  urhajos_1.nem = "F" ;


SELECT urhajos.nev, megnevezes, urhajos_1.nev
FROM (urhajos AS urhajos_1 INNER JOIN repules AS repules_1 ON urhajos_1.id = repules_1.urhajosid) INNER JOIN (urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid) ON repules_1.kuldetesid = kuldetes.id
WHERE urhajos.nem = "N" AND  urhajos_1.nem = "F" ;


SELECT DISTINCT megnevezes
FROM (urhajos AS urhajos_1 INNER JOIN repules AS repules_1 ON urhajos_1.id = repules_1.urhajosid) INNER JOIN (urhajos INNER JOIN (kuldetes INNER JOIN repules ON kuldetes.id = repules.kuldetesid) ON urhajos.id = repules.urhajosid) ON repules_1.kuldetesid = kuldetes.id
WHERE urhajos.nem = "N" AND  urhajos_1.nem = "F" 
;
