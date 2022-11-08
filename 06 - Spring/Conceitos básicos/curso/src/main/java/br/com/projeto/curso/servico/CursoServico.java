package br.com.projeto.curso.servico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import br.com.projeto.curso.modelo.CursoModelo;
import br.com.projeto.curso.modelo.ErroModelo;
import br.com.projeto.curso.repositorio.CursoRepositorio;

@Service
public class CursoServico {

    @Autowired
    private ErroModelo erro_modelo;

    @Autowired
    private CursoRepositorio acao; 
    //responseEntity = n sabe oq vai retornar, mas é algo
    public ResponseEntity<?> cadastrar(CursoModelo obj){
        if (obj.getNome().equals("")){
            erro_modelo.setMensagem("Nome do curso é obrigatório.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else if (obj.getNome().length()<5){
            erro_modelo.setMensagem("Nome do curso precisa ter pelo menos 5 caracteres");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else if (obj.getValor()<=0){
            erro_modelo.setMensagem("Valor do curso inválido.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        } else if(acao.countByNome(obj.getNome())>0){
            erro_modelo.setMensagem("Curso já informado.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        }else{
        return new ResponseEntity<CursoModelo>(acao.save(obj), HttpStatus.OK);
        }
    }

    public ResponseEntity<?> selecionar(){
        if (acao.count() == 0){
            erro_modelo.setMensagem("Não há cursos cadastrados");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.OK);
        } else {
            return new ResponseEntity<Iterable<CursoModelo>>(acao.findAll(), HttpStatus.OK);
        }
    }

    //metodo responsavel por remover um curso
    public ResponseEntity<?> remover(long codigo){
        if(acao.countByCodigo(codigo) == 0){
            erro_modelo.setMensagem("O código informado não existe");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.NOT_FOUND);
        } else {
            acao.deleteById(codigo);
            erro_modelo.setMensagem("Curso removido com sucesso");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.OK);
        }
    }
}
