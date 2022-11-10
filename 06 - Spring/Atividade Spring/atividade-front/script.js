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
    espaco.innerHTML = "";
    let retorno = await fetch(`http://localhost:8080/musica/contar`);
    let retJson = await retorno.json();
    let max = parseInt(retJson);
    for (let i=0; i<max ; i++){
        retorno = await fetch(`http://localhost:8080/musica/${i+1}`);
        retJson = await retorno.json();
        let musica = retJson;
        espaco.innerHTML += `<div class="card">
                                <h4>${musica.nome}<h4>
                                <a target="blank"class="btn btn-primary" href="${musica.link}">Ouvir</a>
                                <button class="btn btn-success" onclick="selecionarMusica(${musica.codigo})">Selecionar</button>
                            </div>`
    }
}

async function listarArtistas(){
    let espaco = document.getElementById("artistas");
    espaco.innerHTML = "";
    let retorno = await fetch(`http://localhost:8080/artista/contar`);
    let retJson = await retorno.json();
    let max = parseInt(retJson);
    for (let i=0; i<max ; i++){
        retorno = await fetch(`http://localhost:8080/artista/disponivel/${i+1}`);
        if (retorno.status == 200){
            retorno = await fetch(`http://localhost:8080/artista/${i+1}`);
            retJson = await retorno.json();
            let artista = retJson;
            espaco.innerHTML += `<div class="card">
                                    <h4>${artista.nome}<h4>
                                    <button class="btn btn-success" onclick="selecionarArtista(${artista.codigo})">Selecionar</button>
                                </div>`
        } else {
        }
    }
}

async function listarPlaylists(){
    let espaco = document.getElementById("playlists");
    espaco.innerHTML = "";
    let retorno = await fetch(`http://localhost:8080/playlist/contar`);
    let retJson = await retorno.json();
    let max = parseInt(retJson);
    for (let i=0; i<max ; i++){
        retorno = await fetch(`http://localhost:8080/playlist/${i+1}`);
        retJson = await retorno.json();
        let playlist = retJson;
        espaco.innerHTML += `<div class="card">
                                <h4>${playlist.nome}<h4>
                                <button class="btn btn-success" onclick="SelecionarPlaylist(${playlist.codigo})">Selecionar</button>
                            </div>`
    }
}

function formularioPadrao(){
    document.getElementById("nome").value = "";
    document.getElementById("codigo").value = "";
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnExcluir").style.display = "none";
}

function cadastrarArtista(){
    let nome = document.getElementById("nome").value;
    if (nome.length<1 || nome.trim().length == 0){
        alert("O nome não pode ser vazio")
    } else {
        obj =   {
                    "nome":nome
                }
    fetch(`http://localhost:8080/artista`, {
        method:"POST",
        headers:{
            "accept":"application/json",
            "content-type":"application/json"
        },
        body:JSON.stringify(obj)
    })
    .then(retorno => retorno.json())
    .then(retJ =>{
        vetorArtistas.push(retJ);
        obterArtistas();
        formularioPadrao();
    })
    }
}

function selecionarArtista(codigo){
    fetch(`http://localhost:8080/artista/${codigo}`)
    .then(retorno => retorno.json())
    .then(retJson =>{
        
        document.getElementById("nome").value = retJson.nome;
        document.getElementById("codigo").value=retJson.codigo;
        document.getElementById("btnCadastrar").style.display = "none";
        document.getElementById("btnAlterar").style.display = "inline-block";
        document.getElementById("btnExcluir").style.display = "inline-block";
    })
}

function alterarArtista(){
    let nome = document.getElementById("nome").value;
    if (nome.length<1 || nome.trim().length == 0){
        alert("O nome não pode ser vazio")
    }else{
        let codigo = document.getElementById("codigo").value;
        fetch(`http://localhost:8080/artista/alteraNome/${codigo}`,{
            method:"PUT",
            headers:{
                "accept":"application/json",
                "content-type":"application/json"
            },
            body:nome
        })
        formularioPadrao();
        obterArtistas();
    }
}

function excluirArtista(){
    let codigo = document.getElementById("codigo").value;
    fetch(`http://localhost:8080/artista/${codigo}`, {method:"DELETE"})
    .then(r => {
        if (r.status == 200){   
        } else {
            alert("Não pode remover o artista pois ele tem musicas cadastradas");
        }
    })
    formularioPadrao();
    obterArtistas();
}

function selecionarMusica(codigo){
    fetch(`http://localhost:8080/artista/${codigo}`)
    .then(retorno => retorno.json())
    .then(retJson =>{
        
        document.getElementById("nome").value = retJson.nome;
        document.getElementById("link").value = retJson.link;
        document.getElementById("codigo").value=retJson.codigo;
        document.getElementById("btnCadastrar").style.display = "none";
        document.getElementById("btnAlterar").style.display = "inline-block";
        document.getElementById("btnExcluir").style.display = "inline-block";
    })
}