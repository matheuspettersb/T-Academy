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
		String cd = request.getParameter("codigo");
		Conexao c = new Conexao();
		
		//sql
		String sql = "UPDATE comentarios SET situacao = 1 WHERE cd_comentario = ?";		
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, cd);
		
		ps.execute();
		

		sql = "SELECT * FROM comentarios WHERE cd_comentario = ?";		
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, cd);
		
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		response.sendRedirect("publicacoes.jsp?codigo="+rs.getInt(4));
	%>
</body>
</html>