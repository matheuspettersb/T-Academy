let vetorMusicas = [];
let vetorArtistas = [];
let vetorPlaylists = [];

function obterMusicas(){
    fetch("http://localhost:8080/musica")
    .then(retorno => retorno.json())
    .then(musicas => vetorMusicas = musicas)
    .then(() => listarMusicas())
}

function obterArtistas(){
    fetch("http://localhost:8080/artista")
    .then(retorno => retorno.json())
    .then(artistas => vetorArtistas = artistas)
    .then(() => listarArtistas())
}

function obterPlaylists(){
    fetch("http://localhost:8080/playlist")
    .then(retorno => retorno.json())
    .then(playlists => vetorPlaylists = playlists)
    .then(() => listarPlaylists())
}


async function listarMusicas(){
    let espaco = document.getElementById("musicas");
    let retorno = await fetch(`http://localhost:8080/musica/contar`);
    let retJson = await retorno.json();
    let max = parseInt(retJson);
    for (let i=0; i<max ; i++){
        retorno = await fetch(`http://localhost:8080/musica/${i+1}`);
        retJson = await retorno.json();
        let musica = retJson;
        espaco.innerHTML += `<div class="card">
                                <h4>${musica.nome}<h4>
                                <a target="blank"class="btn btn-success" href="${musica.link}">Ouvir</a>
                                <button class="btn btn-warning" onclick="alterar(${musica.codigo})">Alterar</button>
                                <button class="btn btn-danger" onclick="excluir(${musica.codigo})">Excluir</button>
                            </div>`
    }
}

async function listarArtistas(){
    let espaco = document.getElementById("artistas");
    let retorno = await fetch(`http://localhost:8080/artista/contar`);
    let retJson = await retorno.json();
    let max = parseInt(retJson);
    for (let i=0; i<max ; i++){
        retorno = await fetch(`http://localhost:8080/artista/${i+1}`);
        retJson = await retorno.json();
        let artista = retJson;
        espaco.innerHTML += `<div class="card">
                                <h4>${artista.nome}<h4>
                                <button class="btn btn-danger" onclick="excluir(${artista.codigo})">Excluir</button>
                            </div>`
    }
}

async function listarPlaylists(){
    let espaco = document.getElementById("playlists");
    let retorno = await fetch(`http://localhost:8080/playlist/contar`);
    let retJson = await retorno.json();
    let max = parseInt(retJson);
    for (let i=0; i<max ; i++){
        retorno = await fetch(`http://localhost:8080/playlist/${i+1}`);
        retJson = await retorno.json();
        let playlist = retJson;
        espaco.innerHTML += `<div class="card">
                                <h4>${playlist.nome}<h4>
                                <button class="btn btn-danger" onclick="excluir(${playlist.codigo})">Excluir</button>
                            </div>`
    }
}

function formularioPadrao(){
    document.getElementById("nome").value = "";
    
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}