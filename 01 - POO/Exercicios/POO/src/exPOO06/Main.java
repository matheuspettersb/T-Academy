package exPOO06;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		int[] vetor = new int[5];
		for (int i = 0; i < vetor.length; i++) {
			int j = Integer.parseInt(JOptionPane.showInputDialog(null, "Informe um número"));
			vetor[i] = j;
		}
		System.out.println("Em ordem decrescente: " + decrescente(vetor));
		System.out.println("Em ordem crescente: " + crescente(vetor));
		System.out.println("Soma: " + somar(vetor));
		System.out.println("Media: " + media(vetor));
		System.out.println("Maiores ou iguais a média: " + maiorIgual(vetor));
	}

	// daria de usar Array.sort() e afins, mas bora fazer na mão
	public static String decrescente(int[] vetor) {
		String str = "";										// 5 5 5 5 2
		for (int i = 0; i < vetor.length; i++) {
			for (int j = i+1; j < vetor.length; j++) {
				if (vetor[j] > vetor[i]) {
					int temp = vetor[j];
					vetor[j] = vetor[i];
					vetor[i] = temp;
				}
			}
		}
		for (int i = 0; i < vetor.length; i++) {
			str += vetor[i] + " ";
		}
		return str;
	}

	public static String crescente(int[] vetor) {
		String str = "";
		for (int i = 0; i < vetor.length; i++) {
			for (int j = i+1; j < vetor.length; j++) {
				if (vetor[j] < vetor[i]) {
					int temp = vetor[j];
					vetor[j] = vetor[i];
					vetor[i] = temp;
				}
			}
		}
		for (int i = 0; i < vetor.length; i++) {
			str += vetor[i] + " ";
		}
		return str;
	}

	public static int somar(int[] vetor) {
		int soma=0;
		for (int i=0; i<vetor.length;i++) {
			soma+=vetor[i];
		}
		return soma;
	}

	public static double media(int[] vetor) {
		double d = somar(vetor);
		d = d/vetor.length;
		return d;
	}

	public static String maiorIgual(int[] vetor) {
		String str = "";
		for(int i=0;i<vetor.length;i++) {
			if (vetor[i]>=media(vetor))
				str += vetor[i]+", ";
			}
		
		if(str.isEmpty())
			return "Nenhum valor era maior ou igual à média.";
		str = str.substring(0, str.length()-2);
		return str;
	}

}
