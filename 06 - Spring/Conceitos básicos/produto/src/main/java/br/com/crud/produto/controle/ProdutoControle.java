package br.com.crud.produto.controle;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.crud.produto.modelo.ProdutoModelo;
import br.com.crud.produto.repositorio.ProdutoRepositorio;

@RestController
@CrossOrigin(origins = "*")
public class ProdutoControle {
    
    @Autowired      //injeção de dependencia
    private ProdutoRepositorio pr;

    @GetMapping("")
    public Iterable<ProdutoModelo> listar(){
        return pr.findAll();
    }

    @GetMapping("{codigo}")
    public Optional<ProdutoModelo> filtrar(@PathVariable int codigo){   //optinal =  retorno do metodo, pode ser qqr coisa
        return pr.findById(codigo);
    }    

    @PostMapping("")
    public ProdutoModelo cadastrar(@RequestBody ProdutoModelo obj){
        return pr.save(obj);
    }

    @PutMapping("")
    public ProdutoModelo alterar(@RequestBody ProdutoModelo obj){
        return pr.save(obj);
    }

    @DeleteMapping("{codigo}")
    public void remover(@PathVariable int codigo){   //nome do mapping precisa ser o mesmo q nessa linha
        pr.deleteById(codigo);
    }
}
