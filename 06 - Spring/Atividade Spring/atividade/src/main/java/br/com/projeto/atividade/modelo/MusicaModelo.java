package br.com.projeto.atividade.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="musicas")
@Getter
@Setter
public class MusicaModelo {
    //usando isso de PK pq nome pode ter igual de artistas diferentes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigoMusica;
    private String nome;
    private String link;
    //unica relação c o artista, vai dar update direto no artista dps pra appendar essa musica
    // artista que vai manter seus log da musica (ArtistaModelo cria a coluna cd_artista no banco)
    
}
