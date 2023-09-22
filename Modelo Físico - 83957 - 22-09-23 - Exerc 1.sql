-- Criar banco de dados
CREATE DATABASE Banco;

-- Selecionar banco de dados
USE Banco;

-- Criar tabela Clientes
CREATE TABLE Banco.Clientes(
Cpf VARCHAR(14),
Nome VARCHAR(255) NOT NULL,
Endereco TEXT NOT NULL,
Telefone VARCHAR(22) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE, 
PRIMARY KEY(Cpf)
);

-- Criar tabela ContasBancarias
CREATE TABLE Banco.ContasBancarias(
NumeroConta INT AUTO_INCREMENT,
Agencia VARCHAR(6) NOT NULL,
TipoConta VARCHAR(100) NOT NULL,
Saldo DECIMAL(15, 2) NOT NULL,
Cpf VARCHAR(14),
FOREIGN KEY(Cpf) REFERENCES Clientes(Cpf),
PRIMARY KEY(NumeroConta)
);

-- Inserir os cinco registros de clientes
INSERT INTO Banco.Clientes (Cpf, Nome, Endereco, Telefone, Email) 
VALUES ('123.456.789-16', 'Rebeca Richard', 'Rua Margarida, Cabulinha, Salvador, Bahia', '(71)98523-1432', 'rebeca@hotmail.com'),
('213.476.989-32', 'Lucas Lutor', 'Rua dos Patos, Paulino, Salvador, Bahia', '(71)97313-1432', 'lucas@gmail.com'),
('345.256.089-17', 'Fábio Ferraz', 'Rua dos Determinados, Tancredo Neves, Salvador, Bahia', '(71)96093-2462', 'fabio@outlook.com'),
('493.447.739-15', 'Júlia Jared', 'Rua dos Ratos, Engomadeira, Salvador, Bahia', '(71)95217-1842', 'julia@hotmail.com'),
('527.496.781-28', 'Janice de Jesus', 'Rua dos Crentes, Arvoredo, Salvador, Bahia', '(71)94586-9012', 'janice@phoenix.com');

-- Exibir os registros da tabela Clientes
SELECT * FROM Banco.Clientes;

-- Inserir cinco registros de Contas Bancárias
-- Tipos de conta: Depósito (Corrente ou Poupança), Salário, Pagamento
INSERT INTO Banco.ContasBancarias (Agencia, TipoConta, Saldo, Cpf)
VALUES ('2456-1', 'depósito', 2000, '123.456.789-16'),
('2444-1', 'depósito', 6700, '213.476.989-32'),
('3556-1', 'salário', 8050, '345.256.089-17'),
('8654-1', 'pagamento', 10000, '493.447.739-15'),
('9643-1', 'depósito', 7000, '527.496.781-28');

-- Exibir registros das tabela ContasBancarias
SELECT * FROM Banco.ContasBancarias;

-- Selecionar campos de duas tabelas diferentes 
SELECT C.Nome AS 'Nome do Cliente', CC.Saldo AS 'Saldo' FROM Banco.Clientes C
INNER JOIN ContasBancarias CC
ON C.Cpf = CC.Cpf;


-- Caso seja necessário: 
-- Eliminar a tabela ContasBancarias
DROP TABLE Banco.ContasBancarias;

-- Eliminar a tabela Clientes
DROP TABLE Banco.Clientes;

