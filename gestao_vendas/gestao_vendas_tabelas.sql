CREATE DATABASE gestao_vendas;

CREATE TABLE Usuario(
id bigint primary key auto_increment,
nome varchar(75) not null,
usuario varchar(50) not null unique,
senha varchar(100) not null,
perfil varchar(40) not null default 'NOVO USUÁRIO',
situacao boolean not null default true,
data_hora_criacao datetime default current_timestamp,
ultimo_login datetime default'0001-01-01 00:00:00'
);

CREATE TABLE Cliente(
id int primary key auto_increment,
nome varchar(50),
telefone varchar(15),
morada varchar(100)
);

CREATE TABLE Venda(
id int primary key auto_increment,
total_venda decimal (10,2) not null,
valor_pago decimal (10,2) not null,
troco decimal(10,2) not null,
desconto decimal (10,2) not null,
cliente_id int,
usuario_id bigint not null,
data_hora_criacao datetime default current_timestamp,
ultima_atualizacao datetime default current_timestamp,
constraint fk_venda_cliente foreign key(cliente_id) references
cliente(id),
constraint fk_venda_usuario foreign key(usuario_id) references
usuario(id)
);

CREATE TABLE Produto(
id bigint primary key auto_increment,
nome varchar(100) not null,
descricao text,
preco decimal(10,2) not null,
estoque int not null,
data_hora_criacao datetime default current_timestamp,
ultima_atualizacao datetime default current_timestamp
);

CREATE TABLE Venda_Item(
venda_id int not null,
produto_id bigint not null,
quantidade int not null,
total decimal(10,2) not null,
desconto decimal(10,2) not null,
constraint fk_venda_item_venda foreign key(venda_id) references venda(id),
constraint fk_venda_item_produto foreign key(produto_id) references produto(id)
);