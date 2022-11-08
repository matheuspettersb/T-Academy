package br.com.exemplo3.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.exemplo3.modelo.CursoModelo;

@Repository
public interface CursoRepositorio extends CrudRepository<CursoModelo, Long>{
    
}
