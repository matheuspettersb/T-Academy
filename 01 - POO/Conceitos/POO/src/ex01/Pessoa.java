package ex01;

import javax.swing.JOptionPane;

public class Pessoa {
	String nome;
	int idade;
	double altura;
	
	public void obterDados() {
		nome = JOptionPane.showInputDialog("Informe seu nome:");
		idade = Integer.parseInt(JOptionPane.showInputDialog("Informe sua idade:"));
		altura = Double.parseDouble(JOptionPane.showInputDialog("Informe sua altura (m):"));
	}
	
	public void retornarDados() {
		String mensagem = ("Nome: "+nome+"\nIdade: "+idade+"\nAltura (m): "+altura);
		JOptionPane.showMessageDialog(null, mensagem);
	}
	

}
