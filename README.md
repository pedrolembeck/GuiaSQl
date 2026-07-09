# Oracle SQL Cheat Sheet

> Guia rápido de Oracle SQL para consulta pessoal.

---

# Índice

- SELECT
- WHERE
- ORDER BY
- DISTINCT
- Alias
- Operadores
- Funções de Texto
- Funções Numéricas
- Funções de Data
- Funções de Conversão
- Funções de Agregação
- GROUP BY
- HAVING
- JOINs
- Subqueries
- EXISTS
- CASE
- CREATE TABLE
- ALTER TABLE
- INSERT
- UPDATE
- DELETE
- TRUNCATE
- DROP
- Constraints
- Views
- Sequences
- Índices
- Dicas Oracle

---

# SELECT

```sql
SELECT * FROM funcionarios;

SELECT nome, salario
FROM funcionarios;
```

---

# WHERE

```sql
SELECT *
FROM funcionarios
WHERE salario > 5000;

SELECT *
FROM funcionarios
WHERE departamento = 'TI';
```

---

# ORDER BY

```sql
SELECT *
FROM funcionarios
ORDER BY salario;

SELECT *
FROM funcionarios
ORDER BY salario DESC;
```

---

# DISTINCT

```sql
SELECT DISTINCT departamento
FROM funcionarios;
```

---

# Alias

```sql
SELECT
    nome AS funcionario,
    salario AS salario_mensal
FROM funcionarios;
```

---

# Operadores

## Comparação

```sql
=
<>
>
<
>=
<=
```

## Lógicos

```sql
AND
OR
NOT
```

## BETWEEN

```sql
SELECT *
FROM funcionarios
WHERE salario BETWEEN 3000 AND 7000;
```

## IN

```sql
SELECT *
FROM funcionarios
WHERE departamento IN ('TI','RH','Financeiro');
```

## LIKE

```sql
LIKE '%A'
LIKE 'A%'
LIKE '%A%'
LIKE '_A%'
```

## NULL

```sql
IS NULL

IS NOT NULL
```

---

# Funções de Texto

## UPPER

```sql
SELECT UPPER(nome)
FROM funcionarios;
```

## LOWER

```sql
SELECT LOWER(nome)
FROM funcionarios;
```

## INITCAP

```sql
SELECT INITCAP(nome)
FROM funcionarios;
```

## LENGTH

```sql
SELECT LENGTH(nome)
FROM funcionarios;
```

## SUBSTR

```sql
SELECT SUBSTR(nome,1,3)
FROM funcionarios;
```

## REPLACE

```sql
SELECT REPLACE(nome,'a','A')
FROM funcionarios;
```

## TRIM

```sql
SELECT TRIM(nome)
FROM funcionarios;
```

## CONCAT

```sql
SELECT nome || ' - ' || cargo
FROM funcionarios;
```

---

# Funções Numéricas

```sql
ROUND(10.456,2)

TRUNC(10.456,2)

MOD(15,2)

ABS(-10)

CEIL(10.2)

FLOOR(10.9)
```

---

# Funções de Data

## Data atual

```sql
SELECT SYSDATE
FROM dual;
```

## Data e Hora

```sql
SELECT CURRENT_DATE
FROM dual;
```

## Adicionar meses

```sql
SELECT ADD_MONTHS(SYSDATE,3)
FROM dual;
```

## Próximo dia

```sql
SELECT NEXT_DAY(SYSDATE,'MONDAY')
FROM dual;
```

## Último dia do mês

```sql
SELECT LAST_DAY(SYSDATE)
FROM dual;
```

---

# Conversões

## TO_CHAR

```sql
SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY')
FROM dual;
```

```sql
SELECT TO_CHAR(salario,'999G999D99')
FROM funcionarios;
```

## TO_DATE

```sql
TO_DATE('15/06/2025','DD/MM/YYYY')
```

## TO_NUMBER

```sql
TO_NUMBER('1500')
```

---

# Funções de Agregação

## COUNT

```sql
SELECT COUNT(*)
FROM funcionarios;
```

## SUM

```sql
SELECT SUM(salario)
FROM funcionarios;
```

## AVG

```sql
SELECT AVG(salario)
FROM funcionarios;
```

## MAX

```sql
SELECT MAX(salario)
FROM funcionarios;
```

## MIN

```sql
SELECT MIN(salario)
FROM funcionarios;
```

---

# GROUP BY

```sql
SELECT departamento,
       AVG(salario)
FROM funcionarios
GROUP BY departamento;
```

---

# HAVING

```sql
SELECT departamento,
       COUNT(*)
FROM funcionarios
GROUP BY departamento
HAVING COUNT(*) > 5;
```

---

# INNER JOIN

```sql
SELECT
    f.nome,
    d.nome_departamento
FROM funcionarios f
INNER JOIN departamentos d
ON f.id_departamento = d.id;
```

---

# LEFT JOIN

```sql
SELECT *
FROM funcionarios f
LEFT JOIN departamentos d
ON f.id_departamento = d.id;
```

---

# RIGHT JOIN

```sql
SELECT *
FROM funcionarios f
RIGHT JOIN departamentos d
ON f.id_departamento = d.id;
```

---

# FULL JOIN

```sql
SELECT *
FROM funcionarios f
FULL OUTER JOIN departamentos d
ON f.id_departamento = d.id;
```

---

# Subquery

```sql
SELECT *
FROM funcionarios
WHERE salario >
(
    SELECT AVG(salario)
    FROM funcionarios
);
```

---

# EXISTS

```sql
SELECT *
FROM departamentos d
WHERE EXISTS
(
    SELECT 1
    FROM funcionarios f
    WHERE f.id_departamento = d.id
);
```

---

# CASE

```sql
SELECT
nome,

CASE

WHEN salario >= 8000 THEN 'Alto'

WHEN salario >= 5000 THEN 'Médio'

ELSE 'Baixo'

END faixa

FROM funcionarios;
```

---

# CREATE TABLE

```sql
CREATE TABLE funcionarios(

id NUMBER PRIMARY KEY,

nome VARCHAR2(100),

salario NUMBER(10,2),

data_admissao DATE

);
```

---

# ALTER TABLE

Adicionar coluna

```sql
ALTER TABLE funcionarios
ADD email VARCHAR2(100);
```

Modificar coluna

```sql
ALTER TABLE funcionarios
MODIFY email VARCHAR2(200);
```

Excluir coluna

```sql
ALTER TABLE funcionarios
DROP COLUMN email;
```

---

# INSERT

```sql
INSERT INTO funcionarios

(id,nome,salario)

VALUES

(1,'Pedro',5500);
```

---

# UPDATE

```sql
UPDATE funcionarios

SET salario = 6500

WHERE id = 1;
```

---

# DELETE

```sql
DELETE FROM funcionarios

WHERE id = 1;
```

---

# TRUNCATE

```sql
TRUNCATE TABLE funcionarios;
```

---

# DROP

```sql
DROP TABLE funcionarios;
```

---

# Constraints

## Primary Key

```sql
PRIMARY KEY
```

## Foreign Key

```sql
FOREIGN KEY
```

## UNIQUE

```sql
UNIQUE
```

## CHECK

```sql
CHECK (salario > 0)
```

## DEFAULT

```sql
DEFAULT SYSDATE
```

## NOT NULL

```sql
NOT NULL
```

---

# Views

```sql
CREATE VIEW vw_funcionarios AS

SELECT

nome,

salario

FROM funcionarios;
```

---

# Sequences

Criar

```sql
CREATE SEQUENCE seq_funcionario

START WITH 1

INCREMENT BY 1;
```

Usar

```sql
seq_funcionario.NEXTVAL

seq_funcionario.CURRVAL
```

---

# Índices

```sql
CREATE INDEX idx_nome

ON funcionarios(nome);
```

Remover

```sql
DROP INDEX idx_nome;
```

---

# Dicas Oracle

## DUAL

```sql
SELECT SYSDATE FROM dual;
```

## NVL

```sql
SELECT NVL(comissao,0)
FROM funcionarios;
```

## NVL2

```sql
SELECT NVL2(comissao,'Tem','Não Tem')
FROM funcionarios;
```

## COALESCE

```sql
SELECT COALESCE(comissao,bonus,0)
FROM funcionarios;
```

## DECODE

```sql
SELECT DECODE(sexo,'M','Masculino','F','Feminino')
FROM funcionarios;
```

## ROWNUM

```sql
SELECT *
FROM funcionarios
WHERE ROWNUM <= 10;
```

## FETCH FIRST

```sql
SELECT *
FROM funcionarios
ORDER BY salario DESC
FETCH FIRST 10 ROWS ONLY;
```

## Comentários

```sql
-- Comentário de uma linha

/*
Comentário
de várias linhas
*/
```

---

# Ordem de execução de uma consulta

```
FROM

JOIN

WHERE

GROUP BY

HAVING

SELECT

DISTINCT

ORDER BY

FETCH
```

---

# Boas práticas

- Utilize aliases (`f`, `d`) para melhorar a leitura.
- Evite `SELECT *` em produção.
- Sempre filtre quando possível.
- Crie índices apenas quando necessário.
- Nomeie tabelas e colunas de forma consistente.
- Utilize `FETCH FIRST` em vez de `ROWNUM` quando possível.
- Prefira `COALESCE` para múltiplos valores nulos.
