<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacotao.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogão do Massa - Postagem</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
</head>
<body>
	<% 
   		String nome = (String)session.getAttribute("usuario");
   		if (nome==null || !nome.equals("admin")){
    %>
	<nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Blogão do Massa</a>
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link" href="todasPublicacoes.jsp">Todas as Publicações</a>
            <a class="nav-link" href="centralUsuario.jsp">Central do Usuário</a>
            <form  action="pesquisa.jsp" class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search" name="termo">
                <button class="btn btn-outline-light" type="submit">Pesquisar</button>
            </form>
        </div>
    </nav>
    <div class="row">
    	<div class="col-8 offset-2">
    		<%
	    		int codigo = Integer.parseInt(request.getParameter("codigo"));
				
	    		Conexao c = new Conexao();
				String sql = "SELECT * FROM postagens WHERE cd_postagem = ?";
				
				PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
				ps.setInt(1, codigo);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
    		%>
    			<div class="card" id="postagem">	
    				<h3><% out.print(rs.getString(2)); %></h3>
    				<p><% out.print(rs.getString(4)); %></p>
    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
    			</div>
    		<% } %>
    		<hr>
    		<% if (nome==null){ %>
    		<h4>Comentários:</h4>
    		<div id="cardComent" class="card">
	    		<form id="forms" action="" method="post" onsubmit="">
	    			<h5>Comentar:</h5>
	    			<label for="autor" class="form-label">Autor(a):</label>
					<input type="text" class="form-control" id="autor" name="autor" disabled readonly>
					<label for="mensagem" class="form-label">Mensagem:</label>
					<textarea class="form-control" id="mensagem" rows="3" name="mensagem" disabled></textarea>
					<button class="btn btn-primary" id="botao" disabled>Comentar</button>
					<p id="redirectConta"><i>Para realizar comentarios é necessário criar uma conta. Para criar uma conta <a href="centralUsuario.jsp">clique aqui</a></i></p>
	    		</form>
    		</div>
    		<% } else { %>
    			<h4>Comentários:</h4>
    			<div id="cardComent" class="card">
	    			<form id="forms" action="comenta.jsp" method="post">
		    			<h5>Comentar:</h5>
		    			<label for="autor" class="form-label">Autor(a):</label>
						<input type="text" class="form-control" id="autor" value="<%out.print(nome);%>" name="autor"readonly>
						<label for="mensagem" class="form-label">Mensagem:</label>
						<textarea class="form-control" id="mensagem" rows="3" name="mensagem"></textarea>
						<button class="btn btn-primary" id="botao">Comentar</button>
						<!-- gambiarra pra n deixar a url mto grande -->
    					<input type="hidden" name="codigo" value="<%out.print(codigo);%>">
	    		</form>
    		</div>
    		<% } %>
    		<h4>Comentários:</h4>
	    		<%
		    		sql = "SELECT * FROM comentarios WHERE situacao = ?";		
		    		ps = c.efetuarConexao().prepareStatement(sql);
		    		ps.setInt(1, 1);
		    		rs = ps.executeQuery();
		    		
	    			while (rs.next()){
	    		%>
   					<div class="card" id="cards">
   						<h4><% out.print(rs.getString(5)); %> disse:</h4>
   						<p><% out.print(rs.getString(2)); %></p>
   					</div>
    			<%
    				}
    		%>
    		
    		<%
    		//usuario normal pra cima, adm pra baixo
    		} else {
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
		    <div class="row">
    		<div class="col-8 offset-2">
    		<%
	    		int codigo = Integer.parseInt(request.getParameter("codigo"));
				
	    		Conexao c = new Conexao();
				String sql = "SELECT * FROM postagens WHERE cd_postagem = ?";
				
				PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
				ps.setInt(1, codigo);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
    		%>
    			<div class="card" id="postagem">	
    				<h3><% out.print(rs.getString(2)); %></h3>
    				<p><% out.print(rs.getString(4)); %></p>
    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
    			</div>
    		<% } %>
    		<hr>
		    
		    
		    <%	
				sql = "SELECT * FROM comentarios WHERE situacao = ?";		
				ps = c.efetuarConexao().prepareStatement(sql);
	    		ps.setInt(1, 0);
	    		rs = ps.executeQuery();
	    	%>
	    		<h4>Comentários em análise:</h4>
	    			<%
	    				while (rs.next()){
	    			%>
	    					<div class="card" id="cards">
	    						<h4><% out.print(rs.getString(5)); %> disse:</h4>
	    						<p><% out.print(rs.getString(2)); %></p>
	    						<div>
		    						<a href="aceitaComentario.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-success">Aprovar comentário</a>
		    						<a href="removeComentario.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Excluir comentário</a>
		    						<a href="banir.jsp?nome=<% out.print(rs.getString(5)); %>&codigo=<% out.print(rs.getInt(1));%>" class="btn btn-danger">Banir usuário</a>
	    						</div>
	    					</div>
	    			<%
	    				}
	    			%>
	    		<hr>
	    		<h4>Comentários aprovados:</h4>
	    		<%
		    		sql = "SELECT * FROM comentarios WHERE situacao = ?";		
		    		ps = c.efetuarConexao().prepareStatement(sql);
		    		ps.setInt(1, 1);
		    		rs = ps.executeQuery();
		    		
	    			while (rs.next()){
	    		%>
   					<div class="card" id="cards">
   						<h4><% out.print(rs.getString(5)); %> disse:</h4>
   						<p><% out.print(rs.getString(2)); %></p>
   						<div>
    						<a href="removeComentario.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Excluir comentário</a>
   						</div>
   					</div>
    			<%
    				}
    		%>
    		<h4>Comentários:</h4>
	    		<%
		    		sql = "SELECT * FROM comentarios WHERE situacao = ?";		
		    		ps = c.efetuarConexao().prepareStatement(sql);
		    		ps.setInt(1, 1);
		    		rs = ps.executeQuery();
		    		
	    			while (rs.next()){
	    		%>
   					<div class="card" id="cards">
   						<h4><% out.print(rs.getString(5)); %> disse:</h4>
   						<p><% out.print(rs.getString(2)); %></p>
   					</div>
    			<%
    				}
	    		}
 				%>
    	</div>
    </div>
</body>
</html>