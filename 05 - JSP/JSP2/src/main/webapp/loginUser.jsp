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
		
		
		if(usuario.equals("admin") && senha.equals("admin")) {
		    session.setAttribute("usuario", usuario);
		    response.sendRedirect("admin.jsp");
		} else {
			String sql = "SELECT COUNT(nome) FROM usuarios WHERE nome = ?";
			PreparedStatement ps = c.efetuarConexao().prepareStatement(sql);
			ps.setString(1, usuario);
			
			ResultSet rs = ps.executeQuery();
			
			//precisa dar o next pra ele puxar a primeira linha do resultado
			rs.next();
			if (rs.getInt(1)>0){
				sql = "SELECT * FROM usuarios WHERE nome = ?";
				ps = c.efetuarConexao().prepareStatement(sql);
				ps.setString(1, usuario);
				
				rs = ps.executeQuery();
				
				//precisa dar o next pra ele puxar a primeira linha do resultado de novo
				rs.next();
				out.print(rs.getString(1)+" "+usuario+"<br>");
				out.print(rs.getString(2)+" "+senha+"<br>");
				out.print(rs.getInt(3)+"<br>");
				if (rs.getInt(3) == 1){
					//banido
					response.sendRedirect("mensagens.jsp?codigo=3");
				} else if (usuario.equals(rs.getString(1)) && senha.equals(rs.getString(2))) {
					//conecta
					session.setAttribute("usuario", usuario);
					response.sendRedirect("index.jsp");
				} else {
				//nome ou senha errados
				response.sendRedirect("mensagens.jsp?codigo=4");
				}
			} else {
				response.sendRedirect("mensagens.jsp?codigo=4");
			}
		}
	%>
</body>
</html>