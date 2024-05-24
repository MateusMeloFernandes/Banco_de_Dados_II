DROP procedure povoar_Livro;
DROP procedure povoar_Autor;
DROP procedure povoar_Livros_has_Autor;

CALL povoar_Livro(1000);
CALL povoar_Autor(1000);
CALL povoar_Livros_has_Autor(1000);

create index idx_livro on livros_has_autor (Livros_idLivro, Autor_idAutor);

select l.Titulo, a.Nome
from livros AS l
JOIN livros_has_autor AS la ON (l.idLivro = la.Livros_idLivro)
JOIN autor AS a on (la.Autor_idAutor = a.idAutor)
JOIN autor AS b
WHERE a.Nome = ;

-- 923.25 --
select *
from Livros;

select *
from Autor;
select *
from Livros_has_Autor ORDER BY Livros_idLivro;

ALTER TABLE Autor
ADD INDEX autor_name_idx (Nome);

alter table Livros
ADD INDEX livros_Titulo_idx (Titulo);

drop index livros_Titulo_idx on Livros;

-- 33672.43   ;   

select Titulo, COUNT(Nome)         -- Escrito por --
from livros l
left join Livros_has_Autor la on (l.idLivro = la.Livros_idLivro)
left join Autor a on (a.idAutor = la.Autor_idAutor)
group by Titulo
order by COUNT(Nome) desc;

select AnoPublicacao, COUNT(Nome)        -- Escrito por --
from livros l
left join Livros_has_Autor la on (l.idLivro = la.Livros_idLivro)
left join Autor a on (a.idAutor = la.Autor_idAutor)
group by AnoPublicacao
order by COUNT(Nome) desc
limit 10;

select Nome                       -- Escrito por --
from Autor a inner join Livros_has_Autor la on (a.idAutor = la.Autor_idAutor)
where la.Livros_idLivro = 999
order by idAutor;

select Titulo, AnoPublicacao
from Livros
where AnoPublicacao <= 2024 && AnoPublicacao >2000 ;


select titulo
from livros;


