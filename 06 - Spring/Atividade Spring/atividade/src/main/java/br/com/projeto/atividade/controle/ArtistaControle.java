package br.com.projeto.atividade.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.atividade.modelo.ArtistaModelo;
import br.com.projeto.atividade.repositorio.ArtistaRepositorio;

@RestController
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
}
