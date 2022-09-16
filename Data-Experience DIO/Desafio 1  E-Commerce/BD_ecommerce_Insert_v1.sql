use bd_ecommerce;

show tables;

-- na tabela clientes, inserir alguns cadastros

insert into clients (fName, Minit, Lname, cpf, Address)
		values ('Maria', 'M', 'Silva', 123456789, 'Rua silva da prata 29, Carangola - Cidade das flores'),
			   ('Matheus', 'O', 'Pimentel', 987654321, 'Rua alameda 289, Centro - Cidade das flores'),
               ('Ricardo', 'F', 'Silva', 45678913,  'avenida alameda vinha 1009 Centro - Cidade das Flores' ),
               ('Julia','S', 'França', 789123456, 'Rua jaranjeiras 861, Centro - Cidade das flores'),
               ('Roberta','G','Assis', 98745631, 'Avenida koller 19, Centro - Cidade das Flores'),
               ('Isabela','M','Cruz', 654789123, 'Rua alameda das flores 28, Centro - Cidade das Flores');
               
               
-- na tabela product, cadastrar alguns produtos
insert into product (PName, classification_kids, PCategory, avaliaçao, size) 
	      values ('Fone de Ouvido', false, 'Eletronico', '4', null ),
				 ('Barbie Elsa',true , 'Brinquedo', '3',null  ),
                 ('Body Carters',true , 'Vestimento', '5', null ),
                 ('Microfone Vedo - Youtuber',false , 'Eletronico', '4', null ),
                 ('Sofra Retrátil',false , 'moveis', '3','3x57x80'  ),
                 ('Farinha de arroz',false,'Alimento','2', null),
                 ('Fire Stick Amazon',False,'Eletronico', '3',null );


-- select * from clients;
-- select * from product;

-- criar ordem 
insert into orders (IdOrderClient, OrderStatus, OrderDescription, SendValue, paymentCash )
	values (1, default, 'compra via aplicativo', null, 1),
		   (2, default, 'compra via aplicativo', 50,0),
           (3, 'confirmado', null,null, 1),
           (4, default, 'compra via web site', 150,0);
    
-- criar prodctorder

select * from orders;
insert into ProductOrder(idPOprodcut, idPOorder, poQuantity, poStatus) 
		values(1,5,2 'Disponivel'),
			  (2,5,1,'Disponivel'),
              (3,6,1,'Disponivel');

