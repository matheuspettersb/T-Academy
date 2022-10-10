package exString;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		System.out.println("### Exercícios String ###");
		exercicio1();
		System.out.println("-----------");
		exercicio2();
		System.out.println("-----------");
		exercicio3();
	}

	public static void exercicio1() {
		String frase = JOptionPane.showInputDialog("Informe uma frase ou palavra: ");
		String letra;

		for (int i = 0; i < frase.length(); i++) {
			letra = String.valueOf(frase.charAt(i));
			if (i % 2 == 0) {
				System.out.print(letra.toUpperCase());
			} else {
				System.out.print(letra.toLowerCase());
			}
		}
	}

	public static void exercicio2() {
		int counter = 0;
		String str = JOptionPane.showInputDialog("Informe uma palavra:");
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == 'a' || str.charAt(i) == 'e' || str.charAt(i) == 'i' || str.charAt(i) == 'o'
					|| str.charAt(i) == 'u') {
				counter++;
			}
		}
		System.out.println(str + " - " + counter + " vogais.");
	}

	public static void exercicio3() {
		String verbo = JOptionPane.showInputDialog("Informe um verbo terminado em ar");
		if (!verbo.endsWith("ar")) {
			System.out.println("Palavra inválida - Deve ser verbo terminado em AR");
		}
		verbo = verbo.substring(0,verbo.lastIndexOf("ar"));
		System.out.println( "Eu "+verbo+"o"+
							"\nTu "+verbo+"as"+
							"\nEle "+verbo+"a"+
							"\nNos "+verbo+"amos"+
							"\nVos "+verbo+"ais"+
							"\nEles "+verbo+"am");
	}

}
