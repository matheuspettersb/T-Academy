<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacotao.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>

<title>Blogão do Massa - Home</title>
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
    <h1 class="intro"><u>Bem vindo ao Blogão do Massa</u></h1>
    <div class="row">
    	<div class="col-8 offset-2">
			<%
			Conexao c = new Conexao();
			String sql = "SELECT * FROM postagens ORDER BY cd_postagem DESC LIMIT 10;";

			Statement st = c.efetuarConexao().createStatement();
			
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()){
    		%>
    		<div class="card" id="cards">
    			<a href="publicacoes.jsp?codigo=<%out.print(rs.getInt(1));%>" class="redireciona">
    			<div>
    				<h3><% out.print(rs.getString(2)); %></h3>
    				<p><% out.print(rs.getString(4)); %></p>
    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
    			</div>
    			</a>
    		</div>
    		<%
			}
    		%>
    	</div>
    </div>
    
</body>
</html>