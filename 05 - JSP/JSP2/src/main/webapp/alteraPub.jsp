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
		String autor = request.getParameter("autor");
		String titulo = request.getParameter("titulo");
		String mensagem = request.getParameter("mensagem");
		
		//Estabelece conexao
		Conexao c = new Conexao();
		
		//sql
		String sql = "UPDATE postagens SET autor = ?, titulo = ?, descricao =  ? WHERE cd_postagem = ?";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, autor);
		ps.setString(2, titulo);
		ps.setString(3, mensagem);
		ps.setInt(4, codigo);
		//altera
		ps.execute();
		
		response.sendRedirect("gerenciar.jsp");
	%>
</body>
</html>