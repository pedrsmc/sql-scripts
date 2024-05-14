SELECT * FROM Cliente;

INSERT INTO Cliente(nome, telefone) values ('Adalberto','71985474526');

SELECT nome, id from Cliente;

UPDATE Cliente SET telefone = "71922225555" WHERE id = 2; 

DELETE FROM Cliente WHERE id = 1;