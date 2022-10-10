package exPOO07;

import java.util.Random;

import javax.swing.JOptionPane;

public class BatalhaNaval {
	public int erros = 0;
	public boolean acertou = false;
	public String barco;
	public String bomba1 = "00";
	public String bomba2 = "00";
	public String bomba3 = "00";
	static char mar[][] = new char[][] { 
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' },
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' },
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' },
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' }, 
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' },
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' }, 
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' },
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' }, 
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' },
			{ '~', '~', '~', '~', '~', '~', '~', '~', '~', '~' } };

	public void executa(String chute) {
		int i = Integer.parseInt(String.valueOf(chute.charAt(0)));
		int j = Integer.parseInt(String.valueOf(chute.charAt(1)));
		if (mar[i][j]!='~') {
			JOptionPane.showMessageDialog(null, "Já jogado, tente outra casa");
		}else {
		if (chute.equals(barco)) {
			mar[i][j] = 'N';
			acertou = true;
		} else if (chute.equals(bomba1)||chute.equals(bomba2)||chute.equals(bomba3)) {
				mar[i][j] = 'O';
				erros++;
				JOptionPane.showMessageDialog(null, "BOMBA!");
			} else {
				mar[i][j] = 'X';
				JOptionPane.showMessageDialog(null, "Não acertou nada :/");
			}
		}
	}
	
	public BatalhaNaval() {
		sorteiaPosicoes();
	}
	
	public String mostraMar() {
		String str = "  0 1 2 3 4 5 6 7 8 9\n";
		for (int i = 0; i < 10; i++) {
			str += i + " ";
			for (int j = 0; j < 10; j++) {
				str += mar[i][j]+" ";
			}
			str += "\n";
		}
		return str;
	}
	
	public void sorteiaPosicoes() {
		Random r = new Random();
		int i = r.nextInt(10);
		int j = r.nextInt(10);
		String posicoes = ""+(i)+(j);
		this.barco = posicoes;
		while(bomba1.equals(bomba2)||bomba2.equals(bomba3)||bomba1.equals(bomba3)) {
			this.bomba1 = sorteiaBomba();
			this.bomba2 = sorteiaBomba();
			this.bomba3 = sorteiaBomba();
			}
		}
	
	public String sorteiaBomba() {
		Random r = new Random();
		int i = r.nextInt(10);
		int j = r.nextInt(10);
		return ""+(i)+(j);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
