/* SGBDR SISTEMA DE GERENCIAMENTO DE BANCO DE DADOS RELACIONAL */

/* POSSUI VÁRIOS GRUPOS DE COMANDOS 
DDL - LINGUAGEM DE DEFINIÇÃO DE DADOS
CRETE, ALTER, DROP

DML - MANIPULAÇÃO DE BANCO DE DADOS
INSERT, UPDATE, DELETE

DCL - CONTROLE DE ACESSO DE DADOS
GRANT, REVOKE

DQL - OBTER CONSULTA DE DADOS
SELECT

*/

create database db_Biblioteca
on primary(
name= db_Biblioteca,
filename= 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\
db_Biblioteca.MDF',
size=6MB,
maxsize=10MB,
filegrowth=10%
)
go
/* O PREFIXO DB_ INDICA QUE É UMA DATABASE, NO CASO DE UMA TABELA TB_ */

/* O COMANDO sp_helpdb informa o tamanho, taxa de crescimento, local do banco */
sp_helpdb db_Biblioteca

/* para fazer qualquer comentário no banco de dados usamos 02 traços de menos
 antes da linha na frase ex: */
 --USE db_Biblioteca 

/* SQL CONSTRAINTS (RESTRIÇOES) REGRAS PARA LIMITAR OS TIPOS DE DADOS */
NOT NULL - NÃO NULO
UNIQUE - IDENTIFICA DE FORMA ÚNICA CADA REGISTRO NA TABELA (PRIMARY KEY - DEFINI O
 REGISTRO ÚNICO AUTOMATICAMENTE)
PRIMARY KEY - NÃO ACEITA VALORES NULOS POR PADRÃO, CADA TABELA DEVE TER UMA CHAVE
 PRIMÁRIA POR PADRÃO
FOREIGN KEY - É UM CAMPO QUE APONTA PARA UMA CHAVE PRIMÁRIA EM OUTRA TABELA

Alter table  cliente
    add
    constraint fk_cliente_cidade 
    foreign key (cidade) 
    references cidade (id_cidade)

CHECK -  É USADA PARA LIMITAR UMA FAIXA DE VALORES QUE PODEM SER COLOCADOS EM UMA 
COLUNA, PERMITE APENAS DETERMINADOS VALORES PARA COLUNA OU TABELA

DEFAULT - É USADA PARA INSERIR UM VALOR PADRÃO EM UMA COLUNA, SERÁ ADICIONADO A 
TODOS OS NOVOS REGISTROS CASO NENHUM OUTRO VALOR SEJA ESPECIFICADO

CREATE TABELA tbl_Livro
(Id_Livro smallint primary key identity(100, 1),
Nome_Livro varchar(50) not null,
ISBN varchar(30) not null unique,
ID_Autor smallint not null,
Data_Pub datetime not null,
Preco_Livro Money not null)

CREATE TABLE tbl_autores
(ID_Autor smallint primary key,
Nome_Autor varchar(50),
SobreNome_Autor varchar(60)
)

CREATE TABLE tbl_editoras(
ID_editoras smallint primary key identity,
Nome_Editora varchar(50) not null
)

/* COMANDO sp_help INFORMA OS ÍNDICES, CHAVES E CAMPOS,
 ATRIBUTOS E TIPOS DE UMA TABELA */
 sp_help tbl_autores

 sp_help  tbl_Livro

 /* para criar e visualizar um diagrama de banco de dados clicar
 DIAGRAMA DE BANCO DE DADOS COM DIREITO
 NOVO DIAGRAMA
 SELECIONAR TODAS AS TABELAS E CONFIRMAR */

 -- APÓS CRIAR AS TABELAS CLICAR COM BOTÃO OPÇÃO SOBRE DIAGRAMAS BD
 -- NOVO DIAGR DE DADOS E SECELICIONA AS TABELAS PARA ELE CRIAR OS DER
 -- Um diagrama entidade relacionamento (ER) é um tipo de fluxograma que
 -- ilustra como “entidades”, p. ex., pessoas, objetos ou conceitos, se 
 --relacionam entre si dentro de um sistema

 /* AUTO INCREMENT (IDENTITY) PERMITE QUE O VALOR SEJA GERADO, SQL SERVER
 TRATA-SE DA PALAVRA CHAVE IDENTITY QUE O VALOR INICIAL É 1 E SE INCREMENTA 
 DE 1 EM 1; PARA O VALOR DE IDENTITY INICIE EM 100 E SE INCREMENTE DE 2 EM 2, USE...
 IDENTITY(100,2).
 NÃO É POSSIVEL ALTERAR UMA COLUNA EXISTENTE PARA CONFIGURAR IDENTITY
 SE NECESSÁRIO, CRIE UMA NOVA TABELA COM IDENTITY
 SÓ É PERMITIDO USAR UMA COLUNA DE IDENTIDADE POR TABELA */

 CREATE TABLE tbl_teste_identidade(
        ID_Teste smallint primary key identity,
        valor smallint not null)

 INSERT INTO tbl_teste_identidade(valor) VALUES(10)
 INSERT INTO tbl_teste_identidade(valor) VALUES(20)
 INSERT INTO tbl_teste_identidade(valor) VALUES(30)
 INSERT INTO tbl_teste_identidade(valor) VALUES(40)

select * from tbl_teste_identidade

/* PARA ALTERAR A ESTRUTURA DE UMA TABELA */ 
ALTER TABLE tbl_Livro
DROP column ID_Autor

/* para excluir uma constraint */
alter table tabela
drop constraint nome_constraint

/* excluimos uma coluna da tabela tbl_livro e vamos adicionar 
com outros parâmetros */
alter table tbl_Livro
add ID_Autor smallint not null
constraint fk_ID_Autor foreign key(ID_Autor)
references tbl_autores

alter table tbl_Livro
add ID_editora smallint not null
constraint fk_id_editora foreign key(ID_editora)
references tbl_editoras

 sp_help  tbl_Livro

 /* alterando o tipo de dados da coluna na tabela */
 /* OBS NÃO DÁ PARA MUDAR UMA COLUNA E TABELA SE 
 HOUVER DADOS INSERIDOS */
 alter table tbl_Livro
 alter column ID_Autor smallint
 
 /* PARA ADICIONAR UMA CHAVE PRIMARIA A UMA COLUNA*/
 alter table Clientes
 add primary key (id_Cliente)

 /* EXCLUIR TABELA */
 /* NO CASO DE HAVER RELACIONAMENTOS ENTRE TABELAS TALVEZ NÃO
  CONSIGA EXCLUIR A TABELA, PRECISANDO PRIMEIRO EXCLUIR OS
 RELACIONAMENTOS PRIMEIRO*/
 drop table tbl_teste_identidade

/* inserir dados em uma tabela */
insert into tabela (coluna1, coluna2,...)
VALUES(valor1, valor2,...)

INSERT INTO tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor)
 values (1, 'Daniel', 'Barret')

INSERT INTO tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor)
 values (2, 'Gerald', 'Carter')

INSERT INTO tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor)
 values (3, 'Mark', 'Sobell')

INSERT INTO tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor)
 values (4, 'William', 'Stanek')

INSERT INTO tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor)
 values (5, 'Richard', 'Blum')

INSERT INTO tbl_editoras(Nome_Editora) VALUES('Prentices Hall')

INSERT INTO tbl_editoras(Nome_Editora) VALUES('OReilly')

INSERT INTO tbl_editoras(Nome_Editora) VALUES('Microsoft Press')

INSERT INTO tbl_editoras(Nome_Editora) VALUES('Wiley')

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('Linux Command Line and Shell
  Scripting', 143856969, '20091221', 68.35, 5, 4)

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('SSH secure Shell', 127658789, 
 '20091221', 58.30, 1, 2)

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('Using Samba', 123856789, 
 '20091221', 61.45, 2, 2)

/* TRUNCATE TABLE remove todas as linhas de uma tabela, é igual 
ao DELETE sem usar a cláusula WHERE */

-- usar o COUNT para ver o total de registros 
select COUNT(*) AS TABELA_ANTES FROM CLIENTES
GO
TRUNCATE TABLE CLIENTES
GO
select COUNT(*) AS TABELA_DEPOIS FROM CLIENTES
GO

/* SELECT */
USE db_Biblioteca

select Nome_Autor from tbl_autores

select * from tbl_autores

select Nome_Livro from tbl_Livro

--podemos especificar mais de uma coluna para o select desde que
-- usemos VÍRGULAS SEPARANDO
select Nome_Livro, ID_Autor from tbl_Livro

/* ORDER BY */
-- USADO PARA ORDENAR O CONJUNTO RESULTADO DE REGISTROS
-- ASC - ORDEM ASCENDENTE
-- DESC - ORDEM DESCENDENTE
select * FROM tbl_Livro
 order by Nome_Livro

select * FROM tbl_Livro
 order by Nome_Livro desc

select Nome_Autor from tbl_autores
order by Nome_Autor

/* SELECT DINSTINCT
ALGUMAS COLUNAS PODEM CONTER VALORES DUPLICADOS
PARA EXIBIR APENAS VALORES DISTINTOS */
select DISTINCT ID_Autor
FROM tbl_Livro

/* CLÁUSULA WHERE PERMITE FILTRAR REGISTROS EM UMA CONSULTA */
select * from tbl_Livro where ID_Autor ='1'

select ID_Autor from tbl_autores where
SobreNome_Autor = 'Stanek'

/* OPERADORES AND E OR */
SELECT * FROM tbl_Livro
where Id_Livro > 2 and ID_Autor < 3

select * from tbl_Livro
where Id_Livro < 2 or ID_Autor < 3

/* COMANDO UPDATE */
-- SINTAXDE DO UPDATE
UPDATE TABELA
SET COLUNA = VALOR, COLUNA = VALORES /* ATÉ AQUI PARA A
 COLUNA TODA*/
WHERE FILTRO /* ATÉ AQUI VAI A UM DETERMINADO REGISTRO */

UPDATE tbl_Livro
set Preco_Livro = 65.45
where Id_Livro = 102

UPDATE tbl_autores
set SobreNome_Autor = 'Cartman'
where ID_Autor = 2;

update tbl_Livro
    set Preco_Livro = 80.00,
    ISBN = '0202020'
    where Id_Livro = 101;

/* SELECT TOP */
--USADO PARA ESPECIFICAR O NUMERO DE REGISTROS A RETORNAR
--UTIL PARA TABELA COM MUITOS REGISTROS

SELECT TOP NUMERO|PERCENTUAL COLUNAS
FROM TABELAS

SELECT TOP 10 PERCENT Nome_Livro
FROM tbl_Livro

SELECT TOP 2 Nome_Livro
from tbl_Livro

/* COMANDO ALIAS */
--PODE SE DAR UM NOME ALTERNATIVO A UMA COLUNA OU TABELA
-- EM UMA CONSULTA
SELECT COLUNAS
AS NOME_ALIAS
FROM TABELAS

SELECT Nome_Livro
As Livro
from tbl_Livro

SELECT Nome_Livro
As Livro, ID_Autor as Autor
from tbl_Livro

/* OPERADOR UNION */
--PERMITE COMBINAR DUAS OU MAIS DECLARAÇÕES SELECT
--CADA DECLARAÇÃO SELECT DEVE TER O MESMO NUMERO
--DE COLUNAS, TIPOS DE DADOS E ORDEM DAS COLUNAS

SELECT COLUNAS FROM TABELA 1
UNION 
SELECT COLUNAS FROM TABELA 2

select ID_Autor from tbl_autores union
select ID_Autor from tbl_Livro

/* SELECT INTO */
--SELECIONA DADOS DE UMA OU MAIS TABELAS E OS INSERE EM UMA
-- TABELA DIFERENTE
-- PODE SER USADA PARA CRIAR CÓPIAS DE BACKUP DE TABELAS

SELECT COLUNAS
INTO NOVA TABELAS 
FROM TABELA ATUAL

select Nome_Livro, ISBN
into Livro_ISBN
from tbl_Livro
where Id_Livro > 2

select *
into tbl_Livro_Backup
from tbl_Livro

/* FUNÇÕES AGREGADAS */
MIN = VALOR MÍNIMO
MAX = VALOR MÁXIMO
AVG = MÉDIA ARITMÉTICA
SUM = TOTAL(SOMA)
COUNT = CONTAR QUANTIDADE DE ITENS

SELECT COUNT(*) FROM tbl_autores
SELECT COUNT(Nome_Autor) FROM tbl_autores

select max(Preco_Livro) from tbl_Livro
select max(Preco_Livro) as preçoMáximo from tbl_Livro

select min(Preco_Livro) from tbl_Livro
select min(Preco_Livro) as PreçoMínimo from tbl_Livro

select avg(Preco_Livro) from tbl_Livro
select avg(Preco_Livro) as Média from tbl_Livro

select sum(Preco_Livro) from tbl_Livro
select sum(Preco_Livro) as Somatório from tbl_Livro
-- valores referentes a uma coluna de uma tabela

/* FUNÇÃO BETWEEN - SELEÇÃO DE INTERVALOS */
SELECT COLUNAS FROM TABELA
WHERE COLUNA BETWEEN VALOR1 AND VALOR2

SELECT * from tbl_Livro
where Data_Pub BETWEEN '20040517' and '20100517'

select Nome_Livro as Livro, Preco_Livro as Preço 
from tbl_Livro
where Preco_Livro between 60.00 and 70.00

insert into tbl_Livro(Nome_Livro, ISBN,Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('Fedora and Red Hat Linux', 123346789,
  '20101101', 62.24, 3, 1) 

insert into tbl_Livro(Nome_Livro, ISBN,Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('Windows Server 2012 Inside Out',
  123356789, '20040517', 66.80, 4, 3)

insert into tbl_Livro(Nome_Livro, ISBN,Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('Microsoft Exchage Server 2010', 123366789,
  '20001221', 45.30, 4, 3)

/* OPERADORES LIKE E NOT LIKE */
--DETERMINA SE UMA CADEIA DE CARACTERES CORRESPONDE A UM PADRÃO ESPECIFICADO
-- NOT LIKE INVERTE A COMPARAÇÃO , VERIFICANDO SE NÃO CORRESPONDE
-- USADO JUNTO COM WHERE
LIKE - PADRÕES ESPECÍFICOS
'%' --QUALQUER CADEIA DE 0 OU MAIS CARACTÉRES
'_' --SUBLINHADO: QUALQUER CARACTÉRE ÚNICO
'[]' --QUALQUER CACTERE ÚNICO NO INTERVALO OU CONJUNTO ESPECIFICADO
-- ([a-h]; [aeiou])
'[^]' -- QUALQUER CARACTERE ÚNICO QUE NÃO ESTEJA NO INTERVALO OU CONJUNTO
--ESPECIFICADO ([a-h]; [aeiou])

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like 'S%'
--A PRIMEIRA LETRA S

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like '%g'
--A SEGUNDA LETRA G

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like '_i%'
-- SEGUNDA LETRA I SEM SABER DAS OUTRAS SEGUINTES

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like '[SL]%'
--PRIMEIRA LETRA COMEÇA COM S OU L

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like '%[GL]'
--ÚLTIMA LETRA EM COM G OU L

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like '_[iS]%'
--SEGUNDA LETRA I OU S

SELECT Nome_Livro from tbl_Livro
where Nome_Livro like '_i__O%'
--SEGUNDA LETRA I E A QUINTA LETRA O

SELECT Nome_Livro from tbl_Livro
where Nome_Livro NOT like 'M%'
--PROCURA UM LIVRO QUE A PRIMEIRA LETRA NÃO COMEÇA COM M

/* FUNÇÃO JOIN */
--É USADO PARA OBTER DADOS DE DUAS MAIS TABELAS, BASEADO
--EM UM RELACIONAMENTO
INNER JOIN - RETORNA LINHAS QDO HOUVER PELO MENOS UMA 
CORRESPONDÊNCIA EM AMBAS AS TABELAS

OUTER JOIN - RETORNA LINHAS MESMO QDO NÃO HOUVER PELO MENOS
UMA CORRESPONDÊNCIA EM UMAS DAS TABELAS OU AMBAS
DIVIDE SE EM LEFT JOIN, RIGHT JOIN, FULL JOIN

/* INNER JOIN */
SELECT COLUNAS
FROM TABELA1
INNER JOIN TABELA2
ON TABELA1.COLUNA=TABELA2.COLUNAS

select * from tbl_Livro
inner join tbl_autores
on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

select tbl_Livro.Nome_Livro, tbl_Livro.ISBN,
tbl_autores.Nome_Autor
from tbl_Livro
inner join tbl_autores
on tbl_Livro.ID_Autor=tbl_autores.ID_Autor

USANDO ALIASES 
select L.Nome_Livro, E.Nome_Editora
from tbl_Livro as L
inner join tbl_editoras as E
on L.ID_editora = E.ID_editoras

/* OUTER JOIN */
SELECT COLUNA
FROM TABELA_ESQ
LEFT (OUTER) JOIN TABELA_DIR
ON TABELA_ESQ.COLUNA = TABELA_DIR.COLUNA

select * from tbl_Livro
inner join tbl_autores
on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

insert into tbl_Livro(Nome_Livro, ISBN,Data_Pub, Preco_Livro,
 ID_Autor, ID_editora) VALUES ('NMAP Cookbook',
  21236542, '20070618', 28.98, 3, 1)
go

insert into tbl_Livro(Nome_Livro, ISBN,Data_Pub, Preco_Livro,
ID_Autor, ID_editora) VALUES ('PHP Programing',
  27856542, '20120413', 71.95, 4, 3)
 go

/* full join */
select colunas
from tabela1
full (outer) join tabela2
on tabela1.coluna = tabela2.colunas

select Li.Nome_Livro, Li.ID_Autor, Au.Nome_Autor
from tbl_Livro as Li
full join tbl_autores as Au
on Li.ID_Autor = Au.ID_Autor

select Li.Nome_Livro, Li.ID_Autor, Au.Nome_Autor
from tbl_Livro as Li
full join tbl_autores as Au
on Li.ID_Autor = Au.ID_Autor
where Li.ID_Autor is null
or Au.ID_Autor is null

/* FUNÇÃO IN E NOT IN */
--EXPRESSÃO_TESTE (NOT) IN (SUBCONSULTA| LISTA)

select * from tbl_Livro
where ID_Autor in (1, 2)
go

select * from tbl_Livro
where ID_Autor not in (1, 2)
go

/* CAMPOS CALCULADOS */
create table Produtos (codProduto smallint,
 NomeProduto varchar(20), Preco money, Quant smallint,
 Total as (Preco * Quant)
 )
go

select * from Produtos

insert into Produtos values (1, 'Mouse', 15.00, 2)
insert into Produtos values (2, 'Teclado', 18.00, 1)
insert into Produtos values (3, 'Fones', 25.00, 1)
insert into Produtos values (4, 'Pendrive', 25.00, 3)
insert into Produtos values (5, 'SD Card', 29.00, 2)
insert into Produtos values (6, 'DVD-R', 1.30, 12)

select sum(total) from Produtos

/* ÍNDICES */
create index
-- apenas crie índices em tabelas que recebem muitas consultas

crete index nome_índice
on nome_tabela (nome_coluna)

create index indice_nome_livro
on tbl_Livro (Nome_Livro)

select indice_nome_livro from 
where Nome_Livro ='Fedora and Red Hat Linux'

/* RULE */
--permite especificar determinados parâmetros, limitar faixas
--de valores em colunas ou valores inválidos

CREATE RULE nome_regra as parâmetros

create rule rl_preco as @VALOR > 10.00

execute sp_bindrule rl_preco, 'tbl_Livro.Preco_Livro'

update tbl_Livro
set Preco_Livro = 50.00
where Id_Livro = 105.00

update tbl_Livro
set Preco_Livro = 9.90
where Id_Livro = 101

/* BACKUP */

/* CONCATENAÇÃO DE STRINS */
--JUNTAR TEXTOS COM STRINGS
STRING1 | COLUNA + STRING2 | COLUNA
select 'Alexandre' + 'do Alphaville'as 'Dep_Tequinico'

select Nome_Autor + ' '+ SobreNome_Autor as 'Dep_Tecnico' 
from tbl_autores
 
 /* CLAUSULÁ WITH TIES */
SELECT NOME_TIME, Pontos
from tbl_times
--EXIBE A TABELA DO CAMPEONATO

SELECT TOP(3) NOME_TIME, Pontos
from tbl_times
ORDER BY Pontos Desc
--EXIBE OS 3 PRIMEIROS EM ORDEM DESCENDENTE

SELECT TOP(3) WITH TIES NOME_TIME, Pontos
from tbl_times
ORDER BY Pontos Desc
--EXIBE OS PRIMEIROS QUE TIVEREM A MESMA PONTUAÇÃO 
--EM ORDEM DESCENDENTE

/* VIEWS */
--SÃO EXIBIÇÕES EM UMA TABELA VIRTUAL BASEADA EM UMA CONSULTA
--PODENDO SER SALVA PARA OUTRAS CONSULTAS
CREATE VIEW [NOME EXIBIÇÃO]
AS SELECT COLUNAS
FROM TABELA
WHERE CONDIÇÕES

create view vw_LivrosAutores
as select tbl_Livro.Nome_Livro as Livro,
tbl_autores.Nome_Autor as Autor
from tbl_Livro
inner join tbl_autores
on tbl_Livro.ID_Autor = tbl_autores.ID_Autor
--APÓS CRIADA A VIEW, USASSE O COMANDO DE EXIBIÇÃO

select Livro, Autor
from vw_LivrosAutores
--where Livro like 'S%'

/* para alterar uma exibição usamos o comando ALTER*/
alter view vw_LivrosAutores
as select tbl_Livro.Nome_Livro as Livro,
tbl_autores.Nome_Autor as Autor,
Preco_Livro as Valor
from tbl_Livro
inner join tbl_autores
on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

select Livro, Autor
from vw_LivrosAutores
--where Livro like 'S%'

select * from vw_LivrosAutores

/* PARA EXCLUSÃO*/
DROP VIEW vw_LivrosAutores

/* subconsultas */
select(select 'Fábio') as Subconsulta;

SELECT A.CARRO,
SUM((SELECT TOP 1 VALOR FROM tab2 B WHERE B.DATA <= A.DATA )) VALOR
FROM tab1 A
GROUP BY A.CARRO

/* cte common table expression / expressão de tabela comum */
with CadaCarro as (
SELECT A.CARRO,
       (SELECT top (1) B.VALOR 
          from tab2 as B 
          where B.DATA <= A.DATA 
          order by B.DATA desc) as VALOR
  from tab1 as A
)
SELECT CARRO, sum(VALOR) as somaVALOR
  from CadaCarro
  group by CARRO;

 /* variáveis */
 -- podem ser declaradas no corpo de um batch ou procedimento,
 -- podendo atribuir valores usando-se declarações set ou select 
 --as variáveis são inicializadas por padrão com null 
declare @nome_var tipo

ex:
declare @valor int,
        @texto varchar(40),
        @data_nasc date,
        @nada money

--para atribuir valores as variáveis com set
set nome_var = valor_var

ex:
declare @valor int,
        @texto varchar(40),
        @data_nasc date,
        @nada money
set @valor = 50
set @texto = 'Bóson'
set @data_nasc = getdate()

--exibir os valores(consultas)
--select nomes_var as aliases

declare @valor int,
        @texto varchar(40),
        @data_nasc date,
        @nada money
set @valor = 50
set @texto = 'Bóson'
set @data_nasc = getdate()
select @valor as Valor, @texto as Texto,
@data_nasc as 'Data de nascimento',
@nada as Salário

/* atribuir valor com select */
select nome_var = coluna from tabela
where condição
select nome_var as alias

ex:
declare @livro varchar(30)
select @livro = nome_livro
from tbl_Livro
where Id_Livro = 101
select @livro as 'Nome do Livro'

declare @preco money, @quantidade int, @nome varchar(30)
set @quantidade = 5

select @preco = Preco_Livro, @nome = Nome_Livro
from tbl_Livro
where Id_Livro = 101

select @nome as 'Nome do Livro',
@preco * @quantidade as 'Preço dos Livros'

/* conversão de dados */
cast
convert
-- converte expressões de um tipo de dados em outro usando
-- essas expressoes

cast(expressão as novo_tipo_dados)

ex:
select 'O preço do livro' + Nome_Livro + 'é de R$' + 
cast(Preco_Livro as varchar(6)) as item from tbl_Livro
where ID_Autor = 2

convert(novo_tipo_dados, expressão, estilo)
select 'O preço do livro ' + Nome_Livro + 'é de R$' + 
convert(varchar(6), Preco_Livro ) as item 
from tbl_Livro

/* CONDICIONAIS IF / ELSE */
IF CONDIÇÃO
    DECLARAÇÃO

IF CONDIÇÃO
    DECLARAÇÃO
ELSE
    DECLARAÇÃO

IF CONDIÇÃO
    BEGIN
        BLOCO DE CÓDIGOS
    END;

EX:
Declare @numero int,
        @texto varchar(10)

set @numero = 20
set @texto = 'Fábio'

if @numero = 20
    select 'Número correto!'
if @texto = 'Fábio'
    begin
        set @numero = 30
        select @numero
    end;
else
    begin
        set @numero = 40
        select 'Número incorreto!'
    end;

/* while */
while condição
    begin
        bloco de CÓDIGOS
    end;

ex:
declare @valor int
set @valor = 0

while @valor <10
    begin
        print 'Número: '+ cast(@valor as varchar(2))
        set @valor = @valor +1
    end;

declare @codigo int
set @codigo = 100

while @codigo <106
    begin
        select Id_Livro as ID, Nome_Livro as Livro,
        Preco_Livro as Preço
        from tbl_Livro
        where Id_Livro = @codigo
        set @codigo = @codigo+ 1
    end;

/* STORE PROCEDURES */
--SÃO LOTES (BATCHES) DE DECLARAÇÕES SQL QUE PODEM SER EXECUTADOS
-- COMO UMA SUBROTINA

create procedure nome_Procedimento
    (@parâmetro tipo_dados)
as 
    bloco de CÓDIGOS

create procedure teste
as
select 'Bóson Treinamentos' as Nome_Livro

--para executar:
exec(ute) teste

create procedure p_LivroValor
as
select Nome_Livro, Preco_Livro
from tbl_Livro

exec p_LivroValor

/* VISUALIZAR CONTEÚDO DE PROCEDURES ARMAZENADAS */
EX:
exec sp_helptext nome_Procedimento

exec sp_helptext p_LivroValor

/* CRIPTOGRAFAR STORE PROCEDURE */
create procedure p_LivroISBN
with encryption
as
select Nome_Livro, ISBN
from tbl_Livro

/* ALTER PROCEDURE */
alter procedure nome_procedimento
bloco de código da sp

alter procedure teste
(@par1 as int)
as
select @par1

exec teste 25

alter procedure p_LivroValor
(@ID smallint)
as
select Nome_Livro as Livro, Preco_Livro as Preço
from tbl_Livro
where Id_Livro = @ID

exec p_LivroValor 104

/* PROCEDURE PARÂMETROS DE ENTRADA E INSERT */
alter procedure p_LivroValor
(@ID smallint, @Preço money)
as
select Nome_Livro as Livro, Preco_Livro as Preço
from tbl_Livro
where Id_Livro > @ID and Preco_Livro > @Preço

exec p_LivroValor @ID = 103, @Preço = 60

alter procedure p_LivroValor
(@Quantidade smallint, @ID smallint)
as
select Nome_Livro as Livro, Preco_Livro * @Quantidade as Preço
from tbl_Livro
where Id_Livro = @ID 

exec p_LivroValor @ID = 103, @Quantidade = 10

/* PRECEDURE PARA INSERIR DADOS */
EX:
create procedure p_insere_editora(
@nome varchar(50))
as
insert into tbl_editoras (nome_editora)
values (@nome)

exec p_insere_editora @nome = 'Apress'

exec p_insere_editora @nome = 'Alpha Books'

exec p_insere_editora @nome = 'Companhia das Letras'

exec p_insere_editora @nome = 'Ediouro'

/* PARÂMETROS COM VALOR PADRÃO */
create procedure p_teste_valor_padrão(
@param1 int, 
@param2 varchar(20)= 'Valor Padrão!')
as
select 'Valor de parâmetro 1: ' + cast(@param1 as varchar)
select 'Valor de parâmetro 2: ' + @param2 

exec p_teste_valor_padrão 30

exec p_teste_valor_padrão @param1 = 40,
@param2 = 'valor foi modificado'

/* PARÂMETROS DE SAÍDA */
--PALAVRA CHAVE OUTPUT

alter procedure teste (@par1 as int output)
as select @par1 * 2
return

declare @valor as int = 15
exec teste @valor output
print @valor

/* COMANDO RETURN - TERMINA INCONDICIONALMENTE O PROCEDIMENTO
E RETORNA UM VALOR INTEIRO AO CHAMADOR
PODE SER USADO PARA RETORNAR STATUS DE SUCESSO OU FALHA
DO PROCEDIMENTO */
alter procedure p_LivroValor (
@Quantidade smallint, @Cod smallint = -10,
@ID smallint)
as
--set nocount on(não executa a contagem de linha)
if @ID >= 100
    begin
        select Nome_Livro as Livro, Preco_Livro * @Quantidade as
        Preço
        from tbl_Livro
        where Id_Livro = @ID
        return 1
    end
else
    return @Cod

declare @Codigo int 
exec @Codigo = p_LivroValor @ID = 102, @Quantidade = 5
print @Codigo

/* UDF FUNÇÕES DEFINIDAS PELO USUÁRIO 
CRIA FUNÇÕES DIVERSAS */
create function nome_função (parâmetros)
returns tipo_dados_retorno
as 
begins
    blocos de códigos
    return expressão_retorno
end

create function nota_media (@nome varchar(30))
returns real
as 
begins
    declare @media = (nota1 + nota2 + nota3 + nota4)/ 4
    from tbl_alunos
    where Nome_aluno = @nome
    return @media
end

select dbo.nota_media

/* FUNÇÕES DEFINIDAS PELO USUÁRIO COM VALOR DE
 TABELA EMBUTINA (INLINE) */
 create function nome_função(parâmetros)
    returns table 
    as 
    return(DECLARAÇÃO_select)

create function retorna_itens (@valor real)
returns table
as
return (
    select L.Nome_Livro, A.Nome_Autor, E.Nome_Editora
    from tbl_Livro as L
    inner join tbl_autores as A
    on L.ID_Autor = A.ID_Autor
    inner join tbl_editoras as E
    on L.ID_editora = E.ID_editoras
    where L.Preco_Livro > @valor)

select Nome_Livro, Nome_Autor
from retorna_itens (62.00)

/* FUNÇÕES DEFINIDAS PELO USUÁRIO COM VALOR DE
 TABELA COM VÁRIAS INSTRUÇÕES */
-- RETORNA UM RESULTSET
create function multi_tabela ()
returns @valores table
    (Nome_Livro varchar(50),
        Data_Pub datetime, Nome_Editora varchar(50),
        Preco_Livro money)
as
begin
insert @valores (Nome_Livro, Data_Pub, nome_editora, Preco_Livro)
    select L.Nome_Livro, L.Data_Pub, E.Nome_Editora, L.Preco_Livro
    from tbl_Livro as L
    inner join tbl_editoras as E
    on L.ID_editora = E.ID_editoras
return
end

select * from multi_tabela()

/* TRIGGER (GATILHO) É UM TIPO ESPECIAL DE PROCEDURE QUE É
REALIZADA UMA OPERAÇÃO DE MODIFICAÇÃO DE DADOS, AS OPERAÇÕES SÃO:
INSERT, UPDATE E DELETE */
--AFTER -O CÓDIGO PRESENTE É EXECUTADO APÓS TODAS AS AÇÕES TEREM SIDO
--COMPLETADAS
--INSTEAD OF- O CÓDIGO PRESENTE NO TRIGGER É EXECUTADO NO LUGAR
--DA OPERAÇÃO QUE CAUSOU SEU DISPARO

|CARACTERÍSTICAS | INSTEAD OF              | AFTER               |
declaração DML   |simulada não executada   |executada ou revertida
timing           |antes constraints PK FK  |executada antes commit
nº eventos       | UM                      | múltiplos
aplicável em View| sim                     | não

create trigger Nome_trigger
on tabela | view
[with encryption]
after | instead of
[insert, update, delete]
as
código do trigger

/* CRIAR UM TRIGGER AFTER */
create trigger teste_trigger_after
on tbl_editoras
after insert
as
print 'Olá Mundo!'

insert into tbl_editoras values ('Editora10')

create trigger trigger_after
on tbl_editoras
after insert
as
insert into tbl_autores values(25, 'José', 'da Silva')
insert into tbl_Livro values('Livro1', '123456000', '20001010',
 77, 25, 2)   

drop trigger teste_trigger_after

insert into tbl_editoras values ('Editora11')

/* CRIANDO TRIGGER INSTEAD */

create trigger trigger_after
on tbl_autores
instead of insert
as
print 'Olá de novo! Não inseri o registro desda vez!';

/* DESABILITAR UM TRIGGER */
ALTER TABLE tbl_editoras
disable trigger trigger_after

/* verifica a existência de um trigger */
-- na tabela específica 
exec sp_helptrigger @tabname = tbl_editoras

--no banco de dados todo
use db_Biblioteca
select *
from sys.triggers
where is disable = 0

0= triggers desabilitados; 1= triggers habilitados

/* determinando as colunas atualizadas */
create trigger trigger_after_autores
on tbl_autores
after insert, update
as
if update(Nome_Autor)
    begin
        print 'O nome do autor foi alterado'
    end
else
    begin
        print 'Nome não foi modificado'
    end

update tbl_autores
    set Nome_Autor = 'João'
    where ID_Autor = 10

/* TRIGGER RECURSIVO aninhamento de triggers DML */
--um trigger dispara outro
create table tbl_trigger_recursivo
(codigo int primary key)

--primeiro ligando os triggers recursivos
alter database db_Biblioteca
set recursive_triggers on

create table tbl_trigger_recursivo (
Codigo Int primary key)

select Codigo from tbl_trigger_recursivo

create trigger trigger_rec on tbl_trigger_recursivo
after insert
as
declare @cod int
select
@cod = Max(Codigo)
from teste_trigger
if @cod<10
    begin
        insert into tbl_trigger_recursivo select Max(Codigo)
         + 1 from
tbl_trigger_recursivo
    end
else
    begin
        print 'Trigger Recursivo Finalizado'
    end

insert into tbl_trigger_recursivo values(1)

/* RENOMEAR TABELA OU COLUNA  */
SP_RENAME

select * from sys.tables 

select * from tbl_Livro

sp_rename 'Nometabela.NomeAtualColuna', 
'NovoNomeColuna', 'column';

sp_rename 'tbl_Livro.Nome_Livro', 
'Livro', 'column';

sp_rename 'tbl_Livro.Livro', 
'Nome_Livro', 'column';

/* O TIPO DE DADO TIME NO SQL SERVER DEFINE UM HORÁRIO
NO DIA BASEADO EM UM RELÓGIO DE 24 HORAS (0 A 23) */
SINTAXE:
nome_coluna Time[(frações de segundo)]

/* FORMATO LITERAL DE UM VALOR TIME:
HH:MM:SS[.NNNNNNN] */

