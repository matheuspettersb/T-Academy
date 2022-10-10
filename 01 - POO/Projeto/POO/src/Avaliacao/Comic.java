package Avaliacao;

//Explicação do projeto na classe main
public class Comic extends Modelo{
	private Editora editora;
	private int anoPublicacao;
	private String titulo;
	private String criador;
	private String ilustrador;
	
	//método herdado da classe abstrata (Modelo), retorna uma String com todos os dados do Objeto
	@Override
	public String emTexto() {
		return "Comic - \""+this.getTitulo()+"\""+
				"\nAutor: "+this.getCriador()+
				"\nIlustrado por: "+this.getIlustrador()+
				"\nEditora: "+this.getEditora().getNome()+
				"\nAno de publicação: "+this.getAnoPublicacao()+"\n";
	}

	//método construtor da classe
	public Comic(int anoPublicacao, String titulo, String criador, String ilustrador) {
		this.anoPublicacao = anoPublicacao;
		this.titulo = titulo;
		this.criador = criador;
		this.ilustrador = ilustrador;
	}
	
	//métodos get/set dos atributos da classe
	public Editora getEditora() {
		return editora;
	}

	public void setEditora(Editora editora) {
		this.editora = editora;
	}

	public int getAnoPublicacao() {
		return anoPublicacao;
	}

	public void setAnoPublicacao(int anoPublicacao) {
		this.anoPublicacao = anoPublicacao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCriador() {
		return criador;
	}

	public void setCriador(String criador) {
		this.criador = criador;
	}

	public String getIlustrador() {
		return ilustrador;
	}

	public void setIlustrador(String ilustrador) {
		this.ilustrador = ilustrador;
	}
	
}
