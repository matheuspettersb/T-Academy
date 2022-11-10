package br.com.projeto.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.atividade.modelo.ArtistaModelo;
import br.com.projeto.atividade.modelo.MusicaModelo;
import br.com.projeto.atividade.repositorio.ArtistaRepositorio;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/artista")
public class ArtistaControle {
    
    @Autowired
    private ArtistaRepositorio acao;

    @PostMapping("")
    private ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    private Iterable<ArtistaModelo> selecionar(){
        return acao.findAll();
    }

    @DeleteMapping("/{codigo}")
    private ResponseEntity<?> deletar(@PathVariable long codigo){
        //ver se tem musica linkada pra ver se pode antes
        ArtistaModelo a = acao.findByCodigo(codigo);
        if (a.getMusicas().size()>0){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        } else {
            acao.deleteById(codigo);
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }

    @PutMapping("/{codigo}")
    private ArtistaModelo adicionaMusica(@RequestBody MusicaModelo obj, @PathVariable long codigo){
        ArtistaModelo a = acao.findByCodigo(codigo);
        a.getMusicas().add(obj);
        return acao.save(a);        
    }

    //procurar pelo nome
    @GetMapping("/nome/{termo}")
    public Iterable<ArtistaModelo> procuraNome(@PathVariable String termo){
        return acao.findByNomeContaining(termo);
    }


    @GetMapping("/{codigo}")
    public ArtistaModelo procuraCodigo(@PathVariable long codigo){
        return acao.findByCodigo(codigo);
    }

    //contar
    @GetMapping("/contar")
    public long contar(){
        return acao.count();
    }

    @PutMapping("/alteraNome/{codigo}")
    public ArtistaModelo alterarNome(@PathVariable long codigo, @RequestBody String nome){
        ArtistaModelo a = acao.findByCodigo(codigo);
        a.setNome(nome);
        return acao.save(a);
    }

}
