package br.com.projeto.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.atividade.modelo.MusicaModelo;
import br.com.projeto.atividade.repositorio.MusicaRepositorio;

@RestController
@RequestMapping("/musicas")
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
}
