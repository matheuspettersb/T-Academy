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
        colunaSelecionar.innerHTML = `<button class="btn btn-primary" onclick="selecionar(${vetor[i].codigo})">Selecionar</button>`; 
    }
}

function cadastrar(){
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);
    
    if (nome.length<5){
        alert("Nome inválido.");
    } else if (valor <= 0){
        alert("Informe um valor válido.");
    } else if (isNaN(valor)){
        alert("Informe um valor.");
    }else{ 
        let obj = {
            "nome":nome,
            "valor":valor
        }
        //enviando pro backend 
        fetch("http://localhost:8080",{
            method:"POST",
            //conceito de headers só pra alteração e cadastro, select e delete n precisa
            headers:{
                "accept":"application/json",
                "content-type":"application/json"
            },
            body:JSON.stringify(obj)
        })
        //pegando o retorno do backend
        .then(retorno => retorno.json())
        .then(retornoConvertido => {
            vetor.push(retornoConvertido);
            listarProdutos();
            formularioPadrao();
        })
    }   
}

function selecionar(codigo){
    fetch(`http://localhost:8080/${codigo}`)
    .then(retorno => retorno.json())
    .then(retornoConv => {
        //esconde o cadastrar
        document.getElementById("btnCadastrar").style.display="none";
        //mostra os outros 2
        document.getElementById("btnAlterar").style.display="inline-block";
        document.getElementById("btnRemover").style.display="inline-block";

        //preencher os campos
        document.getElementById("nome").value = retornoConv.nome;
        document.getElementById("valor").value = retornoConv.valor;
        document.getElementById("codigo").value = retornoConv.codigo;
    })
}

function remover(){
    let codigo = parseInt(document.getElementById("codigo").value);

    //chama a API
    fetch(`http://localhost:8080/${codigo}`, {method:"DELETE"})
    //n tem retorno
    .then(() => {
        // for (let i=0; i<vetor.length; i++){
        //     if (vetor[i].codigo = codigo){
        //         console.log(i);
        //     }
        // }   > só exemplo

        //pegando a posição a ser removida no vetor
        let posicaoVetor = vetor.findIndex(objLinha => {
            return objLinha.codigo == codigo
        });

        vetor.splice(posicaoVetor, 1);
        listarProdutos();
        formularioPadrao();
    })
}

function alterar(){
    let codigo = parseInt(document.getElementById("codigo").value);
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);
    
    if (nome.length<5){
        alert("Nome inválido.");
    } else if (valor <= 0){
        alert("Informe um valor válido.");
    } else if (isNaN(valor)){
        alert("Informe um valor.");
    }else{ 
        let obj = {
            "codigo":codigo,
            "nome":nome,
            "valor":valor
        }
        //enviando pro backend 
        fetch("http://localhost:8080",{
            method:"PUT",
            //conceito de headers só pra alteração e cadastro, select e delete n precisa
            headers:{
                "accept":"application/json",
                "content-type":"application/json"
            },
            body:JSON.stringify(obj)
        })
        //pegando o retorno do backend
        .then(retorno => retorno.json())
        .then(retornoConvertido => {
            // pegando a posição do vetor
            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.codigo==codigo;
            })
            vetor[posicaoVetor] = retornoConvertido;
            listarProdutos();
            formularioPadrao(); 
        })
    }    
}

function formularioPadrao(){
    document.getElementById("codigo").value = "";
    document.getElementById("valor").value = "";
    document.getElementById("nome").value = "";
    
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}