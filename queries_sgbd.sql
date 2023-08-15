use ecommerce;

insert into clientes(Pnome, Minit, Unome, CPF, Endereco)
			values('Pablo', 'M', 'Ferreira', '12345678910', 'Rua Francisco Maniozzi, 269'),
				  ('Julia', 'C', 'Viana', '10987654321', 'Rua Maracá, 667'),
                  ('Roberto', 'S', 'Xavier', '82654314763', 'Rua Koehler, 98');
                  
insert into produtos(Pnome, classificacao_criancas, categoria, avaliacao, tamanho)
			values('Microfone', false, 'Eletrônico', '8', null),
				  ('Calça', false, 'Vestimenta', '7', '36'),
                  ('Hot Wheels', true, 'Brinquedos', '9', null);
                  
insert into pedidos(status_Pedido)
			values('Confirmado'),
				  ('Em processo'),
                  ('Cancelado');

insert into estoque(local_estoque, quantidade)
			values('São Paulo', 100),
				  ('Minas Gerais', 55),
                  ('Rio Grande do Sul', 30);
                  
insert into fornecedor(CNPJ, contato)
			values(80217455000100, 11948631072),
				  (69741100000175, 31905442938),
                  (39185794000140, 81965224362);
                  