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
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		Conexao c = new Conexao();
		
		//sql
		String sql = "DELETE FROM comentarios WHERE cd_postagem = ?";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps.setInt(1, codigo);
		//exclui comentarios
		ps.execute();
		
		sql = "DELETE FROM postagens WHERE cd_postagem = ?";
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setInt(1, codigo);
		//exclui o post
		ps.execute();
		
		response.sendRedirect("gerenciar.jsp");
	%>
</body>
</html>