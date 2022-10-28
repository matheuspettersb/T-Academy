<%@page import="pacote.Aluno"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aprendendo JSP</title>
</head>
<body>
	<h1>Hello World!</h1>
	
	<%
		out.print("<p>Exibindo dados via out.print</p>");
		String nome = "Drena";
		out.print("<p>O nome é: "+nome+"</p>");
	%>
	
	<hr>
	
	<table border="1">
		<thead>
			<tr>
				<th>Número</th>
			</tr>
		</thead>
		<tbody>
			<%
				//laço de repeticao
				for (int i=0;i<10;i++){
				%>
				<tr>
					<td><%out.print(i);%></td>
				</tr>	
				<%
				}
			%>
		</tbody>
	</table>
	
	<hr>
	
	<%
		//instanciar objeto da classe aluno
		Aluno a = new Aluno("Alice", 8,10);
		out.print("<h1>"+a.retorno()+"</h1>");
	%>
	
</body>	
</html>