<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogão do Massa - Central do Usuário</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Blogão do Massa</a>
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link" href="gerenciar.jsp">Gerenciar publicações</a>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Pesquisar</button>
            </form>
        </div>
    </nav>
    <div class="row">
    	<div class="col-6 offset-3">
    		<div class="card" id="cardCentral">
    			<form id="forms">
    				<h5>Já tem uma conta? Faça Login:</h5>
	    			<label for="usuario" class="form-label">Usuário:</label>
					<input type="text" class="form-control" id="usuario1" name="usuario" placeholder="Seu usuário">
					<label for="senha" class="form-label">Senha:</label>
					<input type="password" class="form-control" id="senha1" name="senha" placeholder="Sua senha">
					<button class="btn btn-primary" id="botao">Entrar</button>
    			</form>
    			<hr>
    			<form id="forms" action="cadastraUser.jsp" onsubmit="return validaDadosUser()">
    				<h5>Ou crie uma agora:</h5>
	    			<label for="usuario" class="form-label">Usuário:</label>
					<input type="text" class="form-control" id="usuario2" name="usuario" placeholder="Seu usuário">
					<label for="senha" class="form-label">Senha:</label>
					<input type="password" class="form-control" id="senha2" name="senha" placeholder="Sua senha">
					<button class="btn btn-primary" id="botao">Cadastrar-se</button>
    			</form>
    		</div>
    	</div>
    </div>
</body>
</html>