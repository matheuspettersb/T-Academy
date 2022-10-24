function media(){
    let n1 = document.getElementById("nota1");
    let n2 = document.getElementById("nota2");
    let resposta = document.getElementById("resultadoMedia");
    resposta.innerHTML = "A média do aluno foi "+((parseFloat(n1.value)+parseFloat(n2.value))/2);
}

function pagamento(){
    let valor = document.getElementById("valPag");
    let p1 = document.getElementById("pag1");
    let p2 = document.getElementById("pag2");
    let resposta = document.getElementById("respostaPagamento");
 
    if (p1.checked){
        if (parseFloat(valor.value) > 100){
            valor = parseFloat(valor.value)*0.9;
            resposta.innerHTML = "Pagamento realizado com desconto no valor de R$ "+valor;
        }
        resposta.innerHTML = "Pagamento realizado no valor de R$ "+valor.value;
    } else if (p2.checked){
        resposta.innerHTML = "Pagamento realizado com desconto no valor de R$ "+valor.value;
    } else{
        resposta.innerHTML = "Favor selecione a modalidade de pagamento";
    }
}

function mudaCidade(selecionado){
    let resposta = document.getElementById("cidadeTxt");
    switch(selecionado){
        case "1":
            resposta.innerHTML = "Blumenau é uma cidade do Vale do Itajaí onde ocorre a Oktoberfest";
            break;
        case "2":
            resposta.innerHTML = "Indaial é a melhor cidade do mundo de acordo com a professora Sonia";
            break;
        case "3":
            resposta.innerHTML = "Gaspar é uma DLC gratuíta de Blumenau";
            break;
        default:
            resposta.innerHTML = "";
            break;
    }
} 

let total = 0;
function fazerPedido(status){
    let resposta = document.getElementById("p_lanchonete");
    if (status == true){
        total+=1;
    } else {
        total-=1;
    }
    resposta.innerHTML = "Total de itens do pedido: "+total;
}

function converter(id){
    let valor = document.getElementById("valorConversao");
    let numero;
    let resposta = document.getElementById("respostaValor");
    switch(id){
        case 1:
            numero = (parseFloat(valor.value)*5.29);
            resposta.innerHTML = "Valor convertido: $"+numero+" USD";
            break;
        case 2:
            numero = (parseFloat(valor.value)/5.29);
            resposta.innerHTML = "Valor convertido: $"+numero+" BRL";
            break;
        case 3:
            numero = (parseFloat(valor.value)*5.22);
            resposta.innerHTML = "Valor convertido: $"+numero+" EUR";
            break;
        case 4:
            numero = (parseFloat(valor.value)/5.22);
            resposta.innerHTML = "Valor convertido: $"+numero+" BRL";
            break;
        case 5:
            numero = (parseFloat(valor.value)*5.97);
            resposta.innerHTML = "Valor convertido: $"+numero+" GBP";
            break;
        case 6:
            numero = (parseFloat(valor.value)/5.97);
            resposta.innerHTML = "Valor convertido: $"+numero+" BRL";
            break;
    }
}