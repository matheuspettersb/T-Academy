package br.com.projeto.dto.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.dto.dtoUsuario.DtoUsuario;
import br.com.projeto.dto.dtoUsuario.RetornoDtoUsuario;
import br.com.projeto.dto.modelo.UsuarioModelo;
import br.com.projeto.dto.repositorio.UsuarioRepositorio;

@RestController
public class UsuarioControle {

    @Autowired
    private UsuarioRepositorio acao;

    @PostMapping("")
    private RetornoDtoUsuario cadastrar(@RequestBody DtoUsuario usuario){
        UsuarioModelo usuarioModelo = acao.save(usuario.tranformarUsuarioModelo());
        return RetornoDtoUsuario.retornoDTO(usuarioModelo);
    }   
}
