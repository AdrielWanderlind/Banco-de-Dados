-- DML 
-- CRUD -> create, read, update, delete
-- CREATE -> INSERT INTO
-- sintaxe -> INSERT INTO nome tabela<(Colunas)> VALUES (valores)
-- Categoria idcategoria, nome


USE ecom;
INSERT INTO categoria(nome) VALUES ('sabor');

SELECT * FROM CATEGORIA;

SELECT nome FROM categoria;
select idcategoria codigo_categoria, nome as nome_categoria FROM categoria;

SELECT idcategoria novo_nome from categoria;

INSERT INTO fornecedor(idforn,nome,cnpj,ativo) values (1,'cesu','239385',1);

insert into produto(id, nome, preco, estoque, idcategoria,idforn)
values (1,'Sabonete', 5.40, 20, 2, 1);

insert into produto(id, nome, preco, estoque, idcategoria,idforn)
values (2,'Camiseta', 50.99, 10, 4, 1);

insert into produto(id, nome, preco, estoque, idcategoria, idforn)
values (3,'Mouse', 80.00, 5, 2, 1);

select * from produto;
-- SELECT COM OPERADORES DE COMPARAÇÃO
-- (=, >, >=, <, <=, !=) <>

-- WHERE coluna condição valor
select id codproduto, nome nomeproduto
from produto
where idproduto = 1;

select id codproduto, nome nomeproduto, preco valor_produto
from produto
where preco > 50.00;

-- operadores condicionais
-- and, or, not 

select * from produto
where preco > 50 or estoque >5;

select * from produto
where estoque >= 10 and estoque <=20;

select * from produto
where not(estoque between 10 and 20);

select * from produto
where idcategoria not in (1,2);

-- string (funções)
-- like
-- inicia com  STRING%
-- termina com %STRING
-- contém  %STRING%

SELECT * from produto
where nome like '%pre%;