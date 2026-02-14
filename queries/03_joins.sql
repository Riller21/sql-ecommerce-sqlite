-- =====================================================
-- EXERCÍCIO 01 — Pedidos por cliente (quantidade)
-- =====================================================
SELECT
    c.nome,
    COUNT(p.pedido_id) AS qtd_pedidos
FROM pedidos p
JOIN clientes c
    ON p.cliente_id = c.cliente_id
GROUP BY c.nome
ORDER BY qtd_pedidos DESC;


-- =====================================================
-- EXERCÍCIO 02 — Total gasto por cliente
-- =====================================================
SELECT
    c.nome,
    SUM(p.total_pedido) AS total_gasto
FROM pedidos p
JOIN clientes c
    ON p.cliente_id = c.cliente_id
GROUP BY c.nome
ORDER BY total_gasto DESC;


-- =====================================================
-- EXERCÍCIO 03 — Pedidos por vendedor (quantidade)
-- =====================================================
SELECT
    v.nome,
    COUNT(p.pedido_id) AS qtd_pedidos
FROM pedidos p
JOIN vendedores v
    ON p.vendedor_id = v.vendedor_id
GROUP BY v.nome
ORDER BY qtd_pedidos DESC;


-- =====================================================
-- EXERCÍCIO 04 — Quantidade de produtos por categoria
-- =====================================================
SELECT
    c.nome AS categoria,
    COUNT(p.produto_id) AS qtd_produtos
FROM produtos p
JOIN categorias c
    ON p.categoria_id = c.categoria_id
GROUP BY c.nome
ORDER BY qtd_produtos DESC;


-- =====================================================
-- EXERCÍCIO 05 — Quantidade vendida por produto
-- =====================================================
SELECT
    pr.nome AS produto,
    SUM(i.quantidade) AS quantidade_vendida
FROM itens_pedido i
JOIN produtos pr
    ON i.produto_id = pr.produto_id
GROUP BY pr.nome
ORDER BY quantidade_vendida DESC;