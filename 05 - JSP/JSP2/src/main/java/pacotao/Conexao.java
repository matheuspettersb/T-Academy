package pacotao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	//atributo contendo o acesso ao bd
	public Connection con = null;
	
	//metodo para conectar
	public Connection efetuarConexao() {
		try {								//jdbc:[tipo do banco]:[ip ou link]/[nome do banco]
			con = DriverManager.getConnection("jdbc:mysql://localhost/jsp2", "root", "admin");
			System.out.println("Conexão efetuada com sucesso!");
		}catch(Exception erro) {
			System.out.print(erro.getMessage());
		}
		return con;
	}
}
