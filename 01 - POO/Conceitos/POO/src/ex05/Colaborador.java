package ex05;

import javax.swing.JOptionPane;

public class Colaborador {
	protected String nome;
	protected int idade;
	
	protected void getDadosColaborador() {
		nome = JOptionPane.showInputDialog("Informe o nome");
		idade = Integer.parseInt(JOptionPane.showInputDialog("Informe a idade"));
	}
	
	
}
