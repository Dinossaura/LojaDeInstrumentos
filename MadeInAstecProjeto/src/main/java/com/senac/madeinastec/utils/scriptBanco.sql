CREATE TABLE Perfil (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    perfil VARCHAR(30) NOT NULL,
    CONSTRAINT primary_key PRIMARY KEY (codigo)
);

CREATE TABLE Empresas (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    cidade VARCHAR(15) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    CONSTRAINT primary_keyemp PRIMARY KEY (codigo)
);

CREATE TABLE Usuarios (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, 
    INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    login VARCHAR(10) NOT NULL,
    senha VARCHAR(10) NOT NULL,
    codigoperfil INTEGER NOT NULL,
    codigoempresa INTEGER NOT NULL,
    CONSTRAINT primary_keyUsu PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyUsu FOREIGN KEY (codigoperfil) REFERENCES Perfil(codigo),
    CONSTRAINT foreign_keyUsuemp FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Clientes (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(12) NOT NULL,
    idade INTEGER,
    telefone VARCHAR(14),
    telefone2 VARCHAR(14),
    email VARCHAR(30),
    endereco VARCHAR(30) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(20),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    codigoempresa INTEGER NOT NULL,
    cep VARCHAR(9) NOT NULL,
    CONSTRAINT primary_keycli PRIMARY KEY (id),
    CONSTRAINT foreign_keycli FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Carrinho (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    codigocliente INTEGER NOT NULL,
    datacarrinho TIMESTAMP NOT NULL,
    valortotal DECIMAL(5,2) NOT NULL,
    CONSTRAINT primary_keycar PRIMARY KEY (codigo),
    CONSTRAINT foreign_keycar FOREIGN KEY (codigocliente) REFERENCES Clientes(id)
);

CREATE TABLE Fornecedor (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    codigoempresa INTEGER NOT NULL,
    CONSTRAINT primary_keyfor PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyforn FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Categoria (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    CONSTRAINT primary_keycate PRIMARY KEY (codigo)
);

CREATE TABLE Produtos (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    codigoempresa INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(30) NOT NULL,
    codigofornecedor INTEGER NOT NULL,
    codigocategoria INTEGER NOT NULL,
    precocompra DECIMAL(5,2) NOT NULL,
    precovenda DECIMAL(5,2) NOT NULL,
    estoque INTEGER NOT NULL,
    CONSTRAINT primary_keypro PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyprofor FOREIGN KEY (codigofornecedor) REFERENCES Fornecedor(codigo),
    CONSTRAINT foreign_keyprocat FOREIGN KEY (codigocategoria) REFERENCES Categoria(codigo),
    CONSTRAINT foreign_keyproemp FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Venda(
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    codigocliente INTEGER NOT NULL,
    datavenda TIMESTAMP NOT NULL,
    valortotal DECIMAL(5,2) NOT NULL,
    CONSTRAINT primary_keyven PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyvencli FOREIGN KEY (codigocliente) REFERENCES Clientes(id)
);

CREATE TABLE Itemvenda (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    codigovenda INTEGER NOT NULL,
    codigoproduto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    CONSTRAINT primary_keyitem PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyitemcod FOREIGN KEY (codigovenda) REFERENCES Venda(codigo),
    CONSTRAINT foreign_keyitempro FOREIGN KEY (codigoproduto) REFERENCES Produtos(codigo)
);

CREATE TABLE Itemcarrinho(
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    codigocarrinho INTEGER NOT NULL,
    codigoproduto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    CONSTRAINT primary_keyitemcar PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyitemcar FOREIGN KEY (codigocarrinho) REFERENCES Carrinho(codigo),
    CONSTRAINT foreign_keyitemcarpro FOREIGN KEY (codigoproduto) REFERENCES Produtos(codigo)
);


INSERT INTO Empresas (nome, cidade, estado, tipo) VALUES ('Made in Astec', 'São Paulo', 'SP', 'Matriz');
INSERT INTO Empresas (nome, cidade, estado, tipo) VALUES ('Made in Astec', 'Porto Alegre', 'RS', 'Filial');
INSERT INTO Empresas (nome, cidade, estado, tipo) VALUES ('Made in Astec', 'Recife', 'PE', 'Filial');


INSERT INTO Perfil (perfil) VALUES ('Diretoria');
INSERT INTO Perfil (perfil) VALUES ('Gerente Produtos/ Serviços');
INSERT INTO Perfil (perfil) VALUES ('Gerente Vendas');
INSERT INTO Perfil (perfil) VALUES ('Gerente TI');
INSERT INTO Perfil (perfil) VALUES ('Funcionário Retaguarda');
INSERT INTO Perfil (perfil) VALUES ('Vendedor');
INSERT INTO Perfil (perfil) VALUES ('Suporte Técnico');

SELECT * FROM Empresas;

SELECT * FROM Perfil;

SELECT * FROM clientes;

