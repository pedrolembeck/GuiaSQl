/* HAVING */
SELECT departamento,COUNT(*) FROM funcionarios GROUP BY departamento HAVING COUNT(*)>5;