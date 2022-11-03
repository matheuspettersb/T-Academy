<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogão do Massa - Erro</title>
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
            <a class="nav-link" href="todasPublicacoes.jsp">Todas as Publicações</a>
            <a class="nav-link" href="centralUsuario.jsp">Central do Usuário</a>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Pesquisar</button>
            </form>
        </div>
    </nav>
    <div class="row">
	<%
		int cd = Integer.parseInt(request.getParameter("codigo"));
		
		//tentar acessar coisa de adm
		if (cd==1){
			out.print("<div class=\"card col-6 offset-3 mensagem\"><h3>Opa, parece que não era pra você estar aqui.</h3><a href=\"index.jsp\" class=\"btn btn-lg btn-primary\">Voltar para a homepage</a></div>");
		}
		
		//usuário já cadastrado
		if (cd==2){
			out.print("<div class=\"card col-6 offset-3 mensagem\"><h3>Opa, parece que esse usuário já foi cadastrado, tente cadastrar um novo.</h3><a href=\"centralUsuario.jsp\" class=\"btn btn-lg btn-primary\">Voltar</a></div>");
		}
		
		//usuario banido ou inválido
		if (cd==3){
			out.print("<div class=\"card mensagem col-6 offset-3\"><h3>Opa, parece que esse usuário está banido.</h3><a href=\"index.jsp\" class=\"btn btn-lg btn-primary\">Voltar para a homepage</a></div>");

		}
		
		//nao consta
		if (cd==4){
			out.print("<div class=\"card mensagem col-6 offset-3\"><h3>Usuário ou senha incorretos.</h3><a href=\"centralUsuario.jsp\" class=\"btn btn-lg btn-primary\">Voltar para a página de login</a></div>");

		}
	%>
	</div>
</body>
</html>