package br.com.exemplo3.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "alunos")
public class AlunoModelo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String curso;

    @ManyToMany
    //Join Table, só pro MtM, gera tabela auxiliar
    @JoinTable( name = "alunos_cursos", 
                joinColumns = {@JoinColumn(name="codigo_aluno", referencedColumnName ="codigo")},
                inverseJoinColumns = {@JoinColumn(name = "codigo_curso", referencedColumnName = "codigo")}
              )
    private List<CursoModelo> cursos = new ArrayList<>();


    public long getCodigo() {
        return this.codigo;
    }
    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getCurso() {
        return this.curso;
    }
    public void setCurso(String curso) {
        this.curso = curso;
    }

    public List<CursoModelo> getCursos() {
        return this.cursos;
    }
    public void setCursos(List<CursoModelo> cursos) {
        this.cursos = cursos;
    }

}
