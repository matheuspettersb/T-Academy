package exPOO03;

import javax.swing.JOptionPane;

public class Main {
	
	public static void main(String[] args) {
		String data = JOptionPane.showInputDialog("Insira uma data (dd/mm/yyyy)");
		Calendario c = new Calendario(data);
		JOptionPane.showMessageDialog(null, c.diaAnterior());
		
	}
}
