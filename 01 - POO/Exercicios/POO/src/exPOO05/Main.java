package exPOO05;

import javax.swing.JOptionPane;

public class Main {
	
	public static void main(String[] args) {
	Forca f = new Forca();
	do {f.executa();	
	if(f.getCounterErros()==7 || f.getResposta().equals(f.mostraPalavra()))
		break;
	}while(true);
	if (f.getCounterErros()==7)
		JOptionPane.showMessageDialog(null, "Melhore");
	if (f.getResposta().equals(f.mostraPalavra()))
		JOptionPane.showMessageDialog(null, "Parabéns, mandou bem!\n A palavra era: "+f.getResposta());
	}
		
}
