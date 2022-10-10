package exPOO01;

import javax.swing.JOptionPane;

public class MainEx01 {
	
	public static void main(String[] args) {
		SistemaContatos sc = new SistemaContatos();
		String escolha;
		do {
			String menu = JOptionPane.showInputDialog(	"Bem vindo(a).\nInforme a operação que gostaria de realizar\n"+
														"\n1. Cadastrar um novo contato"+
														"\n2. Listar os contatos"+
														"\n3. Pesquisar um contato"+
														"\n4. Alterar um contato"+
														"\n5. Remover um contato\n"+
														"\n413. Sair\n\n");
			escolha = menu;

			switch (escolha) {
			case "1":
				String n = JOptionPane.showInputDialog("Digite o nome do contato:");
				String em = JOptionPane.showInputDialog("Digite o E-mail do contato:");
				String t = JOptionPane.showInputDialog("Digite o telefone do contato:");
				JOptionPane.showMessageDialog(null, sc.cadastrar(n, em, t));
				break;

			case "2":
				JOptionPane.showMessageDialog(null, sc.listar());
				break;

			case "3":
				String nome = JOptionPane.showInputDialog("Digite o nome do contato:");
				JOptionPane.showMessageDialog(null, sc.pesquisar(nome));
				break;

			case "4":
				JOptionPane.showMessageDialog(null, sc.alterar());
				break;

			case "5":
				JOptionPane.showMessageDialog(null, sc.remover());
				break;
				
			case "413":
				JOptionPane.showMessageDialog(null, "Até mais");
				break;
				
			default:
				JOptionPane.showMessageDialog(null, "Operação não reconhecida");
				break;
			}
		}while(!escolha.equals("413"));
		
	}
	
}
