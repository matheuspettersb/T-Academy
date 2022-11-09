package br.com.projeto.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.atividade.modelo.MusicaModelo;
import br.com.projeto.atividade.modelo.PlaylistModelo;
import br.com.projeto.atividade.repositorio.PlaylistRepositorio;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/playlist")
public class PlaylistControle {
    
    @Autowired
    private PlaylistRepositorio acao;

    @PostMapping("")
    private PlaylistModelo cadastrar(@RequestBody PlaylistModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    private Iterable<PlaylistModelo> selecionar(){
        return acao.findAll();
    }

    @DeleteMapping("/{codigo}")
    private void deletar(@PathVariable long codigo){
        //excluir entrys com o cd_playlist da tabela auxiliar
        acao.deleteById(codigo);
    }

    @PutMapping("/{codigo}")
    private PlaylistModelo alterar(@RequestBody MusicaModelo obj, @PathVariable long codigo){
        PlaylistModelo pl = acao.findByCodigo(codigo);
        pl.getMusicas().add(obj);
        return acao.save(pl);
    }
    
    //get musica pelo codigo
    @GetMapping("/{codigo}")
    private PlaylistModelo procurarCodigo(@PathVariable long codigo){
        return acao.findByCodigo(codigo);
    }

    //count
    @GetMapping("/contar")
    private long contar(){
        return acao.count();
    }
}
