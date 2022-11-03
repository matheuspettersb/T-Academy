<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacotao.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>
<meta charset="UTF-8">
<title>Blogão do Massa - Pesquisa</title>
</head>
<body>
	<%
	String nome = (String)session.getAttribute("usuario");
	if(nome==null || !nome.equals("admin")){
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
    	<div class="col-6 offset-3">
    	    <%
    	    String termo = request.getParameter("termo");
    		Conexao c = new Conexao();
    		
    		//sql
    		String sql = "SELECT * FROM postagens WHERE titulo LIKE '%"+termo+"%'";		
			PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
    		ResultSet rs = ps.executeQuery(sql);
    		
    		
    		while (rs.next()){
    		%>
    			<div class="card pesquisa" id="cards">
	    			<a class="redireciona" href="publicacoes.jsp?codigo=<%out.print(rs.getInt(1));%>">
	    			<div>
	    				<h3><% out.print(rs.getString(2)); %></h3>
	    				<p><% out.print(rs.getString(4)); %></p>
	    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
	    			</div>
	    		</div>
    		<%
    		}
    	    %>
    	</div>
    </div>
    <%
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
    	<div class="col-6 offset-3">
    	    <%
    	    String termo = request.getParameter("termo");
    		Conexao c = new Conexao();
    		
    		//sql
    		String sql = "SELECT * FROM postagens WHERE titulo LIKE '%"+termo+"%'";		
			PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
    		ResultSet rs = ps.executeQuery(sql);
    		
    		
    		while (rs.next()){
    		%>
    			<div class="card pesquisa" id="cards">
	    			<a class="redireciona" href="publicacoes.jsp?codigo=<%out.print(rs.getInt(1));%>">
	    			<div>
	    				<h3><% out.print(rs.getString(2)); %></h3>
	    				<p><% out.print(rs.getString(4)); %></p>
	    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
	    			</div>
	    		</div>
    		<%
    		}
    	    %>
    	</div>
    </div>
	<%
	}
    %>
    
</body>
</html>