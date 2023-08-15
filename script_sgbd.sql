create database ecommerce;
use ecommerce;

create table clientes(
	id_Cliente int auto_increment primary key,
    Pnome varchar(10),
    Minit char(3),
    Unome varchar(20),
    Endereco varchar(30),
    CPF char(11) not null,
    constraint unique_cpf_cliente unique (CPF)
);
    
create table produtos(
	id_Produto int auto_increment primary key,
    Pnome varchar(10) not null,
    classificacao_criancas bool default false,
    categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliacao float default 0,
    tamanho varchar(10)
);

create table pedidos(
	id_Pedido int auto_increment primary key,
    id_Pedido_Cliente int,
    status_Pedido enum('Em processo', 'Confirmado', 'Cancelado') not null default 'Em processo',
    descricao_Pedido varchar(250),
    frete float default 10,
    pagamento_Cartao bool default true,
    constraint fk_pedidos_cliente foreign key (id_Pedido_Cliente) references clientes(id_Cliente)
);

create table estoque(
	id_Produto_Estoque int auto_increment primary key,
    local_estoque varchar(250),
    quantidade int default 0
);

create table fornecedor(
	id_Fornecedor int auto_increment primary key,
    CNPJ char(15) not null,
    contato char(11) not null,
    constraint unique_fornecedor unique (CNPJ)
);

create table vendedor(
	id_Vendedor int auto_increment primary key,
    localizacao varchar(250),
    CNPJ char(15) not null,
    contato char(11) not null,
    CPF char(9) not null,
    constraint unique_cnpj_vendedor unique (CNPJ),
    constraint unique_cpf_vendedor unique (CPF)
);

create table vendedor_produto(
	id_VProduto int,
    id_Produto int,
    quant_Produto int default 1,
    primary key(id_VProduto, id_Produto),
    constraint fk_vendedor_produto foreign key (id_VProduto) references vendedor(id_Vendedor),
    constraint fk_produto_produtos foreign key (id_Produto) references produtos(id_Produto)
    
);

create table localizacao_estoque(
	id_LEProduto int,
    id_LEEstoque int,
    localizacao varchar(250) not null,
    primary key(id_LEProduto, id_LEEstoque),
    constraint fk_vendedor_localizacao_estoque foreign key (id_LEProduto) references produtos(id_Produto),
    constraint fk_localizacao_estoque foreign key (id_LEEstoque) references estoque(id_Produto_Estoque)
);

create table produtos_fornecedor(
	id_PFornecedor int,
    id_PProduto int,
    quantidade int not null,
    primary key(id_PFornecedor, id_PProduto),
    constraint fk_produto_fornecedor_fornecedor foreign key (id_PFornecedor) references fornecedor(id_Fornecedor),
    constraint fk_produto_fornecedor_produto foreign key (id_PProduto) references produtos(id_Produto)
);