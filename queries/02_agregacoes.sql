-- =====================================================
-- DESAFIO 01 — Últimos pedidos realizados
-- =====================================================
-- Pergunta de negócio:
-- Mostrar os 5 pedidos mais recentes para acompanhamento diário.

SELECT
    pedido_id,
    data_pedido,
    total_pedido,
    status
FROM pedidos
ORDER BY data_pedido DESC
LIMIT 5;


-- =====================================================
-- DESAFIO 02 — Quantidade de pedidos por canal
-- =====================================================
-- Pergunta de negócio:
-- Quantos pedidos vieram de cada canal de venda?

SELECT
    c.nome AS canal,
    COUNT(p.pedido_id) AS qtd_pedidos
FROM pedidos p
JOIN canais_venda c 
    ON p.canal_id = c.canal_id
GROUP BY c.nome
ORDER BY qtd_pedidos DESC;


-- =====================================================
-- DESAFIO 02 — Quantidade de pedidos por canal
-- =====================================================
-- Pergunta de negócio:
-- Quantos pedidos vieram de cada canal de venda?

SELECT
    c.nome AS canal,
    COUNT(p.pedido_id) AS qtd_pedidos
FROM pedidos p
JOIN canais_venda c 
    ON p.canal_id = c.canal_id
GROUP BY c.nome
ORDER BY qtd_pedidos DESC;


-- =====================================================
-- DESAFIO 04 — Top 5 produtos mais vendidos
-- =====================================================
-- Pergunta de negócio:
-- Quais produtos tiveram maior volume de vendas?

SELECT
    pr.nome AS produto,
    SUM(i.quantidade) AS quantidade_vendida
FROM itens_pedido i
JOIN produtos pr
    ON i.produto_id = pr.produto_id
GROUP BY pr.nome
ORDER BY quantidade_vendida DESC
LIMIT 5;



-- =====================================================
-- DESAFIO 05 — Produtos sem vendas
-- =====================================================
-- Pergunta de negócio:
-- Identificar produtos que nunca tiveram vendas.

SELECT
    p.sku,
    p.nome
FROM produtos p
LEFT JOIN itens_pedido i
    ON p.produto_id = i.produto_id
WHERE i.produto_id IS NULL;
