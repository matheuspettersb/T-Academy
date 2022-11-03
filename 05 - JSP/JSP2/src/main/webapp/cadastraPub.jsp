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
		String titulo = request.getParameter("titulo");
		String autor = request.getParameter("autor");
		String mensagem = request.getParameter("mensagem");
		Conexao c = new Conexao();
		
		//sql
		String sql = "INSERT INTO postagens(autor, titulo, descricao) VALUES (?, ?, ?)";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, autor);
		ps.setString(2, titulo);
		ps.setString(3, mensagem);
		//cadastra
		ps.execute();
		
		response.sendRedirect("admin.jsp");
	%>
</body>
</html>