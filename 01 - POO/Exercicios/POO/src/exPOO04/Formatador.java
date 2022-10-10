package exPOO04;

public class Formatador {
	private String termo;
	
	public String verificar() {
		int v = qntVogais();
		int c = qntConsoantes();
		int e = qntEspacos();
		int ce = qntEspeciais();
		
		return 	"Termo informada: "+termo+"\n\nQuantidade de vogais: "+v+"\nQuantidade de consoantes: "+c
				+"\nQuantidade de espaços: "+e+"\nQuantidade de caracteres especiais: "+ce;
		
	}
	
	
	
	public int qntVogais() {
		int qnt = 0;
		char[] vetor = termo.toCharArray();
		for (int i=0; i<vetor.length; i++) {
			if (vetor[i]=='a'||vetor[i]=='e'|| vetor[i]=='i'||vetor[i]=='o'||vetor[i]=='u') {
				qnt++;
			}
		}
		return qnt;
	}
	
	public int qntConsoantes() {
		int qnt = 0;
		char[] vetor = termo.toCharArray();
		for (int i=0; i<vetor.length; i++) {
			if (Character.isLetter(vetor[i])&& vetor[i]!='a'&&vetor[i]!='e'&&vetor[i]!='i'&&vetor[i]!='o'&&vetor[i]!='u') {
				qnt++;
			}
		}
		return qnt;
	}
	
	public int qntNumeros() {
		int qnt = 0;
		char[] vetor = termo.toCharArray();
		for (int i=0; i<vetor.length; i++) {
			if (Character.isDigit(vetor[i])) {
				qnt++;
			}
		}
		return qnt;
	}
	
	public int qntEspacos() {
		int qnt = 0;
		char[] vetor = termo.toCharArray();
		for (int i=0; i<vetor.length; i++) {
			if (vetor[i] == ' ') {
				qnt++;
			}
		}
		return qnt;
	}
	
	public int qntEspeciais() {
		int qnt = 0;
		char[] vetor = termo.toCharArray();
		for (int i=0; i<vetor.length; i++) {
			if (!Character.isLetterOrDigit(vetor[i]) && vetor[i]!=' ') {
				qnt++;
			}
		}
		return qnt;
	}
	
	public Formatador(String termo) {
		this.setTermo(termo);
	}
	
	public String getTermo() {
		return termo;
	}
	public void setTermo(String termo) {
		this.termo = termo;
	}
	
	
}
