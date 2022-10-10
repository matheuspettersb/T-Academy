package exPOO01;

public abstract class SistemaContatoAbstrato {
	
	public abstract String cadastrar(String nome, String email, String telefone);
	public abstract String listar();
	public abstract String pesquisar(String nome);
	public abstract String alterar();
	public abstract String remover();
}
