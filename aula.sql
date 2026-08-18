create database aula;

use aula;

create table aluno(
	ra int primary key,
    nome varchar(40) not null
);

create database autofix;

use autofix;

create table cliente(
	id_cliente int,
    nome varchar(40) not null,
    cpf varchar(14) not null,
    telefone varchar(30),
    status varchar(10) default 'Ativo',
    constraint cliente_pk primary key(id_cliente),
    constraint uq_cliente_cpf unique(cpf),
    constraint ck_cliente_status check(status in ('Ativo','Inativo'))
);


insert into cliente(id_cliente,nome,cpf,telefone,status)
values
(1, 'Adriel','11253140952','48988411831','Ativo');