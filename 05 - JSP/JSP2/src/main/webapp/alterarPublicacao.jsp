<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogão do Massa - Alterando</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
</head>
<body>
	<% 
		String nome = (String)session.getAttribute("usuario");
	    	if (nome==null || !nome.equals("admin")){
				response.sendRedirect("mensagens.jsp?codigo=1");
	    	}	
    %>
	<nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Blogão do Massa</a>
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link" href="gerenciar.jsp">Gerenciar publicações</a>
            <form  action="pesquisa.jsp" class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search" name="termo">
                <button class="btn btn-outline-light" type="submit">Pesquisar</button>
            </form>
        </div>
    </nav>
    
    <h1 class="intro"><u>Gerenciar publicações</u></h1>
    <div class="row">
    	<div class="col-8 offset-2">
    		<div class="card" id="cards">
    		<%
    			int codigo = Integer.parseInt(request.getParameter("codigo"));
    		%>
    			<h3 id="h3gerencia">Alterar publicação</h3>
    			<!-- method post pra deixar no escurinho do cinema -->
    			<form action="alteraPub.jsp" method="post" onsubmit="return checaDados()">
	    			<label for="titulo" class="form-label">Título:</label>
  					<input type="text" class="form-control" id="titulo"  name="titulo" placeholder="Título da publicação">
  					<label for="autor" class="form-label">Autor(a):</label>
  					<input type="text" class="form-control" id="autor"  name="autor"placeholder="Nome do autor(a)">
  					<label for="mensagem" class="form-label">Mensagem:</label>
  					<textarea class="form-control" id="mensagem" rows="3" name="mensagem"></textarea>
    				<button class="btn btn-primary" type="submit" id="botao">Alterar</button>
    				<!-- gambiarra pra n deixar a url mto grande -->
    				<input type="hidden" name="codigo" value="<%out.print(codigo);%>">
    			</form>
    		</div>
    	</div>
    </div>
</body>
</html>