// vetor
let dados = [];

window.onload = function(){
    dados = JSON.parse(localStorage.getItem("vetor"));
    selecionar();
}
//função para atualizar o vetor no localstorage
function ls(){
    localStorage.setItem("vetor", JSON.stringify(dados)); //key, string(valor, mas só guarda string)
}

// localStorage fica mesmo q saia, só sai se remover manualmente, tipo carrinho de compras, importante pro projetongus
// sessionStorage fica salvo só até fechar o navegador

function cadastrar(){
    //manipular elementos html
    let nome = document.getElementById("nome");
    let cidade = document.getElementById("cidade");
    let alerta = document.getElementById("alerta");

    alerta.classList.remove("alert-danger");
    alerta.classList.remove("alert-success");
    
    if(nome.value == ""){
        alerta.innerHTML = "Favor informar um nome";
        alerta.classList.add("alert-danger");
        nome.focus();
    } else if(cidade.value == "") {
        alerta.innerHTML = "Favor informar uma cidade";
        alerta.classList.add("alert-danger");
        cidade.focus();
    } else{
        // criar obj json
        let obj = {
            "nome":nome.value,
            "cidade":cidade.value
        }
        // cadastrar no vetor
        dados.push(obj);
        alerta.innerHTML = "Cadastro efetuado com sucesso!";
        alerta.classList.add("alert-success");

        // atualizar tabela
        selecionar();
        ls();
    }
}

// função para listar na tabela
function selecionar(){
    // obter o tbody
    let tabela = document.getElementById("tabela");

    // limpar os conteudos
    tabela.innerHTML = ""
    // laço repeticao
    for (let i=0; i<dados.length; i++){
        // criar linha
        let linha = tabela.insertRow(-1);

        // criar colunas
        let col1 = linha.insertCell(0);
        let col2 = linha.insertCell(1);
        let col3 = linha.insertCell(2);
        let col4 = linha.insertCell(3);

        col1.innerHTML = i+1;
        col2.innerHTML = dados[i].nome;
        col3.innerHTML = dados[i].cidade;
        //col4.innerHTML = "<button class='btn btn-danger' onclick='remover("+i+")'>Remover</button>";
        col4.innerHTML = `<button class="btn btn-danger" onclick=remover(${i})>Remover</button>`
        //literalemnte igual mas com tanto cringe quanto
    }
}

//função pra remover 
function remover(indice){
    dados.splice(indice, 1); //a partir daquele registro vai apagar X (nesse caso 1) registros
    selecionar();
    ls();
}
