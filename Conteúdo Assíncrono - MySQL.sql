create table cliente(
    id INTEGER NOT NULL auto_increment PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(70) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL,
    cpf VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE departamento(
    numero INTEGER NOT NULL auto_increment PRIMARY KEY,
    nome VARCHAR (30) NOT NULL,
    descricao TEXT
);

CREATE TABLE endereco(
    num_seq INTEGER NOT NULL auto_increment PRIMARY KEY,
    tipo VARCHAR(5) NOT NULL,
    logradouro VARCHAR (50) NOT NULL,
    numero INTEGER,
    compl VARCHAR(20),
    bairro VARCHAR(30),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10),
    id_cliente INTEGER NOT NULL,
    CONSTRAINT endereco_cliente FOREIGN KEY
        (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE pedido(
    numero INTEGER NOT NULL auto_increment PRIMARY KEY, 
    status VARCHAR(1) NOT NULL,
    data_pedido DATE,
    valor_bruto DOUBLE DEFAULT 0,
    desconto DOUBLE DEFAULT 0,
    valor_liq DOUBLE DEFAULT 0,
    id_cliente INTEGER NOT NULL,
    CONSTRAINT cliente_pedido FOREIGN KEY
        (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE produto(
    codigo INTEGER NOT NULL auto_increment PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DOUBLE,
    estoque INTEGER,
    link_foto VARCHAR(255),
    numero_depto INTEGER NOT NULL,
    CONSTRAINT produto_depto FOREIGN KEY
        (numero_depto) REFERENCES departamento(numero)
);

CREATE TABLE item_pedido(
    seq INTEGER NOT NULL auto_increment PRIMARY KEY,
    quantidade INTEGER,
    preco_unit DOUBLE,
    preco_final DOUBLE,
    codigo_produto INTEGER NOT NULL,
    numero_pedido INTEGER NOT NULL,
    CONSTRAINT item_produto FOREIGN KEY
        (codigo_produto) REFERENCES produto(codigo),
    CONSTRAINT item_pedido FOREIGN KEY
        (numero_pedido) REFERENCES pedido(numero)
);

ALTER TABLE cliente ADD column
    rg VARCHAR(10) NOT NULL AFTER senha;

ALTER TABLE cliente MODIFY column
    rg VARCHAR(15) NOT NULL AFTER senha;

INSERT INTO departamento(numero, nome, descricao) VALUES
    (1, 'Tecnologia', 'Produtos para computadores');

INSERT INTO departamento VALUES (null, 'Eletrônicos', 'Tudo que não é computador e liga na tomada');
INSERT INTO departamento VALUES (null, 'Games', 'Para jogadores hard level'), 
                                (null, 'Acessórios', 'Cabos e conectores que a gente sempre perde'),
                                (null, 'Alimentação', 'Porque dev não vive só de dogão');

INSERT INTO produto VALUES (null, 'Computador', 'Computador cheio de led top de linha',
    2500.0, 3, './imagens/computador.png', 1);

-- tabela departamento

INSERT INTO departamento VALUES (null, "Tecnologia", "Equipamentos, computadores, tablets");
INSERT INTO departamento VALUES (null, "Acessorios", "Cabos, adaptadores, carregadores");
INSERT INTO departamento VALUES (null, "Games", "Jogos, Consoles, Acessórios");

-- tabela produto

INSERT INTO produto VALUES (null, "Computador Ultima Geração","Computaodr i9 32Gb Ram 1TbHD, Placa GTX1090",4000.0,3,"computador.jpg",1);
INSERT INTO produto VALUES (null, "Notebook Ultima Geração","Notebook i7 16 Gb Ram 500Gb HD SSD",3850.00,5,"notebook.jpg",1);
INSERT INTO produto VALUES (null, "Cabo USB C","Cabo USB 2M para carregar celulares",50.0,20,"cabousb.jpg",2);
INSERT INTO produto VALUES (null, "Conector USB","Conector USB para recarga em tomada 3A",35,15,"conector.jpg",2);
INSERT INTO produto VALUES (null, "Console XBOX One","Console XBOX One com Halo e 2 controles",1999.90,3,"xbox.jpg",3);
INSERT INTO produto VALUES (null, "Console Playstation 5","Nao acompanha jogo, vem com 1 controle",2999.90,2,"ps5.jpg",3);

-- tabela cliente

INSERT INTO cliente VALUES (null, "Jose Alberto Neves","josealberto@mail.com","123456","98.876.123-99","987.654.321-00");
INSERT INTO cliente VALUES (null, "Antonio Oliveira","antoniooli@mail.com","987654","12.983.256-72","765.432.987.10");
INSERT INTO cliente VALUES (null, "Regina Brito","reginabrito@mail.com","010203","83.235.645-90","123.456.789-00");

-- tabela endereco
INSERT INTO endereco VALUES (null,"Av", "Brasil",100,"","Centro","Sao Paulo","SP","01234-567",1);
INSERT INTO endereco VALUES (null,"Rua","Major Silva",12,"Ap 12A","Pitangueiras","Itapecerica da Serra","SP","98765-432",1);
INSERT INTO endereco VALUES (null,"Rua","Heitor Vila Lobos",98,"Casa 2","Vila das Flores","Osasco","SP","06543-123",2);
INSERT INTO endereco VALUES (null,"Av","Raquel Meyer",173,"Ap 42 Bl 1","Centro","Vitoria","SP","32987-122",3);

-- tabela pedido
INSERT INTO pedido VALUES (null,"F","2021-01-10",4000,0,4000,1);
INSERT INTO pedido VALUES (null,"F","2021-02-01",70,0,70,2);
INSERT INTO pedido VALUES (null,"F","2021-03-10",3850,0,3850,3);
INSERT INTO pedido VALUES (null,"F","2021-04-15",8000,1000,7000,1);
INSERT INTO pedido VALUES (null,"F","2021-05-05",1999.90,0,1999.90,2);
INSERT INTO pedido VALUES (null,"F","2021-06-08",2999.90,0,2999.90,3);
INSERT INTO pedido VALUES (null,"F","2021-07-10",250,0,250,2);
INSERT INTO pedido VALUES (null,"F","2021-08-22",350,0,350,2);
INSERT INTO pedido VALUES (null,"F","2021-09-19",700,0,700,3);
INSERT INTO pedido VALUES (null,"F","2021-10-07",3850,0,3850,1);
INSERT INTO pedido VALUES (null,"F","2021-11-01",50,0,50,1);
INSERT INTO pedido VALUES (null,"F","2021-12-05",1999.9,0,1999.9,1);
INSERT INTO pedido VALUES (null,"F","2022-12-05",2999.9,0,2999.9,2);
INSERT INTO pedido VALUES (null,"F","2022-12-12",4000,0,4000,3);
-- tabela itens

INSERT INTO item_pedido VALUES (null, 1, 4000, 4000, 1, 15);
INSERT INTO item_pedido VALUES (null, 2, 35.0, 70.0, 4, 16);
INSERT INTO item_pedido VALUES (null, 1, 3850, 3850, 2, 17);
INSERT INTO item_pedido VALUES (null, 2, 4000, 8000, 1, 18);
INSERT INTO item_pedido VALUES (null, 1, 1999.90, 1999.90, 5, 19);
INSERT INTO item_pedido VALUES (null, 1, 2999.90, 2999.90, 6, 20);
INSERT INTO item_pedido VALUES (null, 5, 50, 250, 3, 21);
INSERT INTO item_pedido VALUES (null, 10,  35, 350, 4, 22);
INSERT INTO item_pedido VALUES (null, 20,  35, 700, 4, 23);
INSERT INTO item_pedido VALUES (null, 1, 3850, 3850, 2, 24);
INSERT INTO item_pedido VALUES (null, 1, 50, 50, 3, 25);
INSERT INTO item_pedido VALUES (null, 1, 1999.9, 1999.9, 5, 26);
INSERT INTO item_pedido VALUES (null, 1, 2999.9, 2999.9, 6, 27);
INSERT INTO item_pedido VALUES (null, 1, 4000, 4000, 1, 28);

delete from produto where codigo = 13;

select id, nome, email, senha, cpf from cliente; --Selecionando as colunas
select id as 'codigo do cliente', nome as 'nome do cliente', cpf as 'cpf do cliente' from cliente; --Nomenado as colunas na hora da exibição
select *  from cliente order by nome asc; --Ordenando clientes pelo nome em ordem crescente
select *  from cliente where id = 1; --Buscando através de um critério
select count(id) from cliente; --Mostrando em quantidade quantos clientes existem através do id
select sum(valor_liq) from pedido; --Somatória de todos os itens da coluna valor líquido
select * from produto where nome like '%USB%'; --Busca na tabela através de uma palavra em específico, usando % para demonstrar que existem conteúdo antes ou depois da palavra destacada
select numero_depto, count(codigo) from produto group by numero_depto; --Recuperando quantos produtos há em cada um dos departamentos
select numero_depto, sum(preco*estoque) from produto group by numero_depto; --Recuperando a somatória dos produtos por departamento multiplicado pelo que está no estoque

select * from produto inner join departamento
    on produto.numero_depto = departamento.numero; --Junção fazendo a relação entre produto e departamento

select * from cliente inner join endereco
    on endereco.id_cliente = cliente.id;

-- Consultando de 3 tabelas diferentes
-- Passo 1: A partir dos pedidos, faço a junção com os itens do pedido
-- Passo 2: Fazer a junção com produto
-- Passo 3: Fazer a junção com cliente
select * from pedido inner join item_pedido on pedido.numero = item_pedido.numero_pedido
    inner join produto on produto.codigo = item_pedido.codigo_produto
    inner join cliente on pedido.id_cliente = cliente.id;

-- Mesma consulta anterior, porém buscando todos os dados do pedido + nome do cliente + o nome do produto comprado
select pedido.numero, pedido.data_pedido, pedido.valor_bruto, pedido.desconto, pedido.valor_liq,
    cliente.nome as 'Nome do cliente', produto.nome as 'Nome do produto' 
    from pedido inner join item_pedido on pedido.numero = item_pedido.numero_pedido
    inner join produto on produto.codigo = item_pedido.codigo_produto
    inner join cliente on pedido.id_cliente = cliente.id 
    order by pedido.numero;

-- Totais de pedidos por cliente, incluindo o nome do cliente
select cliente.nome, pedido.id_cliente, sum(pedido.valor_liq) from pedido
    inner join cliente on pedido.id_cliente = cliente.id 
    group by pedido.id_cliente;

-- Inserindo um novo departamento
insert into departamento values (null, "Moveis", "Moveis para escritórios e gamers de todas as idades");

-- Solução para isso: usar uma junçao externa (outer join)
select * from departamento left outer join produto
	on departamento.codigo = produto.departamento_codigo;
    
-- Agora usando right outer join
select * from produto right outer join departamento
	on departamento.codigo = produto.departamento_codigo;

-- Descobrindo qual o produto mais caro
select * from produto order by preco desc limit 1;
select * from produto having max(preco);
select * from produto where preco = (select max(preco) from produto);

-- Agora buscando os pedidos que contém este produto
select * from pedido inner join item_pedido on item_pedido.numero_pedido = pedido.numero
    where item_pedido.produto_codigo = (select codigo from produto having max(preco));

-- Caso agora eu queira o(s) cliente(s) que compraram esse produto mais caro
-- basta fazer na consulta externa uma junção com cliente
select * from cliente inner join pedido on cliente.id = pedido.id_cliente
    inner join item_pedido on item_pedido.numero_pedido = pedido.numero
    where item_pedido.codigo_produto = 
    (select codigo from produto having max(preco));
