# sql-ecommerce-sqlite
📊 Descrição das Tabelas — Projeto SQLite E-commerce
🧍 clientes

Armazena os dados cadastrais dos clientes do e-commerce, incluindo informações de contato, localização e status de atividade.
É utilizada como base para análises de comportamento de compra, segmentação de clientes e cálculo de métricas como ticket médio e faturamento por cliente.

🏠 enderecos

Armazena os endereços vinculados aos clientes, permitindo que um mesmo cliente possua múltiplos endereços (ex: residência, trabalho).
É utilizada para simular cenários reais de entrega e relacionamento 1:N entre clientes e endereços.

🏭 fornecedores

Armazena informações dos fornecedores responsáveis pelo fornecimento dos produtos comercializados.
É utilizada para análises de dependência de fornecedores, gestão de compras e rastreabilidade de produtos.

🗂️ categorias

Define as categorias dos produtos do catálogo (ex: Motor, Freios, Elétrica).
É utilizada para organização do portfólio de produtos e análises de vendas por categoria.

📦 produtos

Armazena o catálogo de produtos do e-commerce, incluindo informações de preço, estoque, categoria e fornecedor.
É uma tabela central para análises de vendas, margem, giro de estoque, ruptura e desempenho de produtos.

🛒 canais_venda

Armazena os canais de venda utilizados pela empresa, como marketplace e site próprio, incluindo suas respectivas taxas.
É utilizada para análises de faturamento por canal e impacto de taxas na rentabilidade.

👨‍💼 vendedores

Armazena os dados dos vendedores ou responsáveis pelas vendas.
É utilizada para análises de performance individual, ranking de vendedores e produtividade comercial.

🧾 pedidos

Armazena o cabeçalho dos pedidos realizados no e-commerce, contendo informações do cliente, canal de venda, status, valores e forma de pagamento.
É a principal tabela transacional do projeto, utilizada em praticamente todas as análises financeiras e operacionais.

🧺 itens_pedido

Armazena os itens que compõem cada pedido, detalhando produtos, quantidades, preços e descontos aplicados.
É utilizada para análises detalhadas de vendas, faturamento por produto, mix de produtos e ticket médio.

🔄 movimentos_estoque

Registra o histórico de entradas, saídas e ajustes de estoque dos produtos.
É utilizada para análises de controle de estoque, auditoria, rastreabilidade e simulação de processos logísticos reais.
