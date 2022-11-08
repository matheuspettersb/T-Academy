package br.com.projeto.atividade.modelo;

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
    @ManyToMany
    @JoinTable( name = "musicas_playlists",
                joinColumns = {@JoinColumn(name = "cd_musica", referencedColumnName = "codigoMusica")},
                inverseJoinColumns = {@JoinColumn(name = "cd_playlist", referencedColumnName = "codigo")}
              )
    private List<PlaylistModelo> playlists = new ArrayList<>();
}
