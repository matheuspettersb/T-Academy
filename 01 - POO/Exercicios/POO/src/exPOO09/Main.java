package exPOO09;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		Velha v = new Velha();
		String opcao = "";
		while (!opcao.equals("1") || opcao.equals("2")) {
			opcao = JOptionPane.showInputDialog("Informe o modo de jogo desejado\n\n1. PvP\n2. PvE");
			if (!opcao.equals("1") || opcao.equals("2"))
				JOptionPane.showMessageDialog(null, "Favor insira o numero do modo de jogo desejado (1 ou 2)");
		}
		if (opcao.equals("1")) {
			boolean jogador = true; // true = jogador 1, false = 2;
			System.out.println(v.verificaVitoria());
			while (!v.verificaVitoria()) {
				if (jogador) {
					String posicao = JOptionPane
							.showInputDialog("Vez do jogador 1\n\n" + v.mostraVelha() + "\n\nInforme a casa da jogada");
					if (posicao.length() != 2) {
						JOptionPane.showMessageDialog(null, "Você deve informar um número de 2 digitos");
					} else {
						if (!Character.isDigit(posicao.charAt(0)) || !Character.isDigit(posicao.charAt(1))) {
							JOptionPane.showMessageDialog(null,
									"Você deve informar um número de 2 digitos");
						} else {
							v.marcaPonto(posicao);
						}
					}
				} else {
					String posicao = JOptionPane
							.showInputDialog("Vez do jogador 2\n\n" + v.mostraVelha() + "\n\nInforme a casa da jogada");
					if (posicao.length() != 2) {
						JOptionPane.showMessageDialog(null, "Você deve informar um número de 2 dígitos");
					} else {
						if (!Character.isDigit(posicao.charAt(0)) || !Character.isDigit(posicao.charAt(1))) {
							JOptionPane.showMessageDialog(null,
									"Você deve informar um número de 2 digitos");
						} else {
							v.marcaPonto(posicao);
						}
					}
				}
			}
		} else {
			while (!v.verificaVitoria()) {
				if(v.turno%2==1) {
					JOptionPane.showMessageDialog(null,"Parabéns jogador 1\nVocê ganhou!");
				} else {
					JOptionPane.showMessageDialog(null,"Parabéns jogador 2\nVocê ganhou!");
				}
			}
		}

	}

}
