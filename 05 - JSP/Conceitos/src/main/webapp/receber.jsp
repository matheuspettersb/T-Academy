<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receber</title>
</head>
<body>
	
	<%
		//obter nome e idade
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		
		//exbir nome e idade
		out.print("<h1>"+nome+"</h1>");
		out.print("<h1>"+idade+"</h1>");
	%>
</body>
</html>