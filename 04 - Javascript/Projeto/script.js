let produtos = [];

//primeiro segmento: armas
let obj1 = {
    "nome":"Zweihander",
    "marca":"DarkSmithing",
    "valor":5999,
    "img":"zweihander.png",
    "estoque":10
}

let obj2 = {
    "nome":"Uchigatana",
    "marca":"DarkSmithing",
    "valor":4999,
    "img":"uchigatana.webp",
    "estoque":10
}

let obj3 = {
    "nome":"Wolf Knight's Greatsword",
    "marca":"DarkSmithing",
    "valor":9999,
    "img":"greatsword.png",
    "estoque":10
}

let obj4 = {
    "nome":"Moonlight Greatsword",
    "marca":"DarkSmithing",
    "valor":7999,
    "img":"moonlightgreatsword.webp",
    "estoque":10
}

let obj5 = {
    "nome":"Master Sword",
    "marca":"Biggoron Smith",
    "valor":7999,
    "img":"mastersword.webp",
    "estoque":10
}

let obj6 = {
    "nome":"Biggoron Sword",
    "marca":"Biggoron Smith",
    "valor":5999,
    "img":"biggorn.webp",
    "estoque":10
}

let obj7 = {
    "nome":"Queen's Sword",
    "marca":"Dormin's Forge",
    "valor":5999,
    "img":"queenssword.png",
    "estoque":10
}

let obj8 = {
    "nome":"Sword of Dormin",
    "marca":"Dormin's Forge",
    "valor":7999,
    "img":"swordofdormin.png",
    "estoque":10
}

let obj9 = {
    "nome":"Ancient Sword",
    "marca":"Dormin's Forge",
    "valor":6999,
    "img":"ancientsword.webp",
    "estoque":10
}


let obj10 = {
    "nome":"Chaoseater",
    "marca":"Warforge",
    "valor":9999,
    "img":"chaoseater.png",
    "estoque":10
}

//segundo segmento: itens
let obj11 = {
    "nome":"Clawshot",
    "marca":"Hyrule Artifacts",
    "valor":499,
    "img":"clawshot.webp",
    "estoque":10
}

let obj12 = {
    "nome":"Spinner",
    "marca":"Hyrule Artifacts",
    "valor":1199,
    "img":"spinner.png",
    "estoque":10
}

let obj13 = {
    "nome":"Hylian Shield",
    "marca":"Hyrule Artifacts",
    "valor":499,
    "img":"hylianshield.webp",
    "estoque":10
}

let obj14 = {
    "nome":"Bandana de Konoha",
    "marca":"Ichiraku",
    "valor":39,
    "img":"bandana.webp",
    "estoque":10
}

let obj15 = {
    "nome":"Bandana da Aliança Shinobi",
    "marca":"Ichiraku",
    "valor":39,
    "img":"bandanaguerra.webp",
    "estoque":10
}

let obj16 = {
    "nome":"Bandana Nukenin de Konoha",
    "marca":"Ichiraku",
    "valor":49,
    "img":"bandananukenin.png",
    "estoque":10
}

let obj17 = {
    "nome":"Kit 7 Esferas do Dragão",
    "marca":"Kakarotagens",
    "valor":199,
    "img":"esferas.png",
    "estoque":10
}

let obj18 = {
    "nome":"Kit Kunai e Shuriken",
    "marca":"Ichiraku",
    "valor":69,
    "img":"kunaikit.webp",
    "estoque":10
}

let obj19 = {
    "nome":"Kunai do Minato",
    "marca":"Ichiraku",
    "valor":59,
    "img":"kunaiminato.png",
    "estoque":10
}

let obj20 = {
    "nome":"Cajado Golden Guard",
    "marca":"Bad Witch Coven Antiques",
    "valor":349,
    "img":"cajado.png",
    "estoque":10
}

//segmento 3 =  roupas
let obj21 = {
    "nome":"Manto de Hokagem (Yondaime)",
    "marca":"Ichiraku",
    "valor":199,
    "img":"capa.png",
    "estoque":10
}

let obj22 = {
    "nome":"Manto Akatsuki",
    "marca":"Ichiraku",
    "valor":199,
    "img":"mantoakatsuki.png",
    "estoque":10
}

let obj23 = {
    "nome":"Manto Naruto Sennin",
    "marca":"Ichiraku",
    "valor":149,
    "img":"mantosennin.webp",
    "estoque":10
}

let obj24 = {
    "nome":"Casaco Modo Kurama",
    "marca":"Ichiraku",
    "valor":99,
    "img":"casacokurama.png",
    "estoque":10
}

let obj25 = {
    "nome":"Casaco Clã Uchiha",
    "marca":"Ichiraku",
    "valor":99,
    "img":"casacouchiha.webp",
    "estoque":10
}

let obj26 = {
    "nome":"Roupa Completa Link",
    "marca":"Hyrule Artifacts",
    "valor":599,
    "img":"botwcosplay.png",
    "estoque":10
}

let obj27 = {
    "nome":"Casaco Link",
    "marca":"Hyrule Artifacts",
    "valor":89,
    "img":"casacolink.png",
    "estoque":10
}

let obj28 = {
    "nome":"Tabardo Wander",
    "marca":"Terra Proibida Confecções",
    "valor":299,
    "img":"tabardo.png",
    "estoque":10
}

let obj29 = {
    "nome":"Casaco Colegial Goku",
    "marca":"Kakarotagens",
    "valor":149,
    "img":"gokudrip.png",
    "estoque":10
}

let obj30 = {
    "nome":"Fantasia Homem-Aranha",
    "marca":"Garagem do JJJ",
    "valor":69,
    "img":"miranha.png",
    "estoque":10
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
                                        <h4 class="preco">R$ ${produto.valor},00</h4>
                                        <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${selecionados[i]})">
                                    </div>
                                </div>`

        } else{
            row.innerHTML +=    `<div class="col-5">
                                    <div class="card cards">
                                        <img class="imagens" src="imagens/produtos/${produto.img}">
                                        <h4>${produto.nome}</h4>
                                        <h4 class="preco">R$ ${produto.valor},00</h4>
                                        <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${selecionados[i]})">
                                    </div>
                                </div>`
        }
    }
}

function termoPesquisar(){
    let pesquisa = document.getElementById("barraPesquisa");
    let termo = pesquisa.value;
    localStorage.setItem("pesquisa", JSON.stringify(termo));
}

function pesquisar(){
    let termoPesquisa = JSON.parse(localStorage.getItem("pesquisa"));
    termoPesquisa = termoPesquisa.toLowerCase();
    alert(termoPesquisa);
    let espaco = document.getElementById("pesquisaResultados");
    espaco.innerHTML = "";
    let string =`<h1 class="pesquisaRes">Resultado da pesquisa:</h1><div class="row">`;
    let j = 0;
    for(let i=0; i<produtos.length;i++){
        let produto = produtos[i];
        let nome = produto.nome.toLowerCase();
        if (nome.includes(termoPesquisa)){
            if (j%2==0){
                string +=  `<div class="col-5 offset-1">
                                <div class="card cards">
                                    <img class="imagens" src="imagens/produtos/${produto.img}">
                                    <h4>${produto.nome}</h4>
                                    <h4 class="preco">R$ ${produto.valor},00</h4>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${i})">
                                </div>
                            </div>`
        
            } else{
                string +=   `<div class="col-5">
                                <div class="card cards">
                                    <img class="imagens" src="imagens/produtos/${produto.img}">
                                    <h4>${produto.nome}</h4>
                                    <h4 class="preco">R$ ${produto.valor},00</h4>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${i})">
                                </div>
                            </div>`
            }
            j++;
        }
    }
    if (string == `<h1>Resultado da pesquisa:</h1><div class="row">`){
        espaco.innerHTML = `<div class="vazio">
                                <h3>Opa... não achamos nada que correspondesse a sua pesquisa, meu peixe.</h3>
                                <h4>Mas não seja por isso, temos vários produtos legais. Você pode dar uma olhadinha clicando nesse botão:</h4>
                                <div>
                                    <a href="index.html"><button class="btn btn-lg btn-primary" type="button">Voltar para a página incial</button></a>
                                </div>
                            </div>`
    } else {
        string += "</div>"
        espaco.innerHTML = string;
    }
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
                                    <h4 class="preco">R$ ${produto.valor},00</h4>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${i})">
                                </div>
                            </div>`

    } else{
        espaco.innerHTML +=    `<div class="col-5">
                                <div class="card cards">
                                    <img class="imagens" src="imagens/produtos/${produto.img}">
                                    <h4>${produto.nome}</h4>
                                    <h4 class="preco">R$ ${produto.valor},00</h4>
                                    <input type="button" class="btn btn-success" value="Adicionar ao carrinho" onclick="addCarrinho(${i})">
                                </div>
                            </div>`
    }
}

//começo do carrinho
let carrinho = [];

function carregaCarrinho(){
    carrinho = JSON.parse(localStorage.getItem("vetorCarrinho"));
}

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
        alert("Produto adicionado ao carrinho");
    } else{
        if (carrinho[posicao].qtd == carrinho[posicao].produto.estoque){
            alert("Você já atingiu o máximo desse produto no estoque")
        } else {
            carrinho[posicao].qtd++;
            alert("Produto adicionado ao carrinho");
        }  
    }
    ls();
}

function maisUm(id){
    let produto = carrinho[id];
    if (produto.qtd == produto.produto.estoque){
        alert("Você já atingiu o máximo desse produto no estoque")
    } else {
        produto.qtd++;
        ls();
        getCarrinho();
    }
}

function menosUm(id){
    let produto = carrinho[id];
    if (produto.qtd == 1){
        carrinho.splice(id, 1);
    } else {
        produto.qtd--;
    }
    ls();
    getCarrinho();
}

//na pg de carrinho
function removerCarrinho(id){
    carrinho.splice(id, 1);
    ls();
    getCarrinho();
}

//mostra todos os itens, só na classe carrinho
function getCarrinho(){
    visual = document.getElementById("carrinhoId");
    visual.innerHTML = "";
    if (carrinho.length == 0){
        visual.innerHTML = `<div class="vazio">
                                <h3>Ops... parece que seu carrinho está vazio, meu peixe.</h3>
                                <h4>Mas não seja por isso, temos vários produtos legais. Você pode dar uma olhadinha clicando nesse botão:</h4>
                                <div>
                                    <a href="index.html"><button class="btn btn-lg btn-primary" type="button">Voltar para a página incial</button></a>
                                </div>
                            </div>`
    } else {
        visual.innerHTML = `<h1 class="carrinhoTitulo">Carrinho:</h1>`;
        let totalCompra = 0;
            for (let i=0; i<carrinho.length;i++){
            let produtoAtual = carrinho[i];
            if (i%2==0){
            visual.innerHTML += `<div class="col-4 offset-2">
                                    <div class="card cards">
                                        <img class="imagens" src="imagens/produtos/${produtoAtual.produto.img}">
                                        <h4>${produtoAtual.produto.nome}</h4>
                                        <h5>Marca: ${produtoAtual.produto.marca}</h5>
                                        <h4 class="preco">R$ ${produtoAtual.produto.valor},00</h4>
                                        <div class="input-group mb-3">
                                            <button class="btn btn-outline-dark" type="button" onclick="menosUm(${i})" id="btnMenos">-</button> 
                                            <input type="text" class="form-control" readonly value=${produtoAtual.qtd}>
                                            <button class="btn btn-outline-dark" type="button" onclick="maisUm(${i})" id="btnMais">+</button>
                                            <button class="btn btn-outline-danger" type="button" onclick="removerCarrinho(${i})" id="btnRmv">Remover</button>
                                        </div>
                                    </div>
                                </div>`;
            totalCompra+= (produtoAtual.produto.valor*produtoAtual.qtd);
            }else{
            visual.innerHTML += `<div class="col-4">
                                    <div class="card cards">
                                        <img class="imagens" src="imagens/produtos/${produtoAtual.produto.img}">
                                        <h4>${produtoAtual.produto.nome}</h4>
                                        <h5>Marca: ${produtoAtual.produto.marca}</h5>
                                        <h4 class="preco">R$ ${produtoAtual.produto.valor},00</h4>
                                        <div class="input-group mb-3">
                                            <button class="btn btn-outline-dark" type="button" onclick="menosUm(${i})" id="btnMenos">-</button> 
                                            <input type="text" class="form-control" readonly value=${produtoAtual.qtd}>
                                            <button class="btn btn-outline-dark" type="button" onclick="maisUm(${i})" id="btnMais">+</button>
                                            <button class="btn btn-outline-danger" type="button" onclick="removerCarrinho(${i})" id="btnRmv">Remover</button>
                                        </div>
                                    </div>
                                </div>`;
            totalCompra+= (produtoAtual.produto.valor*produtoAtual.qtd);
            }
        }
    visual.innerHTML += `
                        <div class="col-12">
                        <div class="totalCompra">
                            <h1 class=>Total da compra: R$ ${totalCompra},00</h2>
                            <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">
                                <button class="btn btn-lg btn-primary">Finalizar Compra</button>
                            </a>
                        </div></div>`

    }
}

