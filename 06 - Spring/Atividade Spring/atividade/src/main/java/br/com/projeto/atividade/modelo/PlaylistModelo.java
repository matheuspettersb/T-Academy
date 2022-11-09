package br.com.projeto.atividade.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="playlists")
@Getter
@Setter
public class PlaylistModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String nome;
    
    @ManyToMany
    @JoinTable( name = "musicas_playlists",
                joinColumns = {@JoinColumn(name = "cd_playlist", referencedColumnName = "codigo")},
                inverseJoinColumns = {@JoinColumn(name = "cd_musica", referencedColumnName = "codigoMusica")}
              )
    private List<MusicaModelo> musicas = new ArrayList<>();
}
