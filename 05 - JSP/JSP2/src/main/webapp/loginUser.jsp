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
		String usuario = request.getParameter("nome");
		String senha = request.getParameter("senha");
		Conexao c = new Conexao();
		
		if(usuario.equals("admin") && senha.equals("admin")){
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
				out.print(rs.getString(3)+"<br>");
				
				if (usuario.equals(rs.getString(1)) && senha.equals(rs.getString(2)) && rs.getInt(3) == 0) {
					session.setAttribute("usuario", usuario);
					response.sendRedirect("index.jsp");
					out.print("0");
				}
				out.print("1");
			} else {
				//mensagem usuario inválido
				out.print("2");
			}
		}
		out.print("3");
		//response.sendRedirect("index.jsp");
	%>
</body>
</html>