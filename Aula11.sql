-- --------------------------------------------------------------
-- Aula11.sql
-- Demonstra a utilizacao de funcoes de agregacao, classificacao 
-- e views, utilizando o banco de dados Aula09.
-- --------------------------------------------------------------

-- Habilita o contexto
USE Aula09
GO


-- Exibe a listagem com o nome das tabelas existentes no banco 
SELECT name        AS 'Nome da Tabela',
	   create_date AS 'Data de Criacao'
FROM sys.tables
GO


-- --------------------------------------------------------------
-- Funcoes de agregacao
-- --------------------------------------------------------------

-- Utiliza as funcoes de agregacao para retornar o total de funcionarios
-- que existem, o total geral e a media do salario dentre eles, o maior e 
-- o menor salario. Demonstra tambem a utilizacao do desvio padrao e da 
-- variancia.
SELECT COUNT(*)       AS 'Total de Funcionarios',
       SUM(Salario)   AS 'Gasto Salarial',
       AVG(Salario)   AS 'Salario Medio',
	   MAX(Salario)	  AS 'Maior Salario',
	   MIN(Salario)	  AS 'Menor Salario',
       STDEV(Salario) AS 'Desvio Padrao',
       VAR(Salario)   AS 'Variancia'
FROM FUNCIONARIOS
GO


-- Exibe todos os dados da tabela FUNCIONARIOS
SELECT * FROM FUNCIONARIOS
GO


-- Retorna o total de funcionarios de cada sexo.  
-- Versao sem utilizar o GROUP BY -> Gera um erro!
SELECT  Sexo         AS 'Sexo',
        COUNT(Sexo)  AS 'Total de Funcionarios'
FROM FUNCIONARIOS
GO


-- Retorna o total de funcionarios de cada sexo.  
-- Utiliza o GROUP BY para agrupar os dados.
SELECT  Sexo         AS 'Sexo',
        COUNT(Sexo)  AS 'Total de Funcionarios'
FROM FUNCIONARIOS
GROUP BY Sexo
GO


-- Exibe o total de funcionarios admitidos em cada ano.
SELECT  YEAR(Admissao) AS 'Ano de Admissao',
        COUNT(*)       AS 'Total de Funcionarios' 
FROM FUNCIONARIOS
GROUP BY YEAR(Admissao)
GO


-- Exibir um relatorio contendo a inicial dos funcionarios, o
-- total de funcionarios cujo nome comece com essa inicial e o 
-- salario total gasto com todos esses funcionarios.
SELECT  SUBSTRING(Nome, 1, 1) AS 'Inicial',
        COUNT(Nome)           AS 'Quantidade de Funcionarios',
        SUM(Salario)          AS 'Gasto Salarial'
FROM FUNCIONARIOS
GROUP BY SUBSTRING(Nome, 1, 1)
GO


-- Exibir... Tenta filtrar o resultado, exibindo os dados onde a 
-- soma dos salarios dos funcionarios seja maior do que 2000.
SELECT  SUBSTRING(Nome, 1, 1) AS 'Inicial',
        COUNT(Nome)           AS 'Quantidade de Funcionarios',
        SUM(Salario)          AS 'Gasto Salarial'
FROM FUNCIONARIOS
WHERE SUM(Salario) > 2000
GROUP BY SUBSTRING(Nome, 1, 1)
GO



-- Exibir... Tenta filtrar o resultado, exibindo os dados onde a 
-- soma do salarios dos funcionarios seja maior do que 2000.
SELECT  SUBSTRING(Nome, 1, 1) AS 'Inicial',
        COUNT(Nome)           AS 'Quantidade de Funcionarios',
        SUM(Salario)          AS 'Gasto Salarial'
FROM FUNCIONARIOS
GROUP BY SUBSTRING(Nome, 1, 1)
HAVING SUM(Salario) > 2000
GO


-- --------------------------------------------------------------
-- Classificando resultados
-- --------------------------------------------------------------


-- Seleciona todos os funcionarios, ordenando pelo maior salario.
SELECT	ID,

