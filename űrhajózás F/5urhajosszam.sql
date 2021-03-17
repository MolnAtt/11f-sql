SELECT *
FROM urhajos;


SELECT orszag, COUNT(*)
FROM urhajos
GROUP BY orszag
;


SELECT orszag, COUNT(*) as db
FROM urhajos
GROUP BY orszag
ORDER BY COUNT(*) DESC
;

