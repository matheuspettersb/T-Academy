package ex10;

public class Main {
	
	public static void main(String[] args) {
		Padrao p = new Padrao();
		Desenvolvedor d = new Desenvolvedor();

		p.valeTransporte(1000);
		d.valeTransporte(1000);
		
		d.valeAlimentacao(1000);
		p.valeAlimentacao(1000);
	}
}
