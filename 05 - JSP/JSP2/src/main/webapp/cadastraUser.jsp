<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacotao.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		Conexao c = new Conexao();
		
		//sql
		String sql = "INSERT INTO usuarios(nome, senha, banido, admin) VALUES (?, ?, 0, 0)";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, usuario);
		ps.setString(2, senha);
		//cadastra
		ps.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>
</html>