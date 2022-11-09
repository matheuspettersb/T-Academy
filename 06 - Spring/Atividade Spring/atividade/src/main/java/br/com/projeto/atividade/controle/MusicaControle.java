package br.com.projeto.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.atividade.modelo.MusicaModelo;
import br.com.projeto.atividade.repositorio.MusicaRepositorio;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/musica")
public class MusicaControle {
    
    @Autowired
    private MusicaRepositorio acao;

    @PostMapping("")
    private MusicaModelo cadastrar(@RequestBody MusicaModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    private Iterable<MusicaModelo> selecionar(){
        return acao.findAll();
    }

    @DeleteMapping("/{codigo}")
    private void deletar(@PathVariable long codigo){
        //ver se está em playlist e deletar de lá primeiro
        acao.deleteById(codigo);
    }

    //pegar musica pelo codigo
    @GetMapping("/{codigo}")
    private MusicaModelo procurarCodigo(@PathVariable long codigo){
        return acao.findByCodigoMusica(codigo);
    }

    //count
    @GetMapping("/contar")
    private long contar(){
        return acao.count();
    }
}
