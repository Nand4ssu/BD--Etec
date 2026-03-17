CREATE DATABASE mercadoPascotto_provaT;
USE mercadoPascotto_provaT;

CREATE TABLE Produtos(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (200) NOT NULL, 
    preco DOUBLE,
    quantidade_estq INT,
    id_fornecedor INT
);

CREATE TABLE Fornecedores(
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR (200),
    CNPJ INT NOT NULL, 
    telefone INT, 
    CPF VARCHAR (200) NOT NULL 
);

CREATE TABLE Colaborador(
	id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (200), 
    cargo VARCHAR (200) NOT NULL, 
    salario DOUBLE 
);

CREATE TABLE Pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_ VARCHAR (200),
    id_colaborador INT,
    id_produto INT, 
    quantidade INT
);

ALTER TABLE Fornecedores 
ADD COLUMN email VARCHAR (200);

SELECT * FROM Fornecedores;

CREATE TABLE Categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR (200)
);

ALTER TABLE Produtos 
ADD COLUMN id_categoria INT; 

SELECT * FROM Produtos;

ALTER TABLE Produtos 
ADD CONSTRAINT fk_categoria_Categorias FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria);

INSERT INTO Produtos (nome, preco, quantidade_estq) VALUES 
("Leite", 5.99, 17),
("Arroz", 6.99, 34);

SELECT * FROM Produtos;

INSERT INTO Fornecedores (nome, CNPJ, CPF, telefone) VALUES 
("Piracanjuba", 689799, "785.567.134-09", 116616),
("Namorado", 626266, "890.765.234-08", 16788787);

SELECT * FROM Fornecedores;

INSERT INTO Colaborador (nome, cargo, salario) VALUES 
("Ricardo Santos", "Estoquista", 1.200),
("Nayara Oliveira", "Operadora de Caixa", 1.450);

INSERT INTO Categorias (nomeCategoria) VALUES 
("Alimento"),
("Produto de Limpeza");

ALTER TABLE Fornecedores 
DROP COLUMN CPF;

SELECT * FROM Fornecedores;
SELECT * FROM Colaborador;

UPDATE Colaborador SET salario = 2.565 WHERE id_colaborador = 1;

SELECT 
	a.nome, b.nome 
FROM 
	Produtos a 
INNER JOIN 
	Fornecedores b 
ON 
	a.id_produto = b.id_fornecedor;

