
-- CRIAÇÃO DO BANCO DE DADOS E TABELAS

CREATE DATABASE IF NOT EXISTS DESAFIO;
USE DESAFIO;

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS CLIENTES (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_cadastro DATE NOT NULL
);

-- Tabela de Pedidos
CREATE TABLE IF NOT EXISTS PEDIDOS (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    produto VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);


-- INSERINDO 10 CLIENTES

INSERT INTO CLIENTES (nome, email, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', '2024-01-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '2024-02-10'),
('Carlos Souza', 'carlos.souza@email.com', '2024-03-05'),
('Ana Santos', 'ana.santos@email.com', '2024-03-18'),
('Pedro Lima', 'pedro.lima@email.com', '2024-04-02'),
('Juliana Costa', 'juliana.costa@email.com', '2024-04-20'),
('Ricardo Alves', 'ricardo.alves@email.com', '2024-05-11'),
('Fernanda Rocha', 'fernanda.rocha@email.com', '2024-06-25'),
('Lucas Martins', 'lucas.martins@email.com', '2024-07-01'),
('Patrícia Gomes', 'patricia.gomes@email.com', '2024-07-12');


-- INSERINDO 10 PEDIDOS

INSERT INTO PEDIDOS (id_cliente, produto, valor) VALUES
(1, 'Notebook Dell', 3500.00),
(2, 'Smartphone Samsung', 2500.00),
(3, 'Teclado Mecânico', 450.00),
(4, 'Mouse Gamer', 199.90),
(5, 'Monitor LG 24"', 899.00),
(6, 'Impressora HP', 750.00),
(7, 'Cadeira Gamer', 1200.00),
(8, 'Headset HyperX', 380.00),
(9, 'HD Externo 1TB', 420.00),
(10, 'Smartwatch Xiaomi', 620.00);


-- DML (UPDATE)

UPDATE CLIENTES
SET email = 'joao.silva.novo@email.com'
WHERE id_cliente = 1;

-- DQL (SELECT)

SELECT * FROM PEDIDOS;


-- FUNÇÕES AGREGADAS
-- Total de vendas
SELECT SUM(valor) AS total_vendas FROM PEDIDOS;

-- Preço médio dos pedidos
SELECT AVG(valor) AS media_valor FROM PEDIDOS;

-- Maior pedido
SELECT MAX(valor) AS maior_pedido FROM PEDIDOS;

-- AGRUPAMENTOS

-- Total gasto por cliente
SELECT id_cliente, SUM(valor) AS total_gasto
FROM PEDIDOS
GROUP BY id_cliente;

-- Quantidade de pedidos por produto
SELECT produto, COUNT(*) AS quantidade
FROM PEDIDOS
GROUP BY produto;

-- JOIN ENTRE CLIENTES E PEDIDOS

SELECT c.nome, p.produto, p.valor
FROM CLIENTES c
JOIN PEDIDOS p ON c.id_cliente = p.id_cliente