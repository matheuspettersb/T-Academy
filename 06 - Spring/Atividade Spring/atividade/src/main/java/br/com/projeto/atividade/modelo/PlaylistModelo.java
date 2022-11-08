package br.com.projeto.atividade.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
    @ManyToMany(mappedBy = "playlists") //puxa o msm nome do arrayList da outra classe
    private List<MusicaModelo> musicas = new ArrayList<>();
}
