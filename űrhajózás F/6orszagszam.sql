    SELECT orszag FROM urhajos GROUP BY orszag;
-- vagy
    SELECT DISTINCT orszag FROM urhajos;


SELECT Count(allekerdezes.orszag)
FROM (SELECT Distinct orszag FROM urhajos) AS allekerdezes;
