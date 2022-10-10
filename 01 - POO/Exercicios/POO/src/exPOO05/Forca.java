package exPOO05;

import java.util.Random;

import javax.swing.JOptionPane;

public class Forca {
	private static String[] palavras = { "Impostor", "Grosso", "Sozinho", "Memoria", "Ascender", "Torre", "As",
			"Selado", "Cavalo", "Valquiria", "Deus", "Cinema", "Piada", "Rainha", "Orgulho", "Duvida", "Chimpanze",
			"Sonegar", "Imposto", "Puro", "Lua", "Arauto", "Chama", "Tecer", "Dancinha", "Navio", "Veleiro"};
	private String resposta;
	private int counterErros;
	private int counterAcertos;
	private char[] acertos;
	private char[] erros;

	public Forca() {
		Random r = new Random();
		int i = r.nextInt(palavras.length);
		resposta = palavras[i];
		acertos = new char[resposta.length()];
		erros = new char[7];
		resposta = resposta.toUpperCase();
		counterErros = 0;
		counterAcertos = 0;
	}
	
	public void executa() {
		String visual = "Jogo da Forca:\n"+
						"Erros: "+counterErros+"/7\n\n\n"+
						"Palavra: "+mostraPalavra()+"\n\n"+
						"Letras acertadas: " + getAcertosString()+
						"\nLetras erradas: "+getErrosString();
		String letra  = JOptionPane.showInputDialog(null, visual+"\n\nInforme uma letra");
		if (letra.length()==1) {
			letra = letra.toUpperCase();
			char ch = letra.charAt(0);
			if (Character.isLetter(ch)) {
				if (!jaUsada(ch)) {
					if (validaLetra(ch)) {
						counterAcertos++;
					} else {
						counterErros++;
					}
				} else {
					JOptionPane.showMessageDialog(null, "Caracter já informado, tente outro");
				}
			} else {
				JOptionPane.showMessageDialog(null, "Você deve informar uma LETRA");
			}
		} else {
			JOptionPane.showMessageDialog(null, "Você deve informar somente uma letra");
		}
		
	}
	

	private boolean jaUsada(char c) {
		for (int i=0; i<acertos.length;i++) {
			if (acertos[i]==c)
				return true;
		}
		for (int i=0;i<erros.length;i++) {
			if (erros[i]==c)
				return true;
		}
		return false;
	}

	public boolean validaLetra(char a) {
		String str = String.valueOf(a);
		str.toUpperCase();
		boolean acerto = false;
		for (int i = 0; i < resposta.length(); i++) {
			if (resposta.charAt(i) == a) {
				acertos[counterAcertos] = a;
				acerto = true;
			}
		}
		if (acerto)
			return true;
		else
			erros[counterErros] = a;
			return false;
	}

	public String mostraPalavra() {
		char[] palavraQuebrada = new char[resposta.length()];
		for (int i = 0; i < this.resposta.length(); i++) {
			for (int j = 0; j < this.acertos.length; j++) {
				if (this.resposta.charAt(i) == acertos[j]) {
					palavraQuebrada[i] = resposta.charAt(i);
				}
			}
		}

		for (int i = 0; i < this.resposta.length(); i++) {
			if (palavraQuebrada[i] == '\u0000') {
				palavraQuebrada[i] = '_';
			}
		}
		String str = "";
		for (int i = 0; i < palavraQuebrada.length; i++) {
			str += palavraQuebrada[i];
		}
		return str;
	}

	public String getAcertosString() {
		String str = "";
		for (int i=0; i<acertos.length; i++) {
			str +=" "+acertos[i]+" ";
		}
		return str;
	}
	
	public String getErrosString() {
		String str = "";
		for (int i=0; i<7; i++) {
			str +=" "+erros[i]+" ";
		}
		return str;
	}
	
	public int getErros() {
		return this.counterErros;
	}

	public String getResposta() {
		return resposta;
	}

	public void setResposta(String resposta) {
		this.resposta = resposta;
	}

	public int getCounterErros() {
		return counterErros;
	}

	public void setCounterErros(int counterErros) {
		this.counterErros = counterErros;
	}

	public int getCounterAcertos() {
		return counterAcertos;
	}

	public void setCounterAcertos(int counterAcertos) {
		this.counterAcertos = counterAcertos;
	}
	
	
	

}
