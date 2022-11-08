package br.com.exemplo3.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "cursos")
public class CursoModelo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String aluno;
    
    @ManyToMany(mappedBy = "cursos") //puxa o msm nome do arrayList da outra classe
    private List<AlunoModelo> alunos = new ArrayList<>();


    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getAluno() {
        return this.aluno;
    }

    public void setAluno(String aluno) {
        this.aluno = aluno;
    }

    public List<AlunoModelo> getAlunos() {
        return this.alunos;
    }

    public void setAlunos(List<AlunoModelo> alunos) {
        this.alunos = alunos;
    }

}
