/* Modelagem Básica MySQL Cliente - 
ENTIDADE = TABELA 
CAMPOS = ATRIBUTOS */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECOO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM 

FASE 01 E 02 => AD (ADMINISTRADOR DE DADOS) NA MODELAGEM CONCEITUAL E LÓGICA

MODELAGEM CONCEITUAL - RASCUNHO 
MODELAGEM LÓGICA - WORKBENCH , BRMODELO , STARUML

FASE 03 - DBA (ADMINISTRADOR DE BANCO DE DADOS [SCRIPT]) / AD
MODELAGEM FÍSICA - SCRIPTS DE BANCO

*/
/* CRIANDO O BANCO DE DADOS */
CREATE DATABASE PROJETO;

CREATE DATABASE EXEMPLO;

/* CONECTENDO-SE AO BANCO */
USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);
/* 
 BIG DATA (BG) TRABALHA COM DADOS COMPLEXOS E NÃO ESTRUTURADOS
 ADMINISTRAÇÃO DE DADOS (AD) CUIDA DOS DADOS
 ADMINISTRAÇÃO DE BASE DE DADOS (DBA)CUIDA DA INFRAESTRUTURA DO BANCO
 TUNNING (TN) CUIDA DA OTIMIZAÇÃO DO BANCO
 BUSINESS INTELLIGENCE (BI) ANALISA O OCORRIDO NO PASSADO]
 DATA SCIENCE (DS) ANALISA O QUE PODE OCORRER NO FUTURO
 MINERAÇÃO DE DADOS (MD) LIGADO A DATA SCIENCE */
 
/* AMOSTRAR A DATABASE VIGENTE */
STATUS
 
 /* VERIFICANDO AS TABELAS DO BANCO */
SHOW TABLES; 

/* AMOSTRAS TODOS OS DATABASES */
SHOW DATABASES;

/* SINTAXE BÁSICA DE INSERÇÃO - INSERT INTO TABELA... */
/* FORMA 01 - OMITINDO AS COLUNAS */
INSERT INTO CLIENTE VALUES('JOAO', 'M', 'JOAO@GMAIL.COM', 988638273, '22923110', 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

/* FORMA 02 - DESCREVENDO AS COLUNAS - MELHOR FORMA */
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES('LILIAN', 'F', 'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '947785696', 887774856);

INSERT INTO CLIENTE(NOME, SEXO, EMAIL, ENDERECO, TELEFONE, CPF) VALUES('JOAO', 'M', 'JOAO@GMAIL.COM', 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ', '22923110', 988638273),
('JORGE', 'M', NULL, 'OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG', '58748895', 885755896);

INSERT INTO CLIENTE(NOME, SEXO, EMAIL, ENDERECO, TELEFONE, CPF) VALUES('CELIA', 'F', 'CELIA@GMAIL.COM', 'RIACHUELO - CENTRO - RIO DE JANEIRO - RJ', '25078869', 541521456);

 /* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */
 INSERT INTO CLIENTE VALUES('ANA', 'F', 'ANAGLOBO.COM', 85548962, '548556985', 'PRES. ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
 ('CARLA', 'F', 'CARLA@TERATI.COM.BR', 7745828, '66587458', 'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
 
 /* NÃO PODE SER ACEITO O CPF POR CONTA DO TAMANHO MÁXIMO DA VARIÁVEL INT(11) INT ou inteiro	4 bytes	(-2 147 483 648,2 147 483 647) */
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES('CLARA', 'F', 'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '883665843', 99999999999);

/* O COMANDO SELECT
SELEÇÃO PROJEÇÃO E JUNÇÃO
*/
SELECT NOW(); /*DATA PRESENTE*/
SELECT NOW() AS DATA_HORA; /* DATA E HORA COMO DADO NUMA TABELA*/
SELECT NOW() AS DATA_HORA, 'FELIPE MAFRA' AS PROFESSOR; /* DATA E HORA COMO DADO E FELIPE MAFRA COMO PROFESSOR NUMA TABELA */

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;

/* NÃO USE A QUERY
 SELECT * FROM CLIENTE;
 PORQUE AUMENTA A CARGA DE PROCESSAMENTO DO SISTEMA E DE REDE */
 
 /* FILTRANDO DADOS DE BUSCA */
 SELECT NOME, SEXO FROM CLIENTE
 WHERE SEXO = 'F';
 
 SELECT NOME, ENDERECO FROM CLIENTE
 WHERE SEXO = 'M';
 
 SELECT NOME, SEXO FROM CLIENTE
 WHERE ENDERECO = 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ';
 
 /* BUSCA VAZIA PORQUE  O CAMPO ENDEREÇO ESTÁ INCOMPLETO */
 SELECT NOME, SEXO FROM CLIENTE
 WHERE ENDERECO = 'RJ';
 
 /* UTILIZANDO LIKE COM BUSCA VAZIA PORQUE O CAMPO ENDEREÇO ESTÁ INCOMPLETO */
 SELECT NOME , SEXO FROM CLIENTE
 WHERE ENDERECO LIKE 'RJ';
 
 /* CARACTERE CORINGA % -> QUALQUER COISA SEMELHANTE ASTERÍSTICO - %XXX OU XXXX% OU %XXX% */
 SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE ='%RJ';
 
 /* SELECT VARIADOS COM FILTROS DE BUSCA */
 SELECT * FROM LIVROS;

SELECT NOME_LIVRO, NOME_EDIT FROM LIVROS;

SELECT NOME_LIVRO, UF_EDIT FROM LIVROS WHERE SEXO_AUTOR = 'MASCULINO';

SELECT NOME_LIVRO, NUM_PAG FROM LIVROS WHERE SEXO_AUTOR = 'FEMININO';

SELECT VALOR_LIVRO FROM LIVROS WHERE UF_EDIT ='SP';

SELECT NOME_AUTOR, SEXO_AUTOR, UF_EDIT FROM LIVROS WHERE UF_EDIT ='RJ' OR UF_EDIT='SP';

/* TABELA VERDADE E OPERADORES LÓGICOS */

	+---+---+--------+--------+
	 A	| B | A OR B | A AND B
	 V	| V |   V    |    V
	 V  | F |   V    |    F
	 F  | V |   V    |    F
	 F  | F |   F    |    F

/* OR -> PARA QUE A SAÍDA DA QUERY SEJA VERDADEIRA, BASTA QUE UMA CONDIÇÃO SEJA VERDADE
AND -> PARA QUE A SAÍDA DA QUERY SEJA VERDADEIRA TODAS */

SHOW TABLES;

SELECT * FROM CLIENTE;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO ='M' OR ENDERECO LIKE '%RJ';
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO ='M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO ='F' OR ENDERECO LIKE '%ESTACIO'; 
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' OR ENDERECO = '%RIO DE JANEIRO';

/* FUNÇÕES DE AGREGAÇÃO PERFORMANCE EM OPERADORES LÓGICOS */
/* CONTANDO OS REGISTROS DE UMA TABELA */
SELECT COUNT(*) FROM CLIENTE;

SELECT COUNT(*) AS "QUANT. DE REG. DA TABELA CLIENTE" FROM CLIENTE;

/* OPERADOR GROUP BY */
SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO;

/* SITUAÇÃO - TRATANDO COM OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO */

/* trazendo resultados 
  primeiro quantos funcionarios tem */
  select count(*) from funcionarios;
  
   select nome from funcionarios where departamento= 'Roupas' or 'Filmes';
  
  /* trazendo funcionarios ou campos de funcionarios de determinado sexo em determinado setores */
  select * from funcionarios where (departamento= 'Lar' and sexo = 'Feminino') or (departamento= 'Filmes' and sexo = 'Feminino');
  select nome, email from funcionarios where (departamento= 'Lar' and sexo = 'Feminino') or (departamento= 'Filmes' and sexo = 'Feminino');
  
  select nome from funcionarios where sexo =  'masculino' or departamento= 'Jardim';
  select nome from funcionarios where sexo =  'masculino' and departamento= 'Jardim';
  
  /* trazendo resultados 
  primeiro quantos funcionarios tem */
  select count(*) from funcionarios;
  
  /* contagem de funcionarios por sexo */
  select count(*), sexo from funcionarios group by sexo;
  
  /* trazendo quantos funcionarios trabalham por departamento agrupados */
  select count(*), departamento from funcionarios group by departamento;
  
  /* trazendo quantos funcionarios trabalham por departamento agrupados ordenando por quantidade */
  select count(*), departamento from funcionarios group by departamento order by 1;
  
  /* trazendo quantos funcionarios trabalham por quais especificos departamentos agrupados  */
  select * from funcionarios where departamento= 'roupas' or departamento= 'filmes';
  
  /* recordando basicos */
  show databases;
  use projeto;
  show tables;
  select * from cliente;
  
  /* filtragem valores nulos */
select nome, sexo, endereco from cliente where email is null;

select nome, sexo, endereco from cliente where email is not null;

/* utilizando o update para atualizar valores */

select * from cliente where nome = 'lilian';

update cliente
set email = 'joao@ig.com.br'
where nome = 'joao';

update cliente
set email = 'lilian@hotmail.com'
where nome = 'lilian';

update cliente
set email = 'jorge@ig.com.br'
where nome = 'jorge';

/* deletando registros com a clausula delete */
delete from cliente; /* apaga a tabela toda */

select count(*) from cliente;

select count(*) from cliente
where nome = 'ana';

delete from cliente
where nome = 'ana';

select count(*) from cliente;

select 6-1;

insert into cliente values('CARLA', 'F', 'c.lopes@uol.com', 45638854, '4575-0048', 'COPPER LEAF - WILLIAMSBURG - KITCHENER');

select * from cliente where nome = 'ana';

delete from cliente
where nome = 'carla'
and email = 'CARLA@TERATI.COM.BR';

/* começando a modelagem - PRIMEIRA FORMA NORMAL */

select sexo, count(*) as QUANTIDADE
from cliente
group by sexo;

/*PRIMEIRA FORMA NORMAL */

/* 1- TODO CAMPO VETORIZADO SE TORNARÁ UMA TABELA 
VETORES [ AMARELO, AZUL, LARANJA]
[ KA, FIESTA, UNO]

2- TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA QUANDO O CAMPO FOR DIVISÍVEL
EXEMPLO -> VETORES SÃO ELEMENTOS DE MESMA FAMÍLIA COMO TELEFONES DE CONTATO PODEM SER CELULAR E FIXO, MAS, 
RUA, BAIRRO, CIDADE E ESTADO SÃO ELEMENTOS DIFERENTES APESAR DE SEREM COMPLEMENTOS DE ENDEREÇO.

3- TODA A TABELA PRECISA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODO O REGISTRO COMO SENDO ÚNICO.
ISSO É O QUE CHAMAMOS DE CHAVE PRIMÁRIA OU PRIMARY KEY.

*NÃO É ACONSELHÁVEL USAR NÚMERO DE DOCUMENTO COMO PRIMARY KEY
*ACONSELHÁVEL CRIAR UMA CHAVE DO TIPO IDENTIFIED
*AS CHAVES PODEM SER ARTIFICIAIS OU NATURAIS
NATURAIS SÃO CRIADAS PELO BD E AS ARTIFICIAIS SÃO CRIADAS INSTANTÂNEAMENTE
*/

/* CARDINALIDADE */

/* TEMOS NA MODELAGEM ENTIDADES E RELAÇÃO
CARDINALIDADE E OBRIGATORIEDADE
QUEM DEFINE OS VALORES DE CARDINALIDADE SÃO AS REGRAS DE NEGÓCIO
O 1º ESTÁ RELACIONADO COM OBRIGATORIEDADE E O SEGUNDO COM CARDINALIDADE, SE O 1º ALGARISMO FOR ZERO ENTÃO É FALSO E SE FOR 1 É VERDADEIRA A OBRIGATORIEDADE.
QUANDO NÃO TEM OBRIGATORIEDADE O VALOR É 1, 
QUANDO HÁ A OBRIGATORIEDADE QUE É O VALOR MÍNIMO,A CARDINALIDADE DEFINE O VALOR MÁXIMO
(0,n) 
(0,1)
(1/n)
(1/1)

APÓS A MODELAGEM LÓGICA NO BRMODELO OU STARUML PASSAMOS A CRIAÇÃO COM NOTEPAD++ E SQLCODE */

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50)UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* CHAVES ESTRANGEIRAS FOREIGN KEY (FK) 
É A CHAVE PRIMÁRIIA DE UMA TABELA QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERÊNCIA ENTRE REGISTROS */

/* EM RELACIONAMENTO 1 X1 A CHAVE ESTRANGEIRA FICA NA  TABELA MAIS FRACA 
EM RELACIONAMENTOS 1 X N A CHAVE ESTRANGEIRA FICARÁ SEMPRE NA CARDINALIDADE N */

/* PARA DELETAR TABELAS */
DROP TABLE CLIENTE;
DROP TABLE ENDERECO;
DROP TABLE TELEFONE;

/* DESCRIÇÃO DOS CAMPOS DE UMA TABELA */
DESC CLIENTE;

INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAOA@IG.COM', '07656787887');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'CARLOS@IG.COM', '54336227984');
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ANA@IG.COM', '16470087782');
INSERT INTO CLIENTE VALUES(NULL, 'CLARA', 'F', NULL, '4080542314');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'JORGE@IG.COM', '97220083272');
INSERT INTO CLIENTE VALUES(NULL, 'CELIA', 'M', 'CELIA@IG.COM', '  24642473419');

update cliente
set CPF = '24642473419'
where nome = 'CELIA';

DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG',4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'CENTRO', 'RIO DE JANEIRO', 'RJ',1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP',3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'ESTACIO', 'RIO DE JANEIRO', 'RJ',2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DO OUVIDOR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ',6);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URUGUAIANA', 'CENTRO', 'VITORIA', 'ES',5);

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '928035505', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '910161634', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '987526289', 1);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '993130091', 2);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '927165536', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '992532854', 3);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '987633825', 3);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '993894783', 1);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '938426623', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '964700608', 2);

/* SELEÇÃO , PROJEÇÃO, E JUNÇÃO

PROJEÇÃO -> É TUDO O QUE VC QUER VER NA TELA */
SELECT NOW() AS DATA_ATUAL;

SELECT 3 + 3 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
  FROM CLIENTE;

/* SELEÇÃO --> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELEÇÃO É O WHERE */

SELECT NOME, SEXO, EMAIL /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELEÇÃO */

SELECT NUMERO /* PROJEÇÃO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELEÇÃO */

/* junção -> join */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;


+--------+---------------+-----------+
| NOME   | EMAIL         | IDCLIENTE |
+--------+---------------+-----------+
| JOAO   | JOAOA@IG.COM  |         1 |
| CARLOS | CARLOS@IG.COM |         2 |
| ANA    | ANA@IG.COM    |         3 |
| CLARA  | NULL          |         4 |
| JORGE  | JORGE@IG.COM  |         5 |
| CELIA  | CELIA@IG.COM  |         6 |
+--------+---------------+-----------+

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* BUSCAR NOME , SEXO, BAIXO, CIDADE */

SELECT NOME , SEXO, BAIRRO, CIDADE
FROM CLIENTE
WHERE IDCLIENTE = ID_CLIENTE;

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;
+--------+---------------+-----------+
    -> | NOME   | EMAIL         | IDCLIENTE |
    -> +--------+---------------+-----------+
    -> | JOAO   | JOAOA@IG.COM  |         1 |
    -> | CARLOS | CARLOS@IG.COM |         2 |
    -> | ANA    | ANA@IG.COM    |         3 |
    -> | CLARA  | NULL          |         4 |
    -> | JORGE  | JORGE@IG.COM  |         5 |
    -> | CELIA  | CELIA@IG.COM  |         6 |
    -> +--------+---------------+-----------+

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';
+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

/* ESTA ACIMA FOI UMA QUERY COMPLETA COM PROJEÇÃO ORIGEM JUNÇÃO SELEÇÃO */

/* OUTRO EXEMPLO */
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;
+--------+------+---------------+------+-----------+
| NOME   | SEXO | EMAIL         | TIPO | NUMERO    |
+--------+------+---------------+------+-----------+
| JOAO   | M    | JOAOA@IG.COM  | CEL  | 987526289 |
| JOAO   | M    | JOAOA@IG.COM  | RES  | 927165536 |
| JOAO   | M    | JOAOA@IG.COM  | COM  | 993894783 |
| CARLOS | M    | CARLOS@IG.COM | COM  | 993130091 |
| CARLOS | M    | CARLOS@IG.COM | CEL  | 964700608 |
| ANA    | F    | ANA@IG.COM    | CEL  | 992532854 |
| ANA    | F    | ANA@IG.COM    | CEL  | 987633825 |
| JORGE  | M    | JORGE@IG.COM  | CEL  | 928035505 |
| JORGE  | M    | JORGE@IG.COM  | RES  | 910161634 |
| JORGE  | M    | JORGE@IG.COM  | RES  | 938426623 |
+--------+------+---------------+------+-----------+

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */
SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO 
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+-----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO    |
+--------+------+---------+----------------+------+-----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 987526289 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 927165536 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 993894783 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 993130091 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 964700608 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 992532854 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 987633825 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 928035505 |
| JORGE   M     | CENTRO  | VITORIA        | RES  | 910161634 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 938426623 |
+--------+------+---------+----------------+------+-----------+

/* MACETE DE EDIÇÃO RÁPIDA E SIMULTÂNEA -> APERTANDO CTRL E CLICANDO EM CADA UNIDADE
 DA PALAVRA DESEJADA É POSSÍVEL EDITAR TODAS AO MESMO TEMPO */
SELECT NOME, SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO 
ON IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = TELEFONE.ID_CLIENTE;

/* USANDO O COMANDO ALIAS */ 
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* MANIPULAÇÃO DE DADOS
DML - DATA MANIPULATION LANGUAGE
DDL - DATA DEFINITION LANGUAGE
DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTROL LANGUAGE 
*/
/* INSERT */
INSERT INTO CLIENTE VALUES(NULL, 'PAULA', 'M', NULL, '77437493');
INSERT INTO ENDERECO VALUES(NULL, 'RUA JOAQUIM SILVA', 'ALVORADA', 'NITEROI', 'RJ', 7);

/* FILTROS */
SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* ATUALIZANDO DADOS */
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DDL - DATA DEFINITION LANGUAGE */

CREATE TABLE PRODUTO(
  IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
  NOME_PRODUTO VARCHAR(30) NOT NULL,
  PRECO INT,
  FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE 
ALTERANDO O NOME DE UMA COLUNA -  CHANGE */
ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY */
ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */
ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */
ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */
 ALTER TABLE PRODUTO
 ADD COLUMN PESO FLOAT(10,2) NOT NULL
 AFTER NOME_PRODUTO;

 /* ADICIONANDO UMA COLUNA NA PRIMEIRA POSIÇÃO */
  ALTER TABLE PRODUTO
  ADD COLUMN PESO FLOAT(10,2) NOT NULL
  FIRST;

/* EXERCICIOS SBDG COMERCIO

 RELATORIO GERAL DE TODOS OS CLIENTES

 RELATORIO DE HOMENS 

RELATORIO DE MULHERES 

 QUANTIDADE DE HOMENS E MULHERES 

IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NÃO TENHAM CELULAR 
DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

SELECT NOME, IDCLIENTE, SEXO, EMAIL
FROM CLIENTE;
+---------+-----------+------+-------------------+
| NOME    | IDCLIENTE | SEXO | EMAIL             |
+---------+-----------+------+-------------------+
| JOAO    |         1 | M    | JOAOA@IG.COM      |
| CARLOS  |         2 | M    | CARLOS@IG.COM     |
| ANA     |         3 | F    | ANA@IG.COM        |
| CLARA   |         4 | F    | NULL              |
| JORGE   |         5 | M    | JORGE@IG.COM      |
| CELIA   |         6 | M    | CELIA@IG.COM      |
| PAULA   |         7 | F    | NULL              |
| FLAVIO  |         8 | M    | FLAVIO@IG.COM     |
| ANDRE   |         9 | M    | ANDRE@GLOBO.COM   |
| GIOVANA |        10 | F    | NULL              |
| KARLA   |        11 | M    | KARLA@GMAIL.COM   |
| DANIELE |        12 | M    | DANIELE@GMAIL.COM |
| LORENA  |        13 | M    | NULL              |
| EDUARDO |        14 | M    | NULL              |
| ANTONIO |        15 | F    | ANTONIO@IG.COM    |
| ANTONIO |        16 | M    | ANTONIO@UOL.COM   |
| ELAINE  |        17 | M    | ELAINE@GLOBO.COM  |
| CARMEM  |        18 | M    | CARMEM@IG.COM     |
| ADRIANA |        19 | F    | ADRIANA@GMAIL.COM |
| JOICE   |        20 | F    | JOICE@GMAIL.COM   |
+---------+-----------+------+-------------------+

SELECT NOME, IDCLIENTE, SEXO, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';
+---------+-----------+------+------+-----------+
| NOME    | IDCLIENTE | SEXO | TIPO | NUMERO    |
+---------+-----------+------+------+-----------+
| ANA     |         3 | F    | CEL  | 992532854 |
| ANA     |         3 | F    | CEL  | 987633825 |
| ANTONIO |        15 | F    | CEL  | 89966809  |
| ADRIANA |        19 | F    | RES  | 77455786  |
| ADRIANA |        19 | F    | RES  | 89766554  |
| JOICE   |        20 | F    | RES  | 77755785  |
| JOICE   |        20 | F    | COM  | 44522578  |
+---------+-----------+------+------+-----------+

SELECT NOME, IDCLIENTE, SEXO
FROM CLIENTE
WHERE SEXO = 'F';
+---------+-----------+------+
| NOME    | IDCLIENTE | SEXO |
+---------+-----------+------+
| ANA     |         3 | F    |
| CLARA   |         4 | F    |
| PAULA   |         7 | F    |
| GIOVANA |        10 | F    |
| ANTONIO |        15 | F    |
| ADRIANA |        19 | F    |
| JOICE   |        20 | F    |
+---------+-----------+------+

SELECT NOME, IDCLIENTE, SEXO
FROM CLIENTE
WHERE SEXO = 'M';

+---------+-----------+------+
| NOME    | IDCLIENTE | SEXO |
+---------+-----------+------+
| JOAO    |         1 | M    |
| CARLOS  |         2 | M    |
| JORGE   |         5 | M    |
| CELIA   |         6 | M    |
| FLAVIO  |         8 | M    |
| ANDRE   |         9 | M    |
| KARLA   |        11 | M    |
| DANIELE |        12 | M    |
| LORENA  |        13 | M    |
| EDUARDO |        14 | M    |
| ANTONIO |        16 | M    |
| ELAINE  |        17 | M    |
| CARMEM  |        18 | M    |
+---------+-----------+------+

SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO;
+------+----------+
| SEXO | COUNT(*) |
+------+----------+
| M    |       13 |
| F    |        7 |
+------+----------+

SELECT IDCLIENTE, NOME, EMAIL, BAIRRO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO';
+-----------+---------+-------------------+--------+
| IDCLIENTE | NOME    | EMAIL             | BAIRRO |
+-----------+---------+-------------------+--------+
|         1 | JOAO    | JOAOA@IG.COM      | CENTRO |
|         8 | FLAVIO  | FLAVIO@IG.COM     | CENTRO |
|        11 | KARLA   | KARLA@GMAIL.COM   | CENTRO |
|        19 | ADRIANA | ADRIANA@GMAIL.COM | CENTRO |
|        20 | JOICE   | JOICE@GMAIL.COM   | CENTRO |
+-----------+---------+-------------------+--------+ */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO    |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+-----------+
|         5 | JORGE   | M    | JORGE@IG.COM      | 97220083272 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 928035505 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 97220083272 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 910161634 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 07656787887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 987526289 |
|         2 | CARLOS  | M    | CARLOS@IG.COM     | 54336227984 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 993130091 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 07656787887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 927165536 |
|         3 | ANA     | F    | ANA@IG.COM        | 16470087782 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 992532854 |
|         3 | ANA     | F    | ANA@IG.COM        | 16470087782 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 987633825 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 07656787887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 993894783 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 97220083272 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 938426623 |
|         2 | CARLOS  | M    | CARLOS@IG.COM     | 54336227984 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 964700608 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565  |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675  |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765  |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786  |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654  |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979  |
|        13 | LORENA  | M    | NULL              | 774557887   | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676  |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809  |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978  |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768  |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665  |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786  |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554  |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785  |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578  |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 44522680  |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+-----------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO    |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+-----------+
|         5 | JORGE   | M    | JORGE@IG.COM      | 97220083272 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 928035505 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 97220083272 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 910161634 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 07656787887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 987526289 |
|         2 | CARLOS  | M    | CARLOS@IG.COM     | 54336227984 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 993130091 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 07656787887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 927165536 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 07656787887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 993894783 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 97220083272 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 938426623 |
|         2 | CARLOS  | M    | CARLOS@IG.COM     | 54336227984 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 964700608 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565  |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675  |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765  |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786  |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654  |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979  |
|        13 | LORENA  | M    | NULL              | 774557887   | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676  |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978  |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768  |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665  |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 44522680  |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+-----------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';
+-----------+---------+------+-------------------+-------------+--------------------+---------+----------------+--------+------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO  | CIDADE         | ESTADO | TIPO | NUMERO    |
+-----------+---------+------+-------------------+-------------+--------------------+---------+----------------+--------+------+-----------+
|         3 | ANA     | F    | ANA@IG.COM        | 16470087782 | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     | CEL  | 992532854 |
|         3 | ANA     | F    | ANA@IG.COM        | 16470087782 | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     | CEL  | 987633825 |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CAPITAO ANTUNES | CENTRO  | CURITIBA       | PR     | CEL  | 89966809  |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       | CENTRO  | RIO DE JANEIRO | RJ     | RES  | 77455786  |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GERONIMO       | CENTRO  | RIO DE JANEIRO | RJ     | RES  | 89766554  |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO  | RIO DE JANEIRO | RJ     | RES  | 77755785  |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO  | RIO DE JANEIRO | RJ     | COM  | 44522578  |
+-----------+---------+------+-------------------+-------------+--------------------+---------+----------------+--------+------+-----------+

SELECT COUNT(*) AS QUANTIDADE, SEXO
FROM CLIENTE
GROUP BY SEXO;
+------------+------+
| QUANTIDADE | SEXO |
+------------+------+
|         13 | M    |
|          7 | F    |
+------------+------+

SELECT C.IDCLIENTE, C.NOME, C.EMAIL, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND (TIPO = 'RES' OR TIPO = 'COM');
+-----------+---------+-------------------+------+--------+----------------+------+----------+
| IDCLIENTE | NOME    | EMAIL             | SEXO | BAIRRO | CIDADE         | TIPO | NUMERO   |
+-----------+---------+-------------------+------+--------+----------------+------+----------+
|        11 | KARLA   | KARLA@GMAIL.COM   | F    | CENTRO | RIO DE JANEIRO | COM  | 55689654 |
|        19 | ADRIANA | ADRIANA@GMAIL.COM | F    | CENTRO | RIO DE JANEIRO | RES  | 77455786 |
|        19 | ADRIANA | ADRIANA@GMAIL.COM | F    | CENTRO | RIO DE JANEIRO | RES  | 89766554 |
|        20 | JOICE   | JOICE@GMAIL.COM   | F    | CENTRO | RIO DE JANEIRO | RES  | 77755785 |
|        20 | JOICE   | JOICE@GMAIL.COM   | F    | CENTRO | RIO DE JANEIRO | COM  | 44522578 |
+-----------+---------+-------------------+------+--------+----------------+------+----------+

SELECT NOME, SEXO , IDCLIENTE FROM CLIENTE;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 18;

/* FUNÇÃO IFNULL() ORACLE, SQL SERVER, POSTGRES ETC. */
/* CRIANDO UMA FUNÇÃO DE QUERY COM NOME, EMAIL, NUMERO, ESTADO */
SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
+---------+-------------------+--------+-----------+
| NOME    | EMAIL             | ESTADO | NUMERO    |
+---------+-------------------+--------+-----------+
| JOAO    | JOAOA@IG.COM      | RJ     | 987526289 |
| JOAO    | JOAOA@IG.COM      | RJ     | 927165536 |
| JOAO    | JOAOA@IG.COM      | RJ     | 993894783 |
| CARLOS  | CARLOS@IG.COM     | RJ     | 993130091 |
| CARLOS  | CARLOS@IG.COM     | RJ     | 964700608 |
| ANA     | ANA@IG.COM        | SP     | 992532854 |
| ANA     | ANA@IG.COM        | SP     | 987633825 |
| JORGE   | JORGE@IG.COM      | ES     | 928035505 |
| JORGE   | JORGE@IG.COM      | ES     | 910161634 |
| JORGE   | JORGE@IG.COM      | ES     | 938426623 |
| FLAVIO  | FLAVIO@IG.COM     | RJ     | 44522680  |
| ANDRE   | ANDRE@GLOBO.COM   | MG     | 68976565  |
| ANDRE   | ANDRE@GLOBO.COM   | MG     | 99656675  |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 33567765  |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88668786  |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 55689654  |
| DANIELE | DANIELE@GMAIL.COM | RJ     | 88687979  |
| LORENA  | NULL              | ES     | 88965676  |
| ANTONIO | ANTONIO@IG.COM    | PR     | 89966809  |
| ANTONIO | ANTONIO@UOL.COM   | SP     | 88679978  |
| ELAINE  | ELAINE@GLOBO.COM  | PR     | 99655768  |
| CARMEM  | CARMEM@IG.COM     | SP     | 89955665  |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77455786  |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 89766554  |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 77755785  |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578  |
+---------+-------------------+--------+-----------+

SELECT * FROM CLIENTE;

SELECT C.NOME, C.EMAIL, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;
+---------+-------------------+--------+
| NOME    | EMAIL             | ESTADO |
+---------+-------------------+--------+
| JOAO    | JOAOA@IG.COM      | RJ     |
| CARLOS  | CARLOS@IG.COM     | RJ     |
| ANA     | ANA@IG.COM        | SP     |
| CLARA   | NULL              | MG     |
| JORGE   | JORGE@IG.COM      | ES     |
| CELIA   | CELIA@IG.COM      | RJ     |
| PAULA   | NULL              | RJ     |
| FLAVIO  | FLAVIO@IG.COM     | RJ     |
| ANDRE   | ANDRE@GLOBO.COM   | MG     |
| GIOVANA | NULL              | RJ     |
| KARLA   | KARLA@GMAIL.COM   | RJ     |
| DANIELE | DANIELE@GMAIL.COM | RJ     |
| LORENA  | NULL              | ES     |
| EDUARDO | NULL              | RJ     |
| ANTONIO | ANTONIO@IG.COM    | PR     |
| ANTONIO | ANTONIO@UOL.COM   | SP     |
| ELAINE  | ELAINE@GLOBO.COM  | PR     |
| CARMEM  | CARMEM@IG.COM     | SP     |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     |
| JOICE   | JOICE@GMAIL.COM   | RJ     |
+---------+-------------------+--------+

SELECT C.NOME,
       IFNULL(C.EMAIL, 'NAO TEM EMAIL'),
       E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;
+---------+----------------------------------+--------+
| NOME    | IFNULL(C.EMAIL, 'NAO TEM EMAIL') | ESTADO |
+---------+----------------------------------+--------+
| JOAO    | JOAOA@IG.COM                     | RJ     |
| CARLOS  | CARLOS@IG.COM                    | RJ     |
| ANA     | ANA@IG.COM                       | SP     |
| CLARA   | NAO TEM EMAIL                    | MG     |
| JORGE   | JORGE@IG.COM                     | ES     |
| CELIA   | CELIA@IG.COM                     | RJ     |
| PAULA   | NAO TEM EMAIL                    | RJ     |
| FLAVIO  | FLAVIO@IG.COM                    | RJ     |
| ANDRE   | ANDRE@GLOBO.COM                  | MG     |
| GIOVANA | NAO TEM EMAIL                    | RJ     |
| KARLA   | KARLA@GMAIL.COM                  | RJ     |
| DANIELE | DANIELE@GMAIL.COM                | RJ     |
| LORENA  | NAO TEM EMAIL                    | ES     |
| EDUARDO | NAO TEM EMAIL                    | RJ     |
| ANTONIO | ANTONIO@IG.COM                   | PR     |
| ANTONIO | ANTONIO@UOL.COM                  | SP     |
| ELAINE  | ELAINE@GLOBO.COM                 | PR     |
| CARMEM  | CARMEM@IG.COM                    | SP     |
| ADRIANA | ADRIANA@GMAIL.COM                | RJ     |
| JOICE   | JOICE@GMAIL.COM                  | RJ     |
+---------+----------------------------------+--------+

SELECT C.NOME,
       IFNULL(C.EMAIL, 'NAO TEM EMAIL') AS "EMAIL",
       E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;
+---------+-------------------+--------+
| NOME    | EMAIL             | ESTADO |
+---------+-------------------+--------+
| JOAO    | JOAOA@IG.COM      | RJ     |
| CARLOS  | CARLOS@IG.COM     | RJ     |
| ANA     | ANA@IG.COM        | SP     |
| CLARA   | NAO TEM EMAIL     | MG     |
| JORGE   | JORGE@IG.COM      | ES     |
| CELIA   | CELIA@IG.COM      | RJ     |
| PAULA   | NAO TEM EMAIL     | RJ     |
| FLAVIO  | FLAVIO@IG.COM     | RJ     |
| ANDRE   | ANDRE@GLOBO.COM   | MG     |
| GIOVANA | NAO TEM EMAIL     | RJ     |
| KARLA   | KARLA@GMAIL.COM   | RJ     |
| DANIELE | DANIELE@GMAIL.COM | RJ     |
| LORENA  | NAO TEM EMAIL     | ES     |
| EDUARDO | NAO TEM EMAIL     | RJ     |
| ANTONIO | ANTONIO@IG.COM    | PR     |
| ANTONIO | ANTONIO@UOL.COM   | SP     |
| ELAINE  | ELAINE@GLOBO.COM  | PR     |
| CARMEM  | CARMEM@IG.COM     | SP     |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     |
| JOICE   | JOICE@GMAIL.COM   | RJ     |
+---------+-------------------+--------+

SELECT C.NOME,
       IFNULL(C.EMAIL, '***************') AS "EMAIL",
       E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;
+---------+-------------------+--------+
| NOME    | EMAIL             | ESTADO |
+---------+-------------------+--------+
| JOAO    | JOAOA@IG.COM      | RJ     |
| CARLOS  | CARLOS@IG.COM     | RJ     |
| ANA     | ANA@IG.COM        | SP     |
| CLARA   | ***************   | MG     |
| JORGE   | JORGE@IG.COM      | ES     |
| CELIA   | CELIA@IG.COM      | RJ     |
| PAULA   | ***************   | RJ     |
| FLAVIO  | FLAVIO@IG.COM     | RJ     |
| ANDRE   | ANDRE@GLOBO.COM   | MG     |
| GIOVANA | ***************   | RJ     |
| KARLA   | KARLA@GMAIL.COM   | RJ     |
| DANIELE | DANIELE@GMAIL.COM | RJ     |
| LORENA  | ***************   | ES     |
| EDUARDO | ***************   | RJ     |
| ANTONIO | ANTONIO@IG.COM    | PR     |
| ANTONIO | ANTONIO@UOL.COM   | SP     |
| ELAINE  | ELAINE@GLOBO.COM  | PR     |
| CARMEM  | CARMEM@IG.COM     | SP     |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     |
| JOICE   | JOICE@GMAIL.COM   | RJ     |
+---------+-------------------+--------+

/* USANDO VIEWS */
SELECT C.NOME,
        C.SEXO,
        C.EMAIL,
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;
+---------+------+-------------------+------+-----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO    | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+-----------+------------+----------------+--------+
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 987526289 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 927165536 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 993894783 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@IG.COM     | COM  | 993130091 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@IG.COM     | CEL  | 964700608 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM        | CEL  | 992532854 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 987633825 | JARDINS    | SAO PAULO      | SP     |
| JORGE   | M    | JORGE@IG.COM      | CEL  | 928035505 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@IG.COM      | RES  | 910161634 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@IG.COM      | RES  | 938426623 | CENTRO     | VITORIA        | ES     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 44522680  | CENTRO     | RIO DE JANEIRO | RJ     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565  | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675  | CASCADURA  | B. HORIZONTE   | MG     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654  | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979  | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | NULL              | COM  | 88965676  | CENTRO     | VITORIA        | ES     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809  | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978  | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768  | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665  | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786  | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+-----------+------------+----------------+--------+

/* PARA CRIAR A CONSULTA PRÉDEFINIDA VIEW */
CREATE VIEW RELATORIO AS
SELECT C.NOME,
        C.SEXO,
        C.EMAIL,
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

/* USANDO A VIEW CRIADA */
SELECT * FROM RELATORIO;

/* APAGANDO UMA VIEW */
DROP VIEW RELATORIO;
 
 /* PARA CRIAR UMA VIEW COM PREFIXO */
CREATE VIEW V_RELATORIO AS
SELECT C.NOME,
        C.SEXO,
        IFNULL(C.EMAIL, 'CLIENTE SEM EMAIL') AS "EMAIL",
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM V_RELATORIO;

/* RESTRINGINDO UMA VIEW */
SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;

/* COMANDOS DML - UPDATE, INSERT E DELETE */
INSERT INTO V_RELATORIO VALUES(
'ANDREIA', 'F', 'ANDREIA@UOL.COM.BR', 'CEL', '873547864', 'CENTRO', 'VITORIA', 'ES'
);
ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
/* NÃO SE PODE INSERIR VALORES EM UMA VIEW COM JOINS */
/* NÃO É POSSÍVEL USAR COMANDOS DML INSERT E DELETE EM UMA VIEW COM JOIN 
MAS, O COMANDO UPDATE E SELECT SÃO PERMITIDOS*/

SELECT * FROM V_RELATORIO
WHERE SEXO = 'F';

/* ORDER BY */
CREATE TABLE ALUNOS(
NUMERO INT,
NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1, 'JOAO');
INSERT INTO ALUNOS VALUES(1, 'MARIA');
INSERT INTO ALUNOS VALUES(2, 'ZOE');
INSERT INTO ALUNOS VALUES(2, 'ANDRE');
INSERT INTO ALUNOS VALUES(3, 'CLARA');
 INSERT INTO ALUNOS VALUES(1, 'CLARA');
 INSERT INTO ALUNOS VALUES(4, 'MAFRA');
 INSERT INTO ALUNOS VALUES(5, 'JANAINA');
 INSERT INTO ALUNOS VALUES(1, 'JANAINA');
 INSERT INTO ALUNOS VALUES(3, 'MARCELO');
 INSERT INTO ALUNOS VALUES(4, 'GEOVANI');
 INSERT INTO ALUNOS VALUES(5, 'ANTONIO');
 INSERT INTO ALUNOS VALUES(6, 'ANA');
 INSERT INTO ALUNOS VALUES(6, 'VIVIANE');
 
 SELECT * FROM ALUNOS
 ORDER BY NUMERO;
 /* ORDENOU POR NUMEROS */

  SELECT * FROM ALUNOS
 ORDER BY 1;
 /* ORDENOU PELA COLUNA NUMERO 01 */

  SELECT * FROM ALUNOS
 ORDER BY 2;
 /* ORDENOU PELA COLUNA NUMERO 02 */

 /* ORDENANDO POR MAIS DE UMA COLUNA */
SELECT * FROM ALUNOS
 ORDER BY 1;
 +--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | JANAINA |
|      1 | CLARA   |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | MARCELO |
|      3 | CLARA   |
|      4 | MAFRA   |
|      4 | GEOVANI |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GEOVANI |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 1, 2;
/* ORDENA PELAS COLUNAS 1 E 2 */

/* SELECINANDO POR UMA COLUNA, ORDENANDO PELA ORDEM DE DUAS */
SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;
+---------+
| NOME    |
+---------+
| CLARA   |
| JANAINA |
| JOAO    |
| MARIA   |
| ANDRE   |
| ZOE     |
| CLARA   |
| MARCELO |
| GEOVANI |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANA     |
| VIVIANE |
+---------+

/* SELECIONANDO POR COLUNAS EM ORDEM ASCENDENTE E DESCENDENTE */
SELECT NOME FROM ALUNOS
ORDER BY 1 ASC;

SELECT NOME FROM ALUNOS
ORDER BY 1 DESC;

SELECT NOME FROM ALUNOS
ORDER BY 1 DESC, 2 DESC; 

/* ORDENANDO POR UMA JOIN */
SELECT C.NOME,
        C.SEXO,
        IFNULL(C.EMAIL, 'CLIENTE SEM EMAIL') AS "EMAIL",
        T.TIPO,
        T.NUMERO,
        E.BAIRRO,
        E.CIDADE,
        E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

SELECT * FROM V_RELATORIO
ORDER BY 1;

/* first update from office computer to github */


/* ok, it's first reupdate from Home PC 24/04/2022 */

/* COMANDO PARA ALTERAR DELIMITADORES */
DELIMITER (SIMBOLO);

/* COMANDO PARA VER STATUSA DO BD */
STATUS

/* STORED PROCEDURES */
DELIMITER $
CREATE PROCEDURE NOME_EMPRESA()
BEGIN

    SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$
DEMILITER ;

/* CHAMANDO UMA PROCEDURE */
CALL NOME_EMPRESA();

/* PROCEDURES COM PARÂMETROS */
SELECT 10 + 10 AS CONTA;

DEMILITER $
CREATE PROCEDURE CONTA()
BEGIN

    SELECT 10 + 10 AS CONTA;

END
$
DEMILITER ;

CALL CONTA();

DROP PROCEDURE CONTA;

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2)
BEGIN

    SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$

CALL CONTA(100, 50)$
DEMILITER ;

CALL CONTA(1000, 250);
