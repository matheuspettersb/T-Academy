package br.com.crud.produto.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity                     //Diz que tem q criar uma tabela
@Table (name = "produtos")  //serve pra trocar o nome da tabela no banco.
                            //Se n por nada ficaria "produto-modelo"

public class ProdutoModelo {
    @Id                     //declara pk
    @GeneratedValue(strategy = GenerationType.IDENTITY) //auto increment
    private int codigo;
    private String nome;    //varchar(255)
    private double valor;

    public int getCodigo() {
        return this.codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return this.valor;
    }
    public void setValor(double valor) {
        this.valor = valor;
    }

}
