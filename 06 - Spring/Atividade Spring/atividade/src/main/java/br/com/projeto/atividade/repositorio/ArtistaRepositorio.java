package br.com.projeto.atividade.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.binding.QuerydslPredicate;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.atividade.modelo.ArtistaModelo;

@Repository
public interface ArtistaRepositorio extends CrudRepository<ArtistaModelo, Long>{
    ArtistaModelo findByCodigo(long codigo);
    Iterable<ArtistaModelo> findByNomeContaining(String termo);

    @Query(value = "SELECT MAX(codigo) FROM artistas", nativeQuery = true)
    int counter();

}
