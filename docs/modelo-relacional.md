# 🧩 Modelo Relacional — SQL E-commerce

Este documento descreve os relacionamentos entre as tabelas do banco.

## Entidades principais

clientes → fazem → pedidos  
pedidos → possuem → itens_pedido  
produtos → pertencem → categorias  
produtos → vêm de → fornecedores  
pedidos → acontecem em → canais_venda  
pedidos → podem ter → vendedores  

---

## Relacionamentos

### Clientes e Pedidos
- 1 cliente pode fazer vários pedidos
- pedidos.cliente_id → clientes.cliente_id

### Pedidos e Itens
- 1 pedido possui vários itens
- itens_pedido.pedido_id → pedidos.pedido_id

### Produtos e Itens
- 1 produto pode aparecer em vários pedidos
- itens_pedido.produto_id → produtos.produto_id

### Produtos e Categorias
- Muitos produtos pertencem a 1 categoria
- produtos.categoria_id → categorias.categoria_id

### Produtos e Fornecedores
- Muitos produtos vêm de 1 fornecedor
- produtos.fornecedor_id → fornecedores.fornecedor_id

### Pedidos e Canais de Venda
- Muitos pedidos ocorrem em 1 canal
- pedidos.canal_id → canais_venda.canal_id

### Pedidos e Vendedores
- Um vendedor pode estar associado a vários pedidos
- pedidos.vendedor_id → vendedores.vendedor_id
