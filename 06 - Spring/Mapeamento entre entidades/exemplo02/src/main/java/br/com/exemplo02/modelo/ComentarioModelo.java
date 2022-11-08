package br.com.exemplo02.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comentarios")
public class ComentarioModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String autor;
    private String texto;


    public long getCodigo() {
        return this.codigo;
    }
    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getAutor() {
        return this.autor;
    }
    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getTexto() {
        return this.texto;
    }
    public void setTexto(String texto) {
        this.texto = texto;
    }

}
