-- criação de banco de dados para cenário de e-commerce
CREATE DATABASE BD_ECOMMERCE;

USE BD_ECOMMERCE;
-- criacao da tabela cliente
CREATE TABLE clients(
	idClient INT auto_increment primary key,
    fName Varchar(10),
    Minit Char(3),
    Lname Char(20),
    cpf char(12),
	Address VARCHAR(45),
   Constraint Unique_Cpf_Client Unique (CPF)
) ;

-- criacao da tabela produto
-- size equivale a dimensão de produto

CREATE TABLE product(
	idProduct int auto_increment primary key,
    PName Varchar(10),
    PCategory Enum('Brinquedo','Eletronico', 'Vestimento' , 'Alimento', 'moveis') not null,
    Pdescription VarChar(45),
    avaliaçao FLOAT default 0,
    size varchar(10),
    CPF char(12),
	PValor VARCHAR(45),
	Constraint Unique_Cpf_Client Unique (CPF)
) ;
-- criação da tabela pagamentos
CREATE TABLE payments(
	IdClient int,
    IdPayment int,
    tyPePayment enum('boleto', 'cartao', 'dois cartoes'),
    limitAvaliable float,
    primary key (IdClient, idPayment)
) ;

-- criação da tabela ordem
CREATE TABLE orders(
	IdOrder INT auto_increment primary key, 
    IdOrderClient INT,
    OrderStatus enum('Cancelado','Confirmado','Em Processamento'),
    SendValue Float default 10,
    OrderDescription Varchar(255),
    constraint fk_order_client foreign key (IdOrderClient) references clients(idClient)
    ) ;

-- criar tabela estoque

CREATE TABLE ProductStorage (
	idProdStorage int auto_increment primary key,
    storagelocation VARCHAR(255),
    quantity int default 0
) ;


-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier int auto_increment primary key,
    socialname varchar(45),
    CNPJ char(15) not null,
    contato VARCHAR(13) not null,
    constraint	unique_supplier unique (CNPJ)
) ;



-- criar tabela vendedor
CREATE TABLE seller(
	idSeller int auto_increment primary key,
    AbstrName varchar(255),
    CNPJ char(15),
	CPF char(12),
    contato VARCHAR(13) not null,
    Location VARCHAR(255),
	constraint	unique_cnpj_Seller unique (CNPJ),
    constraint	unique_cpf_Seller unique (CPF)
) ;

-- criar tabela relacao produto vendedor

CREATE TABLE ProductSeller(
	idPseller int,
    idPprodcut int,
    ProdQuantity int default 1,
    primary key (idPseller, idPprodcut),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPprodcut) references product(idProduct)    
) ;

-- criar tabela produtor por ordem

CREATE TABLE ProductOrder(
    idPOprodcut int,
	idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel','Sem Estoque') default 'Disponivel',
    primary key (idPOprodcut, idPOorder),
    constraint fk_productorder_seller foreign key (idPOprodcut) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)    
);

-- criar tabela estoque localização

CREATE TABLE storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
	constraint fk_product_idLproduct foreign key (idLproduct) references product(idProduct),
    constraint fk_product_idLstorage foreign key (idLstorage) references ProductStorage(idProdStorage)    

);




    
    