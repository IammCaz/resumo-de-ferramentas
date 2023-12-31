--CRIAR BANCO DE DADOS

-- Excluir banco de dados aula_modelagem (CUIDADO)
DROP DATABASE IF EXISTS aula_modelagem;

-- Criar banco de dados aula_modelagem
CREATE DATABASE aula_modelagem;



--CRIAR TABELAS E ALTERAR DADOS

-- Tabela editoras
CREATE TABLE editoras (
  id serial primary key, 
  nome text not null,
  cnpj text unique,
  data_cadastro timestamp default now()
);

-- Inserir dados na tabela editoras
INSERT INTO editoras (nome, cnpj) VALUES ('Cubos Academy', '00112233445567');

-- Tabela livros
CREATE TABLE livros (
  isbn integer primary key, 
  editora_id integer references editoras(id),
  titulo text not null,
  data_publicacao date not null
);

-- Inserir dados na tabela livros
INSERT INTO livros (isbn, editora_id, titulo, data_publicacao)
VALUES (12346, 1, 'Node.js Avançado', '2022-01-01');

-- Tabela enderecos
CREATE TABLE enderecos (
  id serial primary key,
  editora_id integer references editoras(id),
  cep text not null,
  rua text,
  bairro text,
  cidade text,
  estado char(2),
  pais text
);

-- Inserir dados na tabela enderecos
INSERT INTO enderecos (editora_id, cep)
VALUES (1, '41000-000');

-- Tabela categorias
CREATE TABLE categorias (
	id serial primary key,
  	nome text not null
);

-- Tabela livro_categoria
CREATE TABLE livro_categoria (
	livro_isbn integer references livros(isbn),
  	categoria_id integer references categorias(id)
);

-- Inserir dados na tabela categorias
INSERT INTO categorias (nome) VALUES ('Tecnologia'), ('Programação'), ('Nodejs');

-- Inserir dados na tabela livro_categoria
INSERT INTO livro_categoria (livro_isbn, categoria_id)
VALUES
(12345, 1),
(12345, 2),
(12345, 3),
(12346, 2);

-- Tabela comentarios
CREATE TABLE comentarios (
	id serial primary key,
  	descricao text not null,
  	comentario_id integer references comentarios(id),
  	livro_isbn integer references livros(isbn)
);

-- Inserir dados na tabela comentarios
INSERT INTO comentarios (livro_isbn, descricao) values (12345, 'Livro muito bom');

-- Inserir mais dados na tabela comentarios
INSERT INTO comentarios (comentario_id, descricao) values (1, 'Obrigado pelo elogio');



--ALTERAR ESTRUTURA DAS TABELAS

-- Alterar a tabela categorias: adicionar coluna descricao
ALTER TABLE categorias ADD COLUMN descricao text;

-- Remover a coluna descricao da tabela categorias
ALTER TABLE categorias DROP COLUMN descricao;

-- Alterar o tipo da coluna descricao na tabela categorias
ALTER TABLE categorias ALTER COLUMN descricao TYPE varchar(100);



--INSERIR OU ALTERAR DADOS EM TABELAS

-- Tabela telefones
CREATE TABLE telefones (
	id serial primary key,
  	editora_id integer,
  	numero text
);

-- Adicionar uma restrição de chave estrangeira na tabela telefones
ALTER TABLE telefones 
ADD CONSTRAINT fk_telefones_editoras_id
FOREIGN KEY (editora_id) REFERENCES editoras(id);


--SELECIONAR DADOS, ATUALIZAR DADOS E EXCLUIR DADOS:

-- Selecionar dados de uma tabela
SELECT coluna1, coluna2 FROM NOMEDATABELA;

-- Atualizar dados em uma tabela
UPDATE NOMEDATABELA SET coluna1 = novo_valor WHERE condicao;

-- Excluir dados de uma tabela
DELETE FROM NOMEDATABELA WHERE condicao;
