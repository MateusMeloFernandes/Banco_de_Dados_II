DELIMITER $$
CREATE PROCEDURE popular_autor(IN qtde_autores INT)
BEGIN
  DECLARE id_autor INT;
  DECLARE nome VARCHAR(45);
  DECLARE nacionalidade VARCHAR(45);
  DECLARE idade INT(2);


  WHILE id_autor <= qtde_autores DO
	INSERT INTO Autor (nome, nacionalidade, idade)
    VALUES (id_autor, nome, nacionalidade, idade)
    SET nome = CONCAT('Autor-', id_autor);
    SET nacionalidade = CONCAT('Pais-', RAND() * 100);
    SET idade = RAND() * 70 + 18;
	SET id_autor = id_autor + 1;
    
    END
    DELIMITER ;