package br.com.projeto.curso.modelo;
import org.springframework.stereotype.Component;

@Component
public class ErroModelo{
    private String mensagem;


    public String getMensagem() {
        return this.mensagem;
    }
    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

}