/* =====================================================
   SQL E-COMMERCE ANALYSIS — QUERIES BÁSICAS
   =====================================================
   Contexto:
   Análise de dados de um e-commerce de acessórios para motos.
   Todas as queries respondem perguntas reais do time de negócio.
   ===================================================== */


/* =====================================================
   DESAFIO 01 — Conferência do catálogo
   =====================================================
   Pergunta do negócio:
   "Quero conferir rapidamente os produtos cadastrados."
   ===================================================== */

SELECT
    sku,
    nome,
    preco_venda,
    estoque_atual
FROM produtos
ORDER BY produto_id
LIMIT 10;


/* =====================================================
   DESAFIO 02 — Produtos abaixo do estoque mínimo
   =====================================================
   Pergunta do negócio:
   "Existe algum produto que precisa de reposição urgente?"
   Resultado: nenhum produto abaixo do estoque mínimo.
   ===================================================== */

SELECT
    sku,
    nome,
    estoque_atual,
    estoque_minimo
FROM produtos
WHERE estoque_atual < estoque_minimo;


/* =====================================================
   DESAFIO 03 — Produtos com pouco estoque (<20)
   =====================================================
   Pergunta do negócio:
   "Quais produtos precisam de atenção de estoque?"
   ===================================================== */

SELECT
    sku,
    nome,
    estoque_atual
FROM produtos
WHERE estoque_atual < 20
ORDER BY estoque_atual;


/* =====================================================
   DESAFIO 04 — Total de pedidos realizados
   =====================================================
   Pergunta do negócio:
   "Quantos pedidos já foram feitos na loja?"
   ===================================================== */

SELECT COUNT(pedido_id) AS total_pedidos
FROM pedidos;
