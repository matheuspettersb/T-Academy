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
		String autor = request.getParameter("autor");
		String mensagem = request.getParameter("mensagem");
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		Conexao c = new Conexao();
		
		String sql = "INSERT INTO comentarios (nm_user, comentario, situacao, cd_postagem) VALUES  (?, ?, 0, ?)";
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps = c.efetuarConexao().prepareStatement(sql);
		ps.setString(1, autor);
		ps.setString(2, mensagem);
		ps.setInt(3, codigo);
		//cadastra
		ps.execute();
		
		
		response.sendRedirect("publicacoes.jsp?codigo="+codigo);
	%>
</body>
</html>