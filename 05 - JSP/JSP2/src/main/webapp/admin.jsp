<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacotao.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <a class="nav-link" href="admin.jsp">Gerenciar publicações</a>
            <a class="nav-link" href="centralUsuario.jsp">Central do Usuário</a>
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
    			<h3 id="h3gerencia">Cadastrar uma nova publicação</h3>
    			<form action="cadastraPub.jsp" method="post" id="cadastro" onsubmit="return checaDados()">
	    			<label for="titulo" class="form-label">Título:</label>
  					<input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título da publicação">
  					<label for="autor" class="form-label">Autor(a):</label>
  					<input type="text" class="form-control" id="autor" name="autor" placeholder="Nome do autor(a)">
  					<label for="mensagem" class="form-label">Mensagem:</label>
  					<textarea class="form-control" id="mensagem" name="mensagem" rows="3"></textarea>
    				<button class="btn btn-success" id="botao">Cadastrar</button>
    			</form>
    		</div>
    		<h2 id="h2gerencia">Todas as publicações:</h2>
    		<div id="corpo">
	    		<%
				Conexao c = new Conexao();
				String sql = "SELECT * FROM postagens";
	
				Statement st = c.efetuarConexao().createStatement();
				
				ResultSet rs = st.executeQuery(sql);
				
				while (rs.next()){
	    		%>
	    		<div class="card" id="cards">
	    			<div>
	    				<h3><% out.print(rs.getString(2)); %></h3>
	    				<p><% out.print(rs.getString(4)); %></p>
	    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
	    				<a href="alterarPublicacao.jsp?codigo=<%out.print(rs.getInt(1));%>" class="btn btn-warning">Alterar</a>
	    				<a href="excluiPub.jsp?codigo=<%out.print(rs.getInt(1));%>" class="btn btn-danger">Excluir</a>
	    				<a href="publicacoes.jsp?codigo=<%out.print(rs.getInt(1));%>" class="btn btn-outline-dark">Ver publicação</a>
	    			</div>
	    		</div>
	    	<%
				}
	    	%>
    		</div>
    	</div>
    </div>
</body>
</html>