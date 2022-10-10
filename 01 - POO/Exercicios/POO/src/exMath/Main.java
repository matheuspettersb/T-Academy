package exMath;

import java.util.Random;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		exercicio01();
		exercicio02();
	}

	public static void exercicio01() {
		Calculadora c = new Calculadora();
		int n1 = 0;
		int n2 = 0;

		String escolha;

		do {
			String menu = JOptionPane
					.showInputDialog("Fala meu parcero. O que vamos calcular hoje?" + "\n1. SOMA" + "\n2. SUBTRAÇÃO"
							+ "\n3. MULTIPLICAÇÃO" + "\n4. DIVISÃO" + "\n5. SENO" + "\n6. COSSENO" + "\n7. TANGENTE"
							+ "\n8. RAIZ QUADRADA" + "\n9. RAIZ CÚBICA" + "\n10. LOGARITIMO" + "\n\n413. SAIR");
			escolha = menu;

			switch (escolha) {
			case "1":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o primeiro numero ai pae"));
				n2 = Integer.parseInt(JOptionPane.showInputDialog("Agora o segundo chef"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.soma(n1, n2));
				break;

			case "2":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o primeiro numero ai pae"));
				n2 = Integer.parseInt(JOptionPane.showInputDialog("Agora o segundo chef"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.subtracao(n1, n2));
				break;

			case "3":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o primeiro numero ai pae"));
				n2 = Integer.parseInt(JOptionPane.showInputDialog("Agora o segundo chef"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.multiplicacao(n1, n2));
				break;

			case "4":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o primeiro numero ai pae"));
				n2 = Integer.parseInt(JOptionPane.showInputDialog("Agora o segundo chef"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.divisao(n1, n2));
				break;

			case "5":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o ângulo do seno ai meu peixe (em rad)"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.sen(n1));
				break;

			case "6":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o ângulo do cosseno ai meu peixe (em rad)"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.cos(n1));
				break;

			case "7":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o ângulo da tangente ai meu peixe (em rad)"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.tg(n1));
				break;

			case "8":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o numero pra raiz quadrada, mago"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.raizQuad(n1));
				break;

			case "9":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Manda o numero pra raiz cúbica, mago"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.raizCub(n1));
				break;

			case "10":
				n1 = Integer.parseInt(JOptionPane.showInputDialog("Log é pesado, mas bora. Manda o numero ai"));
				JOptionPane.showMessageDialog(null, "Resultado: " + c.log(n1));
				break;

			case "413":
				JOptionPane.showMessageDialog(null, "Jogamo pae. Até mais");
				break;

			default:
				JOptionPane.showMessageDialog(null, "Irmão, lê oqq é pra informar.");
			}
		} while (!escolha.equals("413"));
	}

	public static void exercicio02() {
		Random random = new Random();
		int n = random.nextInt(100);
		int chute;
		int counter = 0;
		
		do {
			chute = Integer.parseInt(JOptionPane.showInputDialog("Um número de 0 a 100 foi sorteado!\n Tente acertar!"));
			int diferenca = Math.abs(chute - n); // pegar a diferença de chute pra n
			if (diferenca>0 && diferenca<=10) {
				JOptionPane.showMessageDialog(null, "Está perto.");
				counter++;
			} else {
				if (diferenca<=20 && diferenca!=0) {
					JOptionPane.showMessageDialog(null, "Está longe.");
					counter++;
				} else {
					if (diferenca>20) {
						JOptionPane.showMessageDialog(null, "Muito longe.");
						counter++;
					}
				}
			}

		} while (chute != n);
		
		if (counter == 0) {
			JOptionPane.showMessageDialog(null, "Nossa! Acertou na mosca");
		} else {
			if (counter <= 5) {
				JOptionPane.showMessageDialog(null, "Parabéns! Você é bom de adivinhação");
			} else {
				if (counter <= 10) {
					JOptionPane.showMessageDialog(null, "Muito bom, continue assim");
				} else {
					if (counter <= 20) {
						JOptionPane.showMessageDialog(null, "Podia ser melhor, continue tentando");
					} else {
						JOptionPane.showMessageDialog(null, "Meio lerdo você, hein?");
					}
				}
			}

		}

	}
}
