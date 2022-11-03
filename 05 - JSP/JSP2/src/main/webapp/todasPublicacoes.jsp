<%@page import="pacotao.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogão do Massa - Todos os Posts</title>
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
            <form  action="pesquisa.jsp" class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Pesquisar" aria-label="Search" name="termo">
                <button class="btn btn-outline-light" type="submit">Pesquisar</button>
            </form>
        </div>
    </nav>
    	<%
		    String nome = (String)session.getAttribute("usuario");
		    if (nome!=null){
				out.print("<h4 id=\"bemvindo\">Logado(a) como: "+nome+"</h4>");
    		}
		%>
    <h1 class="intro"><u>Todas as publicações</u></h1>
    <div class="row">
    	<div class="col-8 offset-2">
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
	    				<a class="redireciona" href="publicacoes.jsp?codigo=<%out.print(rs.getInt(1));%>">
		    				<h3><% out.print(rs.getString(2)); %></h3>
		    				<p><% out.print(rs.getString(4)); %></p>
		    				<h6>Por: <% out.print(rs.getString(3)); %></h6>
	    				</a>
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