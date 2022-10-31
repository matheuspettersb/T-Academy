<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
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
		//Obter  código da pessoa
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		out.print(codigo);
		
		//Estabelece conexao
		Conexao c = new Conexao();
		
		//sql
		String sql = "DELETE FROM pessoas WHERE codigo = ?";
		
		PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
		ps.setInt(1, codigo);
		//"primera interrogação que aparecer no documento recebe o código"
		
		//remove
		ps.execute();
		
		response.sendRedirect("pessoa.jsp");
	%>

</body>
</html>