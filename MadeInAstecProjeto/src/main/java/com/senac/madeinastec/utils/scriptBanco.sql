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
    login VARCHAR(20) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    codigoperfil INTEGER NOT NULL,
    codigoempresa INTEGER NOT NULL,
    CONSTRAINT primary_keyUsu PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyUsu FOREIGN KEY (codigoperfil) REFERENCES Perfil(codigo),
    CONSTRAINT foreign_keyUsuemp FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Clientes (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(70) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(12) NOT NULL,
    datanasc VARCHAR(12),
    telefone VARCHAR(14),
    telefone2 VARCHAR(14),
    email VARCHAR(60),
    endereco VARCHAR(70) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(60),
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
    datacarrinho VARCHAR(10) NOT NULL,
    valortotal DECIMAL(8,2) NOT NULL,
    codigoempresa INTEGER NOT NULL,
    CONSTRAINT primary_keycar PRIMARY KEY (codigo),
    CONSTRAINT foreign_keycar FOREIGN KEY (codigocliente) REFERENCES Clientes(id),
    CONSTRAINT foreign_keyvenempcar FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Fornecedor (
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    numero varchar(10) NOT NULL,
    complemento varchar (60),
    cidade varchar (30),
    estado varchar (2),
    telefone VARCHAR (14),
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
    nome VARCHAR(70) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    codigofornecedor INTEGER NOT NULL,
    codigocategoria INTEGER NOT NULL,
    precocompra DECIMAL(8,2) NOT NULL,
    precovenda DECIMAL(8,2) NOT NULL,
    estoque INTEGER NOT NULL,
    CONSTRAINT primary_keypro PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyprofor FOREIGN KEY (codigofornecedor) REFERENCES Fornecedor(codigo),
    CONSTRAINT foreign_keyprocat FOREIGN KEY (codigocategoria) REFERENCES Categoria(codigo),
    CONSTRAINT foreign_keyproemp FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
);

CREATE TABLE Venda(
    codigo INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    codigocliente INTEGER NOT NULL,
    datavenda VARCHAR(10) NOT NULL,
    valortotal DECIMAL(8,2) NOT NULL,
    codigoempresa INTEGER NOT NULL,
    CONSTRAINT primary_keyven PRIMARY KEY (codigo),
    CONSTRAINT foreign_keyvencli FOREIGN KEY (codigocliente) REFERENCES Clientes(id),
    CONSTRAINT foreign_keyvenemp FOREIGN KEY (codigoempresa) REFERENCES Empresas(codigo)
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

INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('DAddarío', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 1
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Fender', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 2
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Gibson', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 3
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Roland', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 4
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Martin e Co', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 5
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Casio', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); --6
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('|BlackStar', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 7
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Mark Bass', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 8
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('IK MultiMedia', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 9
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Boss', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 10
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Korg', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 11
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Tagina', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 12
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Ibanez', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 13
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Sigma Guitars', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 14
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Shure', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 15
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Eletro-Harmonix', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 16
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('On-Stage', 1, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 17

INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('DAddarío', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 18
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Fender', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 19
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Gibson', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 20
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Roland', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 21
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Martin e Co', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 22
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Casio', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 23
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('BlackStar', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 24
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Mark Bass', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 25
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('IK MultiMedia', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); --26
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Boss', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 27
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Korg', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 28
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Tagina', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 29
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Ibanez', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 30
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Sigma Guitars', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 31
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Shure', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 32
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Eletro-Harmonix', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); --33
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('On-Stage', 2, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 34

INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('DAddarío', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 35
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Fender', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 36
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Gibson', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 37
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Roland', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 38
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Martin e Co', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 39
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Casio', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 40
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('BlackStar', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 41
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Mark Bass', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 42
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('IK MultiMedia', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 43
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Boss', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 44
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Korg', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 45
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Tagina', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 46
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Ibanez', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 47
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Sigma Guitars', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 48
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Shure', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 49
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('Eletro-Harmonix', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 50
INSERT INTO FORNECEDOR (nome, codigoempresa, endereco, numero, cidade, estado, telefone) VALUES ('On-Stage', 3, 'Avenida Luiz Carlos Berrini', '19199', 'São Paulo', 'SP', '(11)5555-8888'); -- 51

-- Categorias e Códigos
INSERT INTO CATEGORIA (nome) VALUES ('Audio Profissional'); -- 1
INSERT INTO CATEGORIA (nome) VALUES ('Bateria & Percussão'); --2
INSERT INTO CATEGORIA (nome) VALUES ('Cordas & Acessórios'); --3
INSERT INTO CATEGORIA (nome) VALUES ('Pianos & Teclados'); -- 4
INSERT INTO CATEGORIA (nome) VALUES ('Sopro');


-- 3 produtos para Categoria 1 e empresa 1
INSERT INTO PRODUTOS (codigoempresa, nome, descricao, codigofornecedor, codigocategoria, precocompra, precovenda, estoque)
            VALUES   (1, 'Pedestal para Microfone Euro Boom', 'Pedestal para Microfone feito de liga de Metal híbrida, com pernas retráteis e excelente qualidade', 17, 1, 100.00, 159.00, 20);
INSERT INTO PRODUTOS (codigoempresa, nome, descricao, codigofornecedor, codigocategoria, precocompra, precovenda, estoque)
            VALUES   (1, 'Pedestal para Microfone com Base Redonda', 'Pedestal com base redonda e embreagem de bloqueio de meio ponto em aço', 17, 1, 120.00, 189.00, 20);
INSERT INTO PRODUTOS (codigoempresa, nome, descricao, codigofornecedor, codigocategoria, precocompra, precovenda, estoque)
            VALUES   (1, 'Cachimbo para Microfone', 'Cachimbo para Microfone Dinâmico My100', 17, 1, 20.00, 39.00, 20);

-- 3 Produtos para Categoria 2 e empresa 1
INSERT INTO PRODUTOS (codigoempresa, nome, descricao, codigofornecedor, codigocategoria, precocompra, precovenda, estoque)
            VALUES   (1, 'Bateria Acústica Garage Rock', 'Bateria Acústica Garage Rock com Bumbo 22", caixa 14", Surdo 16" e toms 10" e 12" Nagano', 1, 2, 1500.00, 2499.00, 20);
INSERT INTO PRODUTOS (codigoempresa, nome, descricao, codigofornecedor, codigocategoria, precocompra, precovenda, estoque)
            VALUES   (1, 'Caixa para Bateria Armory', 'Caixa para Bateria Armory 14x6,5" aço Martelad', 1, 2, 500.00, 1389.00, 20);
INSERT INTO PRODUTOS (codigoempresa, nome, descricao, codigofornecedor, codigocategoria, precocompra, precovenda, estoque)
            VALUES   (1, 'Caixa pra Bateria 14x8"', 'Caixa pra Bateria 14x8" Mpx Mpml4800c Maple Natural Mapex', 1, 2, 200.00, 719.00, 20);


INSERT INTO USUARIOS (nome, login, senha, codigoperfil, codigoempresa) VALUES ('ADMIN', 'ADMIN', 'admin', 1, 1);


