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
    	    String nome = request.getParameter("nome");
			int cd = Integer.parseInt(request.getParameter("cd"));
			if (nome.equals("admin")){
				response.sendRedirect("index.jsp");
			}
    		Conexao c = new Conexao();
    		
    		//sql
    		String sql = "UPDATE usuarios SET banido = 1 WHERE nome = ?";		
			PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
			ps.setString(1, nome);

    		ps.execute();
    		
    		
    		
			response.sendRedirect("admin.jsp");
    	    %>
</body>
</html>