package br.com.projeto.dto.dtoUsuario;

import br.com.projeto.dto.modelo.UsuarioModelo;

public class RetornoDtoUsuario {
    private long codigo;
    private String nome;
    private String email;
    private String nivel;

    //construtor que volta
    public RetornoDtoUsuario(UsuarioModelo usuarioModelo){
        this.codigo = usuarioModelo.getCodigo(); 
        this.nome = usuarioModelo.getNome(); 
        this.email = usuarioModelo.getEmail(); 
        this.nivel = usuarioModelo.getNivel();
    }

    //retornar as caracteristicas do json
    public static RetornoDtoUsuario retornoDTO(UsuarioModelo usuario){
        return new RetornoDtoUsuario(usuario);
    }
    
    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNivel() {
        return this.nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    
}
