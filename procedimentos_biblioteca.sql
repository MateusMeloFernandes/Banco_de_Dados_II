DELIMITER $$
CREATE PROCEDURE povoar_Autores(num_autores INT)
BEGIN
DECLARE id_autor INT;
SET id_autor = 1;

WHILE id_autor <= num_autores DO
    INSERT INTO Autor (nome, nacionalidade)
    VALUES (CONCAT('Autor ', id_autor), CONCAT('País ', id_autor));
    SET id_autor = id_autor + 1;
END WHILE;
END $$
DELIMITER ;

-- Procedimento para popular a tabela `Autor_has_Livros`
DELIMITER $$
CREATE PROCEDURE povoar_Autor_has_Livros(num_relacoes INT)
BEGIN
    DECLARE id_relacao INT;
    SET id_relacao = 1;

    DECLARE id_autor INT;
    DECLARE id_livro INT;

    WHILE id_relacao <= num_relacoes DO
        SELECT
            FLOOR(RAND() * (SELECT MAX(idAutor) FROM Autor)) + 1 AS id_autor,
            FLOOR(RAND() * (SELECT MAX(idLivros) FROM Livros)) + 1 AS id_livro;

        INSERT INTO Autor_has_Livros (Autor_idAutor, Livros_idLivros)
        VALUES (id_autor, id_livro);

        SET id_relacao = id_relacao + 1;
    END WHILE;

    END $$
DELIMITER ;