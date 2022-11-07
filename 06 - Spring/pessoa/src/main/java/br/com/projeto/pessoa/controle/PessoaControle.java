package br.com.projeto.pessoa.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import br.com.projeto.pessoa.modelo.PessoaModelo;
import br.com.projeto.pessoa.repositorio.PessoaRepositorio;


// classe controleer = quem vai definir os mappings (crud)
@RestController
public class PessoaControle {

    @Autowired
    private PessoaRepositorio acao;
    
    @PostMapping("")
    public PessoaModelo cadastrar(@RequestBody PessoaModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<PessoaModelo> listar(){
        return acao.findAll();
    }

    @GetMapping("/contar")
    public long contaRegistros(){
        return acao.count();
    }

    @GetMapping("/listarIdade/{idade}")
    public Iterable<PessoaModelo> listarPessoasIdade(@PathVariable int idade){
        return acao.findByIdade(idade);
    }

    @GetMapping("/listarIdadeAlfabetica/{idade}")
    public Iterable<PessoaModelo> listarPessoasIdadeAlf(@PathVariable int idade){
        return acao.findByIdadeOrderByNome(idade);
    }

    @GetMapping("/ordenarNomeASC")
    public Iterable<PessoaModelo> ordenarNomes(){
        return acao.findByOrderByNome();
    }
    
    @GetMapping("/ordenarNomeDESC")
    public Iterable<PessoaModelo> ordenarNomesDesc(){
        return acao.findByOrderByNomeDesc();
    }

    @GetMapping("/nomeContem/{termo}")
    public Iterable<PessoaModelo> nomeContem(@PathVariable String termo){
        return acao.findByNomeContaining(termo);
    }

    @GetMapping("/nomeComeca/{termo}")
    public Iterable<PessoaModelo> nomeComeca(@PathVariable String termo){
        return acao.findByNomeStartsWith(termo);
    }

    @GetMapping("/nomeTermina/{termo}")
    public Iterable<PessoaModelo> nomeTermina(@PathVariable String termo){
        return acao.findByNomeEndsWith(termo);
    }

    @GetMapping("/somaIdades")
    public int somaIdades(){
        return acao.somaIdades();
    }
    
    @GetMapping("/idadeMaior/{idade}")
    public Iterable<PessoaModelo> idadeMaior(@PathVariable int idade){
        return acao.acimaIdade(idade);
    }

}
