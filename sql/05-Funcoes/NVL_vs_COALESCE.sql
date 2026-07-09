/*
NVL vs COALESCE

Quando usar NVL
- Apenas Oracle
Vantagens:
- Simples
Desvantagens:
- Apenas dois parâmetros

Quando usar COALESCE
- Portabilidade
- Vários parâmetros

*/
SELECT NVL(comissao,0) FROM funcionarios;
SELECT COALESCE(comissao,bonus,0) FROM funcionarios;
