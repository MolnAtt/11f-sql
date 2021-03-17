--- milyen tábla?

SELECT *
FROM kuldetes;

SELECT *
FROM kuldetes
WHERE YEAR(kezdet) < YEAR(veg)
;


SELECT megnevezes, veg-kezdet+1, kezdet, veg
FROM kuldetes
WHERE YEAR(kezdet) < YEAR(veg)
;


SELECT megnevezes, veg-kezdet+1
FROM kuldetes
WHERE YEAR(kezdet) < YEAR(veg)
;

