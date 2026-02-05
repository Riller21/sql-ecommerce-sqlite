PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- limpar
DELETE FROM movimentos_estoque;
DELETE FROM itens_pedido;
DELETE FROM pedidos;
DELETE FROM enderecos;
DELETE FROM produtos;
DELETE FROM clientes;
DELETE FROM vendedores;
DELETE FROM canais_venda;
DELETE FROM fornecedores;
DELETE FROM categorias;

-- categorias
INSERT INTO categorias (nome, descricao) VALUES
('Guidões','Guidões e variações'),
('Manoplas','Manoplas e punhos'),
('Pesos de Guidão','Ponteiras/pesos'),
('Retrovisores','Retrovisores diversos'),
('Protetores','Handguards e protetores'),
('Manetes','Manetes freio/embreagem'),
('Suportes','Suportes celular/GPS'),
('Diversos','Parafusos e adaptadores');

-- fornecedores
INSERT INTO fornecedores (nome, cnpj, email, telefone, cidade, estado, ativo) VALUES
('MotoParts Brasil','12.345.678/0001-90','contato@motopartsbr.com','31999990001','Belo Horizonte','MG',1),
('Acessorios Prime','23.456.789/0001-10','vendas@primeacessorios.com','31999990002','Contagem','MG',1),
('Racing Imports','34.567.890/0001-21','comercial@racingimports.com','11988880003','São Paulo','SP',1);

-- canais
INSERT INTO canais_venda (nome, taxa_percentual, ativo) VALUES
('Shopee',12.0,1),
('Mercado Livre',16.0,1),
('Site Próprio',2.5,1),
('WhatsApp',0.0,1);

-- vendedores
INSERT INTO vendedores (nome, email, ativo) VALUES
('Riller (Gestão)','riller@empresa.com',1),
('Ana Comercial','ana@empresa.com',1),
('Bruno Vendas','bruno@empresa.com',1);

-- clientes
INSERT INTO clientes (nome,email,telefone,cpf,data_cadastro,cidade,estado,ativo) VALUES
('Carlos Silva','carlos.silva@gmail.com','31988887777','123.456.789-10','2024-02-10','Belo Horizonte','MG',1),
('Mariana Souza','mariana.souza@gmail.com','31981112222','234.567.890-11','2024-03-18','Contagem','MG',1),
('João Pereira','joao.pereira@gmail.com','31982223333','345.678.901-12','2024-04-05','Betim','MG',1);

-- enderecos
INSERT INTO enderecos (cliente_id,apelido,logradouro,numero,complemento,bairro,cidade,estado,cep,principal) VALUES
(1,'Casa','Rua Amazonas','120','Apto 301','Centro','Belo Horizonte','MG','30180-001',1),
(2,'Casa','Av. João César','450','Bloco B','Eldorado','Contagem','MG','32310-000',1),
(3,'Casa','Rua do Aço','55',NULL,'Jardim Industrial','Betim','MG','32670-000',1);

-- produtos (15 já serve pra começar)
INSERT INTO produtos (sku,nome,categoria_id,fornecedor_id,preco_custo,preco_venda,estoque_atual,estoque_minimo,ativo,data_cadastro) VALUES
('GO-0001','Guidão Esportivo Alumínio 22mm Preto',1,3,45.00,99.90,25,5,1,'2024-08-01'),
('GO-0002','Guidão Alto Aço 22mm Cromado',1,1,38.00,89.90,18,5,1,'2024-08-01'),
('GO-0003','Manopla Borracha Conforto Preta (Par)',2,2,9.50,24.90,60,20,1,'2024-08-03'),
('GO-0004','Manopla Premium Anti-vibração (Par)',2,2,18.00,49.90,22,8,1,'2024-08-04'),
('GO-0005','Peso de Guidão Alumínio Preto (Par)',3,2,14.00,34.90,35,10,1,'2024-08-05'),
('GO-0006','Peso de Guidão Inox (Par)',3,3,19.00,49.90,12,6,1,'2024-08-06'),
('GO-0007','Retrovisor Esportivo Preto (Par)',4,1,22.00,59.90,16,6,1,'2024-08-07'),
('GO-0008','Retrovisor Convencional Universal (Par)',4,1,18.00,49.90,26,10,1,'2024-08-07'),
('GO-0009','Handguard Universal Preto',5,2,28.00,69.90,18,6,1,'2024-08-11'),
('GO-0010','Par Manetes Ajustáveis Preto',6,3,45.00,119.90,9,4,1,'2024-08-13'),
('GO-0011','Suporte Celular Guidão (Universal)',7,2,18.00,49.90,24,10,1,'2024-08-17'),
('GO-0012','Adaptador 28mm p/ 22mm (Par)',8,1,12.00,29.90,30,10,1,'2024-08-03'),
('GO-0013','Extensor de Retrovisor (Par)',8,1,8.00,19.90,45,15,1,'2024-08-08'),
('GO-0014','Kit Parafusos p/ Peso de Guidão (Kit)',8,1,3.50,9.90,80,30,1,'2024-08-06'),
('GO-0015','Abraçadeira Guidão 22mm (Par)',8,1,7.00,19.90,40,15,1,'2024-08-19');

-- pedidos (10)
WITH RECURSIVE seq(n) AS (
  SELECT 1 UNION ALL SELECT n+1 FROM seq WHERE n < 10
)
INSERT INTO pedidos (cliente_id, canal_id, vendedor_id, data_pedido, status, frete, desconto, total_pedido, forma_pagamento, observacao)
SELECT
  (abs(random()) % 3) + 1,
  (abs(random()) % 4) + 1,
  (abs(random()) % 3) + 1,
  date('2025-01-01','+'||(abs(random())%200)||' days'),
  'Pago',
  round((abs(random())%2000)/100.0,2),
  round((abs(random())%1000)/100.0,2),
  0.0,
  'Pix',
  NULL
FROM seq;

-- itens (2 por pedido)
WITH RECURSIVE p(id) AS (SELECT 1 UNION ALL SELECT id+1 FROM p WHERE id < 10),
k(i) AS (SELECT 1 UNION ALL SELECT 2),
base AS (
  SELECT p.id AS pedido_id,
         (abs(random())%15)+1 AS produto_id,
         (abs(random())%3)+1 AS quantidade,
         round((abs(random())%300)/100.0,2) AS desconto_item
  FROM p CROSS JOIN k
)
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario, desconto_item, subtotal)
SELECT
  b.pedido_id,
  b.produto_id,
  b.quantidade,
  pr.preco_venda,
  b.desconto_item,
  round((b.quantidade*pr.preco_venda)-b.desconto_item,2)
FROM base b
JOIN produtos pr ON pr.produto_id = b.produto_id;

-- total pedido
UPDATE pedidos
SET total_pedido = round(
  COALESCE((SELECT SUM(subtotal) FROM itens_pedido i WHERE i.pedido_id = pedidos.pedido_id),0)
  + frete - desconto
,2);

-- estoque (entrada inicial)
INSERT INTO movimentos_estoque (produto_id, data_movimento, tipo, quantidade, origem, referencia_id, observacao)
SELECT produto_id,'2025-01-01','ENTRADA',100,'COMPRA',NULL,'Entrada inicial'
FROM produtos;

COMMIT;
