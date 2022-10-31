function checaDados(){
	let nome = document.getElementById("autor").value;
	let titulo = document.getElementById("titulo").value;
	let mensagem = document.getElementById("mensagem").value;
	
	if (nome.length<3){
		alert("Insira um nome válido");
		return false;
	}
	if (titulo==""){
		alert("A publicação deve ter um título");
		return false;
	}
	if (mensagem=="" || mensagem.length>6000){
		alert("A mensagem deve ter menos de 6000 caracteres e não deve estar vazia")
		return false;
	}
	return true;
}