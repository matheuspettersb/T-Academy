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

function getSigno(){
    let dataNasc = document.getElementById("dataNasc"); 
    const data = new Date(dataNasc.value);
    let dia = data.getDate();
    let mes = data.getMonth();
    let resultado = document.getElementById("resultadoSigno");
    
    switch(mes){
    // lembrar de ajustar os dias -1
    case 0:
        if (dia>=19){
            resultado.innerHTML = `<hr><img src="signossvgs/aquarius.svg" alt="aquarius" id="signo"><h2>Você é de Aquário!</h2><p>Os aquarianos são amantes dos desafios e da liberdade!
            <br><b>Características positivas dos aquarianos:</b> idealista e inventivo, o aquariano costuma ser tranquilo e justo, ao mesmo tempo que gosta de transformar e não se acomodar nas situações.
            <br><b>Características negativas dos aquarianos:</b> por ser individualista e desapegado, muitos consideram o aquariano frio e sem coração, além de distante, rebelde e imprevisível.
            <br>O signo de Aquário talvez seja o signo mais individualista do zodíaco.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/capricorne.svg" alt="capricorne" id="signo"><h2>Você é de Capricórnio!</h2><p>A responsabilidade é o ponto forte do capricorniano.
        <br><b>-Características positivas dos capricornianos:</b> são persistentes e determinados. Sua organização e ambição natas fazem com que sejam muito eficientes e trabalhadores.
        <br><b>Características negativas dos capricornianos:</b> muito certinhos, podem se tornar rígidos e orgulhosos demais. Por serem muito práticos, também podem se tornar frios e pessimistas.
        <br>Quando falamos de personalidades dos signos, o signo mais responsável do zodíaco é o signo de Capricórnio.</p>`
        break;
    case 1:
        if (dia>=18){
            resultado.innerHTML = `<hr><img src="signossvgs/pisces.svg" alt="pisces" id="signo"><h2>Você é de Peixes!</h2><p>Emocionais e espiritualizados, esses são os piscianos.
            <br><b>Características positivas dos piscianos:</b> ouvintes natos, são confiáveis, intuitivos, prestativos e preocupados com os demais. São adaptáveis e simpáticos, os tornando bem sociáveis.
            <br><b>Características negativas dos piscianos:</b> a sensibilidade aflorada pode os tornar emocionais demais, tendendo para a depressão, os tornando muito temperamentais e rancorosos. São avoados, escapistas da realidade e por confiarem muito nos outros também costumam ser indecisos e inocentes.
            <br>O signo de Peixes é o signo mais sonhador e sensível do zodíaco.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/aquarius.svg" alt="aquarius" id="signo"><h2>Você é de Aquário!</h2><p>Os aquarianos são amantes dos desafios e da liberdade!
        <br><b>Características positivas dos aquarianos:</b> idealista e inventivo, o aquariano costuma ser tranquilo e justo, ao mesmo tempo que gosta de transformar e não se acomodar nas situações.
        <br><b>Características negativas dos aquarianos:</b> por ser individualista e desapegado, muitos consideram o aquariano frio e sem coração, além de distante, rebelde e imprevisível.
        <br>O signo de Aquário talvez seja o signo mais individualista do zodíaco.</p>`
        break;
    case 2:
        if (dia>=20){
            resultado.innerHTML = `<hr><img src="signossvgs/aries.svg" alt="aries" id="signo"><h2>Você é de Áries!</h2><p>Os arianos costumam ser individualistas e espontâneos!
            <br>Além disso, são regidos pelo planeta Marte, o que faz com que eles tenham “um pouco” de impaciência.
            <br><b>Características positivas dos arianos:</b> se coloca em primeiro lugar, mas sem esquecer dos demais à sua volta! Motiva as pessoas e é prestativo, além de perseverante e apaixonado;
            <br><b>Características negativas dos arianos:</b> sua agitação faz com que o ariano normalmente seja inquieto, impulsivo ou inconsequente. Por pensar muito nele próprio também é às vezes taxado de egoísta:
            <br>Muitas vezes, o signo de Áries é considerado o signo mais nervoso do zodíaco!</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/pisces.svg" alt="pisces" id="signo"><h2>Você é de Peixes!</h2><p>Emocionais e espiritualizados, esses são os piscianos.
        <br><b>Características positivas dos piscianos:</b> ouvintes natos, são confiáveis, intuitivos, prestativos e preocupados com os demais. São adaptáveis e simpáticos, os tornando bem sociáveis.
        <br><b>Características negativas dos piscianos:</b> a sensibilidade aflorada pode os tornar emocionais demais, tendendo para a depressão, os tornando muito temperamentais e rancorosos. São avoados, escapistas da realidade e por confiarem muito nos outros também costumam ser indecisos e inocentes.
        <br>O signo de Peixes é o signo mais sonhador e sensível do zodíaco.</p>`
        break;
    case 3:
        if (dia>=19){
            resultado.innerHTML = `<hr><img src="signossvgs/taurus.svg" alt="taurus" id="signo"><h2>Você é de Touro!</h2><p>Os taurinos são esforçados e práticos!
            <br>Além disso, são regidos pelo planeta Vênus, e por isso admiram muito a beleza das coisas.
            <br><b>Características positivas dos taurinos:</b> cuidadoso com tudo e com todos, é paciente e produtivo. Desse modo, são pessoas em que se podem confiar e costumam ser muito fiéis;
            <br><b>Características negativas dos taurinos:</b> a teimosia é característica nata de um taurino. Visto que são muito persistentes e obstinado, querem cuidar de tudo e podem se mostrar centralizadores, inflexíveis e materialistas;
            <br>Isto posto, o signo de Touro é o mais teimoso do zodíaco!</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/aries.svg" alt="aries" id="signo"><h2>Você é de Áries!</h2><p>Os arianos costumam ser individualistas e espontâneos!
        <br>Além disso, são regidos pelo planeta Marte, o que faz com que eles tenham “um pouco” de impaciência.
        <br><b>Características positivas dos arianos:</b> se coloca em primeiro lugar, mas sem esquecer dos demais à sua volta! Motiva as pessoas e é prestativo, além de perseverante e apaixonado;
        <br><b>Características negativas dos arianos:</b> sua agitação faz com que o ariano normalmente seja inquieto, impulsivo ou inconsequente. Por pensar muito nele próprio também é às vezes taxado de egoísta:
        Muitas vezes, o signo de Áries é considerado o signo mais nervoso do zodíaco!</p>`
            break;
    case 4:
        if (dia>=20){
            resultado.innerHTML = `<hr><img src="signossvgs/gemini.svg" alt="gemini" id="signo"><h2>Você é de Gêmeos!</h2><p>Os geminianos são extrovertidos e amigões!
            <br>Ainda, são regidos pelo planeta Mercúrio, o que traz grande capacidade de adaptação a eles.
            <br><b>Características positivas dos geminianos:</b> animados e comunicativos, eles tem a mente aberta e são muito espertos;
            <br><b>Características negativas dos geminianos:</b> podem oscilar muito, tonando-se indecisos, inconstantes, ansiosos e ao mesmo tempo evasivos;
            <br>Dessa forma, o signo de Gêmeos é o mais comunicativo do zodíaco.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/taurus.svg" alt="taurus" id="signo"><h2>Você é de Touro!</h2><p>Os taurinos são esforçados e práticos!
        <br>Além disso, são regidos pelo planeta Vênus, e por isso admiram muito a beleza das coisas.
        <br><b>Características positivas dos taurinos:</b> cuidadoso com tudo e com todos, é paciente e produtivo. Desse modo, são pessoas em que se podem confiar e costumam ser muito fiéis;            <br><b>Características negativas dos taurinos:</b> a teimosia é característica nata de um taurino. Visto que são muito persistentes e obstinado, querem cuidar de tudo e podem se mostrar centralizadores, inflexíveis e materialistas;
        <br>Isto posto, o signo de Touro é o mais teimoso do zodíaco!</p>`
        break;
    case 5:
        if (dia>=20){
            resultado.innerHTML = `<hr><img src="signossvgs/cancer.svg" alt="cancer" id="signo"><h2>Você é de Câncer!</h2><p>A principal marca dos cancerianos é a sensibilidade e o carinho.
            <br>Inclusive, são regidos pela Lua, que é diretamente ligada ao nosso emocional.
            <br><b>Características positivas dos cancerianos:</b> são dedicados e gentis, sempre ouvindo ou cuidando de alguém por perceberam suas emoções e problemas;
            <br><b>Características negativas dos cancerianos:</b> a carência e o mau humor podem surgir a qualquer momento nos cancerianos, que podem se tornar ciumentos ou se vitimizar;
            <br>Desta maneira, o signo de Câncer mais sensível do zodíaco.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/gemini.svg" alt="gemini" id="signo"><h2>Você é de Gêmeos!</h2><p>Os geminianos são extrovertidos e amigões!
        <br>Ainda, são regidos pelo planeta Mercúrio, o que traz grande capacidade de adaptação a eles.
        <br><b>Características positivas dos geminianos:</b> animados e comunicativos, eles tem a mente aberta e são muito espertos;
        <br><b>Características negativas dos geminianos:</b> podem oscilar muito, tonando-se indecisos, inconstantes, ansiosos e ao mesmo tempo evasivos;
        <br>Dessa forma, o signo de Gêmeos é o mais comunicativo do zodíaco.</p>`
        break;
    case 6:
        if (dia>=21){
            resultado.innerHTML = `<hr><img src="signossvgs/leo.svg" alt="leo" id="signo"><h2>Você é de Leão!</h2><p>Os leoninos são vaidosos e confiantes.
            <br>Sem dúvida, por serem regidos pelo Sol, o nosso astro rei!
            <br><b>Características positivas dos leoninos:</b> inteligentes e corajosos, são líderes natos. Por outro lado, são expressivos e determinados: quando colocam algo na mente, pode ter certeza que vão até o fim para conquistá-la;
            <br><b>Características negativas dos leoninos:</b> têm a personalidade muito forte, podendo se tornar ambiciosos, mandões ou convencidos demais;
            <br>Em virtude disso, o signo de Leão é provavelmente o signo mais forte do zodíaco!</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/cancer.svg" alt="cancer" id="signo"><h2>Você é de Câncer!</h2><p>A principal marca dos cancerianos é a sensibilidade e o carinho.
        <br>Inclusive, são regidos pela Lua, que é diretamente ligada ao nosso emocional.
        <br><b>Características positivas dos cancerianos:</b> são dedicados e gentis, sempre ouvindo ou cuidando de alguém por perceberam suas emoções e problemas;
        <br><b>Características negativas dos cancerianos:</b> a carência e o mau humor podem surgir a qualquer momento nos cancerianos, que podem se tornar ciumentos ou se vitimizar;
        <br>Desta maneira, o signo de Câncer mais sensível do zodíaco.</p>`
        break;
    case 7:
        if (dia>=22){
            resultado.innerHTML = `<hr><img src="signossvgs/virgo.svg" alt="virgo" id="signo"><h2>Você é de Virgem!</h2><p>Organizados e analíticos: esses são os virginianos.
            <br><b>Características positivas dos virginianos:</b> observação e eficiência são marcas do virginiano, que é bastante atencioso e sincero com os demais e está sempre resolvendo um problema: seja seu ou dos outros.
            <br><b>Características negativas dos virginianos:</b> ser sistemático torna o virginiano cheio de manias, muito crítico e desconfiado. Também pode torná-los ansiosos e perfeccionistas demais.
            <br>O signo de Virgem é o signo mais organizado do zodíaco.</p>`
            break;
        }
        `<hr><img src="signossvgs/leo.svg" alt="leo" id="signo"><h2>Você é de Leão!</h2><p>Os leoninos são vaidosos e confiantes.
        <br>Sem dúvida, por serem regidos pelo Sol, o nosso astro rei!
        <br><b>Características positivas dos leoninos:</b> inteligentes e corajosos, são líderes natos. Por outro lado, são expressivos e determinados: quando colocam algo na mente, pode ter certeza que vão até o fim para conquistá-la;
        <br><b>Características negativas dos leoninos:</b> têm a personalidade muito forte, podendo se tornar ambiciosos, mandões ou convencidos demais;
        <br>Em virtude disso, o signo de Leão é provavelmente o signo mais forte do zodíaco!</p>`   
        break;
    case 8:
        if (dia>=22){
            resultado.innerHTML = `<hr><img src="signossvgs/libra.svg" alt="libra" id="signo"><h2>Você é de Libra!</h2><p>Clichê dizer, mas o equilíbrio e a justiça definem os librianos.
            <br><b>Características positivas dos librianos:</b> extremamente diplomáticos, são sinceros e buscam ponderar sempre para chegar no melhor resultado. Para isso contam com sua simpatia, boa comunicação e tranquilidade.
            <br><b>Características negativas dos librianos:</b> querer atingir o equilíbrio sempre torna o libriano indeciso, controlador e com muita mania de organização. Também têm dificuldade de dizer não em algumas situações.
            <br>O signo de Libra é o signo mais equilibrado e indeciso do zodíaco.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/virgo.svg" alt="virgo" id="signo"><h2>Você é de Virgem!</h2><p>Organizados e analíticos: esses são os virginianos.
        <br><b>Características positivas dos virginianos:</b> observação e eficiência são marcas do virginiano, que é bastante atencioso e sincero com os demais e está sempre resolvendo um problema: seja seu ou dos outros.
        <br><b>Características negativas dos virginianos:</b> ser sistemático torna o virginiano cheio de manias, muito crítico e desconfiado. Também pode torná-los ansiosos e perfeccionistas demais.
        <br>O signo de Virgem é o signo mais organizado do zodíaco.</p>`
        break;
    case 9:
        if (dia>=22){
            resultado.innerHTML = `<hr><img src="signossvgs/scorpio.svg" alt="scorpio" id="signo"><h2>Você é de Escorpião!</h2><p>Atraente e intenso: esse é o escorpiano.
            <br><b>Características positivas dos escorpianos:</b> de uma auto-confiança invejável, têm muita intuição e um instinto protetor maravilhoso. São dedicados e apaixonados.
            <br><b>Características negativas dos escorpianos:</b> sua boa memória, ciúmes e às vezes obsessão fazem com que o nunca esqueçam do que lhe fizeram, se tornando vingativos e rancorosos.
            <br>É provável que o signo de Escorpião seja o signo mais intenso do zodíaco!</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/libra.svg" alt="libra" id="signo"><h2>Você é de Libra!</h2><p>Clichê dizer, mas o equilíbrio e a justiça definem os librianos.
        <br><b>Características positivas dos librianos:</b> extremamente diplomáticos, são sinceros e buscam ponderar sempre para chegar no melhor resultado. Para isso contam com sua simpatia, boa comunicação e tranquilidade.
        <br><b>Características negativas dos librianos:</b> querer atingir o equilíbrio sempre torna o libriano indeciso, controlador e com muita mania de organização. Também têm dificuldade de dizer não em algumas situações.
        <br>O signo de Libra é o signo mais equilibrado e indeciso do zodíaco.</p>`
        break;
    case 10:
        if (dia>=21){
            resultado.innerHTML = `<hr><img src="signossvgs/sagittarius.svg" alt="sagittarius" id="signo"><h2>Você é de Sagitário!</h2><p>Independência e liberdade marcam os sagitarianos.
            <br><b>Características positivas dos sagitarianos:</b> são talentosos, inteligentes e justos. São pessoas estimulantes, que gostam de se divertir e têm bastante espontaneidade e vitalidade.
            <br><b>Características negativas dos sagitarianos:</b> podem aparentar arrogância por saberem demais, rígidos com si mesmos e os outros, um pouco impacientes e sarcásticos.
            <br>O signo mais sincero do zodíaco é o signo de Sagitário.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/scorpio.svg" alt="scorpio" id="signo"><h2>Você é de Escorpião!</h2><p>Atraente e intenso: esse é o escorpiano.
        <br><b>Características positivas dos escorpianos:</b> de uma auto-confiança invejável, têm muita intuição e um instinto protetor maravilhoso. São dedicados e apaixonados.
        <br><b>Características negativas dos escorpianos:</b> sua boa memória, ciúmes e às vezes obsessão fazem com que o nunca esqueçam do que lhe fizeram, se tornando vingativos e rancorosos.
        <br>É provável que o signo de Escorpião seja o signo mais intenso do zodíaco!</p>`
        break;
    case 11:
        if (dia>=21){
            resultado.innerHTML = `<hr><img src="signossvgs/capricorne.svg" alt="capricorne" id="signo"><h2>Você é de Capricórnio!</h2><p>A responsabilidade é o ponto forte do capricorniano.
            <br><b>Características positivas dos capricornianos:</b> são persistentes e determinados. Sua organização e ambição natas fazem com que sejam muito eficientes e trabalhadores.
            <br><b>Características negativas dos capricornianos:</b> muito certinhos, podem se tornar rígidos e orgulhosos demais. Por serem muito práticos, também podem se tornar frios e pessimistas.
            <br>Quando falamos de personalidades dos signos, o signo mais responsável do zodíaco é o signo de Capricórnio.</p>`
            break;
        }
        resultado.innerHTML = `<hr><img src="signossvgs/sagittarius.svg" alt="sagittarius" id="signo"><h2>Você é de Sagitário!</h2><p>Independência e liberdade marcam os sagitarianos.
        <br><b>Características positivas dos sagitarianos:</b> são talentosos, inteligentes e justos. São pessoas estimulantes, que gostam de se divertir e têm bastante espontaneidade e vitalidade.
        <br><b>Características negativas dos sagitarianos:</b> podem aparentar arrogância por saberem demais, rígidos com si mesmos e os outros, um pouco impacientes e sarcásticos.
        <br>O signo mais sincero do zodíaco é o signo de Sagitário.</p>`
        break;
    }
}

function pegamenor(){
    let num1 = document.getElementById("n1"); 
    let num2 = document.getElementById("n2");
    let num3 = document.getElementById("n3");
    let menor;
    let resposta = document.getElementById("respostaMenor");

    if(num1.value < num2.value){
        menor = num1.value;
    } else{
        menor = num2.value;
    }

    if (menor < num3.value){
        resposta.innerHTML = "<hr><h3>O menor valor é "+menor+"</h3>";
    }else{
        resposta.innerHTML = "<hr><h3>O menor valor é "+num3.value+"</h3>";
    }
}

function converteHora(id){
    let hora = document.getElementById("horario");
    let dadosHora = hora.value.split(':');
    hora = parseInt(dadosHora[0]);
    let minutos = dadosHora[1];

    switch(id){
        case 1:
            hora +=4;
            if (hora>=24){
                hora = hora-24;
            }
            alert("Horario de Lisboa: "+hora+":"+minutos);
            break;
        case 2:
            hora -=1;
            if (hora<0){
                hora = 24+hora;
            }
            alert("Horario de Nova Iorque: "+hora+":"+minutos);
            break;
        case 3:
            hora -=2;
            if (hora<0){
                hora = 24+hora;
            }
            alert("Horario da Cidade do México: "+hora+":"+minutos);
            break;
        case 4:
            hora +=12;
            if (hora>=24){
                hora = hora-24;
            }
            alert("Horario de Tóquio: "+hora+":"+minutos);
            break;
        case 5:
            hora +=5;
            if (hora>=24){
                hora = hora-24;
            }
            alert("Horario de Berlim: "+hora+":"+minutos);
            break;
    }
}

function tabuar(){
    let n1 = document.getElementById("n1");
    let resposta = document.getElementById("tabuada");
    n1 = parseInt(n1.value);
    
    resposta.innerHTML = "<hr><h2>Tabuada:</h2><br><p>1 x "+n1+" = "+n1+"<br>2 x "+n1+" = "+n1*2+"<br>3 x "+n1+" = "+n1*3+"<br>4 x "+n1+" = "+n1*4+"<br>5 x "+n1+" = "+n1*5+"<br>6 x "+n1+" = "+n1*6+"<br>7 x "+n1+" = "+n1*7+"<br>8 x "+n1+" = "+n1*8+"<br>9 x "+n1+" = "+n1*9+"<br>10 x "+n1+" = "+n1*10+"</p>"
}


let votos1 = 0;
let votos2 = 0;
let votos3 = 0;
let votos4 = 0;
let vnulos = 0;

function votos(id){
    let p1 = document.getElementById("p_1");
    let p2 = document.getElementById("p_2");
    let p3 = document.getElementById("p_3");
    let p4 = document.getElementById("p_4");
    let p5 = document.getElementById("p_5");
    let p6 = document.getElementById("p_6");
    let p7 = document.getElementById("p_7");

    switch(id){
        case 1:
            votos1 += 1;
            p1.innerHTML = "Total de votos do candidato 1: "+votos1;
            break;
        case 2:
            votos2 += 1;
            p2.innerHTML = "Total de votos do candidato 2: "+votos2;
            break;
        case 3:
            votos3 += 1;
            p3.innerHTML = "Total de votos do candidato 3: "+votos3;
            break;
        case 4:
            votos4 += 1;
            p4.innerHTML = "Total de votos do candidato 4: "+votos4;
            break;
        case 5:
            vnulos += 1;
            p5.innerHTML = "Total de votos nulos: "+vnulos;
            break;
    }

    p6.innerHTML = "Quantidade total de votos: "+(votos1+votos2+votos3+votos4+vnulos);
    p7.innerHTML = "Candidato com mais votos:  "

    let n = getMaisVotos();
    if(votos1 == n){
        p7.innerHTML += "Candidato 1, "
    }
    if(votos2 == n){
        p7.innerHTML += "Candidato 2, "
    }
    if(votos3 == n){
        p7.innerHTML += "Candidato 3, "
    }
    if(votos4 == n){
        p7.innerHTML += "Candidato 4, "
    }
    p7.innerHTML = p7.innerHTML.substring(0, p7.innerHTML.length-2);
    
}

function getMaisVotos(){
    let n=0;
    if (votos1>n){
        n = votos1;
    }
    if (votos2>n){
        n = votos2;
    }
    if (votos3>n){
        n = votos3;
    }
    if (votos4>n){
        n = votos4;
    }
    if (n == 0){
        return -1;
    }
    return n;
}

let qntProd = 0;
function mexeTabela(){
    let tabela = document.getElementById("tabelongus");
    let prod = document.getElementById("produto11");
    let marca = document.getElementById("marca11");
    let val = document.getElementById("valor11");
    let p = document.getElementById("p11");
    tabela.innerHTML = tabela.innerHTML +`<tr><td>${prod.value}</td><td>${marca.value}</td><td>${val.value}</td></tr>`
    qntProd += 1;
    p.innerText = "Quantidade total de produtos: "+qntProd;
}



//ex12
let dadosTabela = [];

function cadastrarTabela(){
    let tabela = document.getElementById("tabela");
    let nome = document.getElementById("nome");
    let nasc = document.getElementById("nasc");    
    let tel = document.getElementById("tel");    
    let email = document.getElementById("email");

    
}

function excluirTabela(){

}

function alterarTabela(){

}