package br.com.projeto.pessoa.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.pessoa.modelo.PessoaModelo;

// REPOSITORIO = FUNÇÕES SQL, e todo repositorio é interface

@Repository
public interface PessoaRepositorio extends CrudRepository<PessoaModelo, Long> {
    //findBy pode puxar qqr caracteristica da tabela
    //Iterable pq pode retornar mais de um
    //listar todas as pessoas com uma dada idade
    Iterable<PessoaModelo> findByIdade(int idade);

    //listar todos os registros ordenados por nome (A-Z)
    //findBy - sem nada no final, quer dizer que puxa tudo
    Iterable<PessoaModelo> findByOrderByNome();
    //mesma coisa, mas de (Z-A)
    Iterable<PessoaModelo> findByOrderByNomeDesc();

    Iterable<PessoaModelo> findByIdadeOrderByNome(int idade);
    
    //pessoas em que o nome tenha um termo especifico
    Iterable<PessoaModelo> findByNomeContaining(String termo);

    // listar pessoas onde o nome começa/termina com x termo
    Iterable<PessoaModelo> findByNomeStartsWith(String nome);
    Iterable<PessoaModelo> findByNomeEndsWith(String nome);

    //JPA NÃO dá suporte pra alguns comandos como SUM, MIN, MAX, AVG
    //exemplo de querry manual
    //retorna soma das idades
    @Query(value = "SELECT SUM(idade) FROM pessoas", nativeQuery = true)    //tem que usar essa annotation pra fazer manual,
                                                                            //nativeQuerry, precisa por true pra da certo
    int somaIdades();
    
    //metodo pra retornar pessoas acima de x anos
    //":" =  variavel, sem ":" = uma coluna
    @Query(value = "SELECT * FROM pessoas WHERE idade >= :idade", nativeQuery = true)
    Iterable<PessoaModelo> acimaIdade(int idade);
}