PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS clientes (
  cliente_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  nome           TEXT NOT NULL,
  email          TEXT NOT NULL UNIQUE,
  telefone       TEXT,
  cpf            TEXT UNIQUE,
  data_cadastro  TEXT NOT NULL,
  cidade         TEXT NOT NULL,
  estado         TEXT NOT NULL,
  ativo          INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS enderecos (
  endereco_id  INTEGER PRIMARY KEY AUTOINCREMENT,
  cliente_id   INTEGER NOT NULL,
  apelido      TEXT,
  logradouro   TEXT NOT NULL,
  numero       TEXT NOT NULL,
  complemento  TEXT,
  bairro       TEXT,
  cidade       TEXT NOT NULL,
  estado       TEXT NOT NULL,
  cep          TEXT,
  principal    INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE IF NOT EXISTS fornecedores (
  fornecedor_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome          TEXT NOT NULL,
  cnpj          TEXT UNIQUE,
  email         TEXT,
  telefone      TEXT,
  cidade        TEXT,
  estado        TEXT,
  ativo         INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS categorias (
  categoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome         TEXT NOT NULL UNIQUE,
  descricao    TEXT
);

CREATE TABLE IF NOT EXISTS canais_venda (
  canal_id        INTEGER PRIMARY KEY AUTOINCREMENT,
  nome            TEXT NOT NULL UNIQUE,
  taxa_percentual REAL NOT NULL DEFAULT 0,
  ativo           INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS vendedores (
  vendedor_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome        TEXT NOT NULL,
  email       TEXT UNIQUE,
  ativo       INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS produtos (
  produto_id      INTEGER PRIMARY KEY AUTOINCREMENT,
  sku             TEXT NOT NULL UNIQUE,
  nome            TEXT NOT NULL,
  categoria_id    INTEGER NOT NULL,
  fornecedor_id   INTEGER NOT NULL,
  preco_custo     REAL NOT NULL DEFAULT 0,
  preco_venda     REAL NOT NULL DEFAULT 0,
  estoque_atual   INTEGER NOT NULL DEFAULT 0,
  estoque_minimo  INTEGER NOT NULL DEFAULT 0,
  ativo           INTEGER NOT NULL DEFAULT 1,
  data_cadastro   TEXT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id),
  FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

CREATE TABLE IF NOT EXISTS pedidos (
  pedido_id       INTEGER PRIMARY KEY AUTOINCREMENT,
  cliente_id      INTEGER NOT NULL,
  canal_id        INTEGER NOT NULL,
  vendedor_id     INTEGER,
  data_pedido     TEXT NOT NULL,
  status          TEXT NOT NULL,
  frete           REAL NOT NULL DEFAULT 0,
  desconto        REAL NOT NULL DEFAULT 0,
  total_pedido    REAL NOT NULL DEFAULT 0,
  forma_pagamento TEXT NOT NULL,
  observacao      TEXT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
  FOREIGN KEY (canal_id) REFERENCES canais_venda(canal_id),
  FOREIGN KEY (vendedor_id) REFERENCES vendedores(vendedor_id)
);

CREATE TABLE IF NOT EXISTS itens_pedido (
  item_id        INTEGER PRIMARY KEY AUTOINCREMENT,
  pedido_id      INTEGER NOT NULL,
  produto_id     INTEGER NOT NULL,
  quantidade     INTEGER NOT NULL,
  preco_unitario REAL NOT NULL,
  desconto_item  REAL NOT NULL DEFAULT 0,
  subtotal       REAL NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

CREATE TABLE IF NOT EXISTS movimentos_estoque (
  movimento_id   INTEGER PRIMARY KEY AUTOINCREMENT,
  produto_id     INTEGER NOT NULL,
  data_movimento TEXT NOT NULL,
  tipo           TEXT NOT NULL,
  quantidade     INTEGER NOT NULL,
  origem         TEXT NOT NULL,
  referencia_id  INTEGER,
  observacao     TEXT,
  FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
