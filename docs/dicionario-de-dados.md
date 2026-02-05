# 📖 Dicionário de Dados

Descrição das tabelas e colunas do banco.

---

## clientes

| Coluna | Descrição |
|---|---|
| cliente_id | Identificador único |
| nome | Nome do cliente |
| email | Email |
| telefone | Telefone |
| cpf | Documento |
| data_cadastro | Data de cadastro |
| cidade | Cidade |
| estado | Estado |
| ativo | Cliente ativo |

---

## produtos

| Coluna | Descrição |
|---|---|
| produto_id | ID do produto |
| sku | Código SKU |
| nome | Nome do produto |
| categoria_id | Categoria |
| fornecedor_id | Fornecedor |
| preco_custo | Custo |
| preco_venda | Preço de venda |
| estoque_atual | Estoque disponível |
| estoque_minimo | Estoque mínimo |

---

## pedidos

| Coluna | Descrição |
|---|---|
| pedido_id | ID do pedido |
| cliente_id | Cliente |
| canal_id | Canal de venda |
| vendedor_id | Vendedor |
| data_pedido | Data |
| status | Status |
| frete | Frete |
| desconto | Desconto |
| total_pedido | Valor total |
