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
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		Conexao c = new Conexao();
		
		//sql
		String sql = "SELECT COUNT(nome) FROM usuarios WHERE nome = ?";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, usuario);
		ResultSet rs = ps.executeQuery();
		rs.next();
		if (rs.getInt(1)>0){
			response.sendRedirect("mensagens.jsp?codigo=2");
		} else { 
		
		sql = "INSERT INTO usuarios(nome, senha, banido, admin) VALUES (?, ?, 0, 0)";
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, usuario);
		ps.setString(2, senha);
		//cadastra
		ps.execute();
		
		response.sendRedirect("loginUser.jsp?usuario="+usuario+"&senha="+senha);
		}
	%>
</body>
</html>