package br.com.projeto.curso.repositorio;

import org.springframework.data.repository.CrudRepository;
import br.com.projeto.curso.modelo.CursoModelo;

public interface CursoRepositorio extends CrudRepository<CursoModelo, Long>{
    // retorna a qtd de cursos c x nome
    int countByNome(String nome);
    
    // retorna a qtd de cursos c x codigo
    int countByCodigo(long codigo);
}
