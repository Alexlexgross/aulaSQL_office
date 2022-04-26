create table Cargos(
codigo_cargo int not null auto_increment,
descricao_cargo varchar(50) not null,
salario numeric(9,2) not null,
codigo_empregado int,
primary key(codigo_cargo),
foreign key fk_Cargo_Empregado (codigo_empregado) references
Empregados(codigo_empregado)
);

