package ex01;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		ArrayList<Pessoa> listaPessoas = new ArrayList<>();
		
		for (int i=0; i<3; i++) {
		Pessoa p = new Pessoa();
		p.obterDados();
		listaPessoas.add(p);
		}
		
		for (int i =0; i<listaPessoas.size(); i++) {
			System.out.println( "Nome: "+listaPessoas.get(i).nome+
								"\nIdade: "+listaPessoas.get(i).idade+
								"\nAltura(m): "+listaPessoas.get(i).altura);
			System.out.println("-----------------");
		}
	}
}
