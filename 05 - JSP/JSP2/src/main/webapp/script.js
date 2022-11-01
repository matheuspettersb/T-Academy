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

function validaDadosUser(){
	let usuario = document.getElementById("usuario2").value;
	let senha = document.getElementById("senha2").value;
	
	if (usuario.length>50 || usuario == ""){
		alert("O nome de usuário não pode ser vazio e deve ter no máximo 50 caracteres");
		return false;
	}
	if (senha.length>20 || senha == "" ){
		alert("A senha não pode ser vazia e deve ter no máximo 20 caracteres");
		return false;
	}
	return true;
}