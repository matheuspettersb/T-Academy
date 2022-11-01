<%@page import="java.sql.ResultSet"%>
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
		String user = (String)session.getAttribute("usuario");

		String usuarioNovo = request.getParameter("usuario");
		String senhaNova = request.getParameter("senha");
		Conexao c = new Conexao();
		
		String sql = "UPDATE usuarios SET nome = ?, senha = ? WHERE nome = ?";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, usuarioNovo);
		ps.setString(2, senhaNova);
		ps.setString(3, user);
		//cadastra
		ps.execute();
		
		
		response.sendRedirect("loginUser.jsp?nome="+usuarioNovo+"&senha="+senhaNova);
	%>
</body>
</html>