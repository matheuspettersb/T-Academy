let produtos = [];

//primeiro segmento: armas
let obj1 = {
    "nome":"Zweihander",
    "marca":"DarkSmithing",
    "valor":5999.90,
    "img":"zweihander.png"
}

let obj2 = {
    "nome":"Uchigatana",
    "marca":"DarkSmithing",
    "valor":4999.90,
    "img":"uchigatana.webp"
}

let obj3 = {
    "nome":"Wolf Knight's Greatsword",
    "marca":"DarkSmithing",
    "valor":9999.90,
    "img":"greatsword.png"
}

let obj4 = {
    "nome":"Moonlight Greatsword",
    "marca":"DarkSmithing",
    "valor":7999.90,
    "img":"moonlightgreatsword.webp"
}

let obj5 = {
    "nome":"Master Sword",
    "marca":"Biggoron Smith",
    "valor":7999.90,
    "img":"mastersword.webp"
}

let obj6 = {
    "nome":"Biggoron Sword",
    "marca":"Biggoron Smith",
    "valor":5999.90,
    "img":"biggorn.webp"
}

let obj7 = {
    "nome":"Queen's Sword",
    "marca":"Dormin's Forge",
    "valor":5999.90,
    "img":"queenssword.png"
}

let obj8 = {
    "nome":"Sword of Dormin",
    "marca":"Dormin's Forge",
    "valor":7999.90,
    "img":"swordofdormin.png"
}

let obj9 = {
    "nome":"Ancient Sword",
    "marca":"Dormin's Forge",
    "valor":6999.90,
    "img":"ancientsword.webp"
}


let obj10 = {
    "nome":"Chaoseater",
    "marca":"Warforge",
    "valor":9999.90,
    "img":"chaoseater.png"
}

//segundo segmento: itens
let obj11 = {
    "nome":"Clawshot",
    "marca":"Hyrule Artifacts",
    "valor":499.90,
    "img":"clawshot.webp"
}

let obj12 = {
    "nome":"Spinner",
    "marca":"Hyrule Artifacts",
    "valor":1199.90,
    "img":"spinner.png"
}

let obj13 = {
    "nome":"Hylian Shield",
    "marca":"Hyrule Artifacts",
    "valor":499.90,
    "img":"hylianshield.webp"
}

let obj14 = {
    "nome":"Bandana de Konoha",
    "marca":"Ichiraku",
    "valor":39.90,
    "img":"bandana.webp"
}

let obj15 = {
    "nome":"Bandana da Aliança Shinobi",
    "marca":"Ichiraku",
    "valor":39.90,
    "img":"bandanaguerra.webp"
}

let obj16 = {
    "nome":"Bandana Nukenin de Konoha",
    "marca":"Ichiraku",
    "valor":49.90,
    "img":"bandananukenin.png"
}

let obj17 = {
    "nome":"Kit 7 Esferas do Dragão",
    "marca":"Kakarotagens",
    "valor":199.90,
    "img":"esferas.png"
}

let obj18 = {
    "nome":"Kit Kunai e Shuriken",
    "marca":"Ichiraku",
    "valor":69.90,
    "img":"kunaikit.webp"
}

let obj19 = {
    "nome":"Kunai do Minato",
    "marca":"Ichiraku",
    "valor":59.90,
    "img":"kunaiminato.png"
}

let obj20 = {
    "nome":"Cajado Golden Guard",
    "marca":"Bad Witch Coven Antiques",
    "valor":349.90,
    "img":"cajado.png"
}

//segmento 3 =  roupas
let obj21 = {
    "nome":"Manto de Hokagem (Yondaime)",
    "marca":"Ichiraku",
    "valor":199.90,
    "img":"capa.png"
}

let obj22 = {
    "nome":"Manto Akatsuki",
    "marca":"Ichiraku",
    "valor":199.90,
    "img":"mantoakatsuki.png"
}

let obj23 = {
    "nome":"Manto Naruto Sennin",
    "marca":"Ichiraku",
    "valor":149.90,
    "img":"mantosennin.webp"
}

let obj24 = {
    "nome":"Casaco Modo Kurama",
    "marca":"Ichiraku",
    "valor":99.90,
    "img":"casacokurama.png"
}

let obj25 = {
    "nome":"Casaco Clã Uchiha",
    "marca":"Ichiraku",
    "valor":99.90,
    "img":"casacouchiha.webp"
}

let obj26 = {
    "nome":"Roupa Completa Link",
    "marca":"Hyrule Artifacts",
    "valor":599.90,
    "img":"botwcosplay.png"
}

let obj27 = {
    "nome":"Casaco Link",
    "marca":"Hyrule Artifacts",
    "valor":89.90,
    "img":"casacolink.png"
}

let obj28 = {
    "nome":"Tabardo Wander",
    "marca":"Terra Proibida Confecções",
    "valor":299.90,
    "img":"tabardo.png"
}

let obj29 = {
    "nome":"Casaco Colegial Goku",
    "marca":"Kakarotagens",
    "valor":149.90,
    "img":"gokudrip.png"
}

let obj30 = {
    "nome":"Fantasia Homem-Aranha",
    "marca":"Garagem do JJJ",
    "valor":69.90,
    "img":"miranha.png"
}
produtos.push(obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16, obj17, obj18, obj19, obj20, obj21, obj22, obj23, obj24, obj25, obj26, obj27, obj28, obj29, obj30);

//começo do projeto de verdade
let selecionados = [];

function getDestaques(){;
    for (let i=0; i<12; i++){
        let numero = Math.floor(Math.random() * 30);
        while(selecionados.includes(numero)){
            numero = Math.floor(Math.random() * 30);
        }
        selecionados.push(numero);
    }

    let row = document.getElementById("destaques")
    for (let i=0; i<12; i++){
        let produto = produtos[selecionados[i]];
        if (i%2==0){
            row.innerHTML +=    `<div class="col-5 offset-1">
                                    <div class="card cards">
                                        <img class="imagens" src="imagens/produtos/${produto.img}">
                                        <h4>${produto.nome}</h4>
                                        <h4 class="preco">R$ ${produto.valor}0</h4>
                                        <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="carrinho(${selecionados[i]})">
                                    </div>
                                </div>`

        } else{
            row.innerHTML +=    `<div class="col-5">
                                    <div class="card cards">
                                        <img class="imagens" src="imagens/produtos/${produto.img}">
                                        <h4>${produto.nome}</h4>
                                        <h4 class="preco">R$ ${produto.valor}0</h4>
                                        <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="carrinho(${selecionados[i]})">
                                    </div>
                                </div>`
        }
    }
}

let termoPesquisa = "";
function termoPesquisar(){
    let pesquisa = document.getElementById("barraPesquisa");
    let termo = pesquisa.value;
    termoPesquisa = termo;
    pesquisar();
}

function pesquisar(){
//pega o termo pesquisa e procura
alert(termoPesquisa);
}

function getArmas(){
    let espaco = document.getElementById("armas");
    for (let i=0; i<10; i++){
        let produto = produtos[i];
        getProdutosGeral(espaco, produto, i)
    }
}

function getItens(){
    let espaco = document.getElementById("itens");
    for (let i=10; i<20; i++){
        let produto = produtos[i];
        getProdutosGeral(espaco, produto, i)
    }
}

function getRoupas(){
    let espaco = document.getElementById("roupas");
    for (let i=20; i<30; i++){
        let produto = produtos[i];
        getProdutosGeral(espaco, produto, i)
    }
}

//vai adicionando 1 a 1 os produtos
function getProdutosGeral(espaco, produto, i){
    if (i%2==0){
        espaco.innerHTML +=    `<div class="col-5 offset-1">
                                <div class="card cards">
                                    <img class="imagens" src="imagens/produtos/${produto.img}">
                                    <h4>${produto.nome}</h4>
                                    <h4 class="preco">R$ ${produto.valor}0</h4>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${i})">
                                </div>
                            </div>`

    } else{
        espaco.innerHTML +=    `<div class="col-5">
                                <div class="card cards">
                                    <img class="imagens" src="imagens/produtos/${produto.img}">
                                    <h4>${produto.nome}</h4>
                                    <h4 class="preco">R$ ${produto.valor}0</h4>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${i})">
                                </div>
                            </div>`
    }
}

//começo do carrinho
let carrinho = [];

function ls(){
    localStorage.setItem("vetorCarrinho", JSON.stringify(carrinho));
}

//cadastrando os produtos no carrinho (por fora do carrinho)
function addCarrinho(id){
    //procurando por nome
    let nome_produto = produtos[id].nome;
    // Obter a posição que está o produto
    let posicao = carrinho.findIndex(e=> {return e.produto.nome == nome_produto});
    if (posicao == -1){
        let obj = {
            "produto":produtos[id],
            "qtd":1
        }
        carrinho.push(obj);
    } else{

        carrinho[posicao].qtd++;    
    }
    ls();
}

function maisUm(){

}

function menosUm(){

}

//na pg de carrinho
function removerCarrinho(id){
    carrinho.splice(id, 1);
    ls();
    getCarrinho();
}

//mostra todos os itens, só na classe carrinho
function getCarrinho(){
    carrinho = JSON.parse(localStorage.getItem("vetorCarrinho"));
    visual = document.getElementById("carrinhoClass");
    if (carrinho.length == 0){
        visual.innerHTML = `<div class="vazio">
                                <h3>Ops... parece que seu carrinho está vazio, meu peixe.</h3>
                                <h4>Mas não seja por isso, temos vários produtos legais. Você pode dar uma olhadinha clicando nesse botão:</h4>
                                <div>
                                    <a href="index.html"><button class="btn btn-lg btn-primary" type="button">Voltar para a página incial</button></a>
                                </div>
                            </div>`
    } else {
        visual.innerHTML = `<h2>Carrinho:</h2>
                            <div class="container">`;
        for (let i=0; i<carrinho.length;i++){
            let produtoAtual = carrinho[i];
            visual.innerHTML += `<div class="card cards">
                                    <img class="imagens" src="imagens/produtos/${produtoAtual.produto.img}">
                                    <h4>${produtoAtual.produto.nome}</h4>
                                    <h5>Marca: ${produtoAtual.marca}</h5>
                                    <h4 class="preco">R$ ${produtoAtual.produto.valor}0</h4>
                                    <div class="input-group mb-3">
                                        <button class="btn btn-outline-dark" type="button" id="btnMenos">-</button> 
                                        <input type="text" class="form-control" readonly value=${produtoAtual.qtd}>
                                        <button class="btn btn-outline-dark" type="button " id="btnMais">+</button>
                                    </div>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="carrinho(${i})">
                                </div>
                                <hr>`;
                                //adicionar o onclick nos botoes
        }
        visual.innerHTML -= "<hr>";
    }
}

