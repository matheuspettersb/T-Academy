<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar pessoa</title>
</head>
<body>
	
	<%
	//obter nome e idade
	String nome = request.getParameter("nome");
	int idade = Integer.parseInt(request.getParameter("idade"));
	
	//out.print(nome+"<br>"+idade);
	
	//efetuar a conexão - teste
	Conexao c = new Conexao();
	//SQL
	String sql = "INSERT INTO pessoas(nome, idade) VALUES (?, ?)";
	
	//preparedStatement
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	//passar os parametros do SQL
	// setando a sstring ("sql"), nome (string) no parametro ("?") 1 e idade (int) no 2
	pstmt.setString(1, nome);
	pstmt.setInt(2, idade);
	//executar
	pstmt.execute();
	
	//redirecionar
	response.sendRedirect("pessoa.jsp");
	%>
	
</body>
</html>