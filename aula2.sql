-- DDL 

CREATE DATABASE aula_ddl;
use aula_ddl;

create table teste(
	idteste int primary key, -- criando uma constraint de coluna
    nome varchar(50) not null
);

create table teste2(
	idteste int not null,
    nome varchar(50) not null,
    constraint teste2pk_pk primary key(idteste)
);

create table teste3(
	idteste int,
    nome varchar(50) not null
);

alter table teste3 add constraint teste3_pk primary key(idteste);

create database ecom;
use ecom;

create table categoria(
	idcategoria int auto_increment primary key,
	nome varchar(50) not null
);

create table fornecedor(
	idforn int not null,
    nome varchar(50) not null,
    cnpj varchar(18),
    ativo tinyint default 1 -- toda vez que não informar, assume como 1(verdadeiro)
);

create table produto(
	id int not null,
    nome varchar(50) not null,
    preco decimal (12,2),
    estoque int default 0, -- toda vez que não informar, assume que o estoque está zerado
    idcategoria int null,
    idforn int not null
);

create table cliente(
	idcliente int not null,
    nome varchar(50) not null,
    email varchar(100) not null,
    status varchar(12) not null default 'Ativo',
    data_cadastro datetime default NOW()
);

create table pedido(
	id int not null,
    cliente_id int not null,
    data_pedido date,
    total decimal(10,2) default 0,
    status varchar(20)
);

create table itempedido(
	pedido_id int not null,
    produto_id int not null,
    quantidade_id int not null,
    preco_unit decimal(10,2) default 0
);

-- Primary keys
alter table fornecedor add constraint fornecedor_idforn_pk primary key(idforn);
alter table produto add constraint produto_id_pk primary key(id);
alter table cliente add constraint cliente_id_pk primary key(idcliente);
alter table pedido add constraint pedido_id_pk primary key(id);
alter table itempedido add constraint itempedido_pk primary key(pedido_id, produto_id);

-- Uniques
alter table categoria add constraint categoria_nome_uq unique(nome);
alter table fornecedor add constraint fornecedor_cnpj_uq unique(cnpj);
alter table cliente add constraint cliente_email_uq unique(email);

-- Checks
alter table produto add constraint produto_estoque_ck check(estoque>=0);
alter table produto add constraint produto_preco_ck check(preco>0);
alter table pedido add constraint pedido_status_ck check (status in('Em andamento', 'Cancelado', 'Concluido'));
alter table cliente add constraint cliente_status_ck check(status in('Ativo','Inativo'));
alter table itempedido add constraint itempedido_preco_ck check(preco_unit>=0);


-- Foreign keys
alter table produto add constraint produto_idforn_fk foreign key(idforn) references fornecedor(idforn);
alter table produto add constraint produto_idcategoria_fk foreign key(idcategoria) references categoria(idcategoria);

-- 1 Para N / Um cliente pode ter mais de 1 pedido, mas cada pedido só pode ter 1 cliente
alter table pedido add constraint cliente_pedido_fk foreign key(cliente_id) references cliente(idcliente);
alter table itempedido add constraint pedido_pedido_fk foreign key (pedido_id) references pedido(id);
alter table itempedido add constraint produto_produto_fk foreign key (produto_id) references produto(id);


-- Default status 
alter table pedido modify column status varchar(20) default 'Em Andamento';

