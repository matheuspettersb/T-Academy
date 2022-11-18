package br.com.projeto.dto.dtoUsuario;

import br.com.projeto.dto.modelo.UsuarioModelo;

public class DtoUsuario {
    private String nome;
    private String email;
    private String senha;
    private String nivel;
    //intermediario entre a requisição e o usuarioModelo

    //transformar em um objeto do tipo UsuarioModelo
    public UsuarioModelo tranformarUsuarioModelo(){
        return new UsuarioModelo(nome, email, senha, nivel);
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

    public String getSenha() {
        return this.senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNivel() {
        return this.nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

}
