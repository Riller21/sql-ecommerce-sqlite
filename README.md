📊 SQL E-commerce SQLite — Practice Project

Projeto completo para prática de SQL do nível iniciante ao intermediário utilizando um banco de dados realista de e-commerce.

Este repositório simula o ambiente de dados de uma empresa que vende acessórios para motos em múltiplos canais de venda.

O objetivo é evoluir gradualmente nas habilidades de SQL, desde consultas básicas até análises de negócio (KPIs).

🎯 Objetivos do Projeto

Este projeto foi criado para treinar:

Modelagem de banco relacional

Criação de scripts SQL (DDL e DML)

Escrita de queries progressivas

Análise de dados de negócio com SQL

🗄️ Estrutura do Repositório
sql-ecommerce-sqlite/
│
├─ README.md
│
├─ db/
│  ├─ ecommerce.db
│  ├─ schema.sql
│  ├─ seed.sql
│
├─ queries/
│  ├─ 01_basico.sql
│  ├─ 02_agregacoes.sql
│  ├─ 03_joins.sql
│  ├─ 04_subqueries_case.sql
│  ├─ 05_kpis.sql
│
├─ docs/
│  ├─ modelo-relacional.md
│  ├─ dicionario-de-dados.md
│
└─ assets/
   └─ diagrama.png (opcional)

🏍️ Cenário de Negócio

Banco de dados de uma empresa fictícia que vende:

Guidões

Manoplas

Retrovisores

Pesos de guidão

Acessórios para motos

Canais de venda simulados:

Shopee

Mercado Livre

Site próprio

WhatsApp

🗃️ Banco de Dados

O banco foi modelado com as principais entidades de um e-commerce:

Tabela	Descrição
clientes	Cadastro de clientes
enderecos	Endereços dos clientes
fornecedores	Fornecedores
categorias	Categorias de produtos
produtos	Catálogo de produtos
pedidos	Vendas realizadas
itens_pedido	Itens dos pedidos
canais_venda	Marketplaces
vendedores	Equipe comercial
movimentos_estoque	Controle de estoque
🚀 Como Executar o Projeto

Abrir o SQLite:

sqlite3 db/ecommerce.db


Criar as tabelas:

.read db/schema.sql


Inserir dados:

.read db/seed.sql

📚 Organização dos Exercícios SQL

As queries estão separadas por nível de dificuldade:

🟢 01_basico.sql

SELECT

WHERE

ORDER BY

LIMIT

🟡 02_agregacoes.sql

COUNT

SUM

AVG

GROUP BY

HAVING

🟠 03_joins.sql

INNER JOIN

LEFT JOIN

Relacionamentos entre tabelas

🔵 04_subqueries_case.sql

Subqueries

CASE WHEN

Queries mais complexas

🟣 05_kpis.sql

Análises reais de negócio:

Faturamento total

Ticket médio

Produtos mais vendidos

Faturamento por canal

📈 Habilidades Demonstradas

SQL

SQLite

Modelagem relacional

Análise de dados

Business Analytics

📌 Próximos Passos

Criar diagrama relacional

Expandir dataset

Criar dashboards (Power BI futuramente)