package ex05;

import javax.swing.JOptionPane;

public class Cargo extends Colaborador {
	private String cargo;
	private double salario;
	
	private void getDadosCargo() {
		cargo = JOptionPane.showInputDialog("Informe o cargo");
		salario = Double.parseDouble(JOptionPane.showInputDialog("Informe o salário"));
	}
	
	public Cargo() {
		getDadosColaborador();
		getDadosCargo();
		
		System.out.println( "Nome:" +nome+
							"\nIdade: "+idade+
							"\nCargo: "+cargo+
							"\nSalário: "+salario);
	}
}
