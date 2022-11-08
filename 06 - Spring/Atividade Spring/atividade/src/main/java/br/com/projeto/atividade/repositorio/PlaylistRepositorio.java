package br.com.projeto.atividade.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.atividade.modelo.PlaylistModelo;

@Repository
public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long>{
    
}
