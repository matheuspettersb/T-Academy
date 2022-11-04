// vetor de produtos
let vetor = [];

window.onload = function(){
    obterProdutos();
}

function obterProdutos(){
    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
    .then(() => listarProdutos());
}

function listarProdutos(){
    let tabela = document.getElementById("tabela");
    tabela.innerHTML="";

    for(let i=0; i<vetor.length;i++){
        let linha = tabela.insertRow(-1);

        let colunaCodigo = linha.insertCell(0); 
        let colunaNome = linha.insertCell(1); 
        let colunaValor = linha.insertCell(2); 
        let colunaSelecionar = linha.insertCell(3);

        colunaCodigo.innerText = vetor[i].codigo; 
        colunaNome.innerText = vetor[i].nome;
        colunaValor.innerText = vetor[i].valor; 
        colunaSelecionar.innerHTML = `<button class="btn btn-primary    ">Selecionar</button>`; 

    }
}