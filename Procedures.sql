delimiter $$
CREATE PROCEDURE povoar_Livro(IN QntdLinhas INT)    -- Criado por --
BEGIN
	DECLARE qtde INT;
    DECLARE Titulo VARCHAR(45);
    DECLARE Ano INT;
    DECLARE Genero VARCHAR(45);
    set Ano = FLOOR(1950 + RAND() * (2025 - 1950));
    set qtde = 1;
    set Titulo = CONCAT("Sapataria", " ", qtde);
    set Genero = CONCAT("SAPATO", " ", qtde);
    
    while qtde <= QntdLinhas DO
		Insert Into Livros(Titulo, AnoPublicacao, Genero)
        VALUES (Titulo, Ano, Genero);
        set qtde = qtde + 1;
        set Titulo = CONCAT("Sapataria", " ", qtde);
        set Ano = FLOOR(1950 + RAND() * (2025 - 1950));
		set Genero = CONCAT("SAPATO", " ", qtde);
	end while;
end $$
delimiter ;

delimiter $$
CREATE PROCEDURE povoar_Autor(IN QntdLinhas INT)    -- Criado por --
BEGIN
	DECLARE qtde INT;
    DECLARE Nome VARCHAR(45);
    DECLARE Nacionalidade VARCHAR(45);
    set qtde = 1;
    set Nome = CONCAT("Meu PAU", " ", qtde);
    set Nacionalidade = CONCAT("Nacionalidade", " ", qtde);
    
    while qtde <= QntdLinhas DO
		Insert Into Autor(Nome, Nacionalidade)
        VALUES (Nome, Nacionalidade);
        set qtde = qtde + 1;
        set Nome = CONCAT("Meu PAU", " ", qtde);
		set Nacionalidade = CONCAT("Nacionalidade", " ", qtde);
	end while;
end $$
delimiter ;

delimiter $$
CREATE PROCEDURE povoar_Livros_has_Autor(IN QntdLinhas INT)    -- Criado por --
BEGIN
	DECLARE RandomAutor INT;
    DECLARE RandomLivros INT;
    DECLARE MenorRandomAutor INT;
    DECLARE MaiorRandomAutor INT;
    DECLARE MenorRandomLivros INT;
    DECLARE MaiorRandomLivros INT;
	DECLARE qtde INT;
    
    SET MenorRandomAutor = 1;
    SET MaiorRandomAutor = QntdLinhas;
    SET MenorRandomLivros = 1;
    SET MaiorRandomLivros = QntdLinhas;
    
    set qtde = 1;
    while qtde <= QntdLinhas DO
    
		set RandomAutor = ROUND(((MaiorRandomAutor - MenorRandomAutor) * RAND()) + MenorRandomAutor, 0);
        set RandomLivros = ROUND(((MaiorRandomLivros - MenorRandomLivros) * RAND()) + MenorRandomLivros, 0);
		Insert Into Livros_has_Autor
        VALUES (RandomLivros, RandomAutor);
        set qtde = qtde + 1;
	end while;
end $$
delimiter ;
