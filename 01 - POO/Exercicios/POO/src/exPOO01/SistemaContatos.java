package exPOO01;

import java.util.ArrayList;
import javax.swing.JOptionPane;

public class SistemaContatos extends SistemaContatoAbstrato {

	private ArrayList<Contato> listaContatos = new ArrayList<>();

	@Override
	public String cadastrar(String nome, String email, String telefone) {
		Contato c = new Contato(nome, email, telefone);
		listaContatos.add(c);
		return "Contato adicionado com sucesso";
	}

	@Override
	public String listar() {
		String msg = 	"----- LISTA DE CONTATOS -----\n";
		for (Contato c : listaContatos) {
			msg += 	"Nome: " + c.getNome() + 
					"\nE-mail: " + c.getEmail() + 
					"\nTelefone: " + c.getTelefone() +
					"\n-----------------------------\n";
		}
		return msg;
	}

	@Override
	public String pesquisar(String nome) {
		String msg = "";
		for (Contato c : listaContatos) {
			if (c.getNome().equals(nome)) {
			msg += 	"-----------------------------\n"+
					"Nome: " + c.getNome() + 
					"\nE-mail: " + c.getEmail() + 
					"\nTelefone: " + c.getTelefone() +
					"\n-----------------------------\n";
			}
		}
		if (msg=="")
			return "Contato inexistente";
		else
		return msg;
	}

	@Override
	public String alterar() {
		String msg = 	"Informe o numero do contato a ser alterado:\n\n"+
						"----- LISTA DE CONTATOS -----\n";
		for (Contato c : listaContatos) {
			msg += 	"Nome: " + c.getNome() + 
					"\nE-mail: " + c.getEmail() + 
					"\nTelefone: " + c.getTelefone() +
					"\n-----------------------------\n";
		}
		String numero = JOptionPane.showInputDialog(null, msg);
		int index = -1;
		for (int i=0; i<listaContatos.size();i++) {
			if (listaContatos.get(i).getTelefone().equals(numero)) {
				index = i;
			}
		}
		
		if (index == -1)
			return "Numero inexistente";
		else {
			String dado = JOptionPane.showInputDialog("Digite o novo nome:");
			listaContatos.get(index).setNome(dado);
			dado = JOptionPane.showInputDialog("Digite o novo E-mail:");
			listaContatos.get(index).setEmail(dado);
			dado = JOptionPane.showInputDialog("Digite o novo telefone:");
			listaContatos.get(index).setTelefone(dado);
			return "Contato alterado com sucesso";
		}
	}

	@Override
	public String remover() {
		String msg = 	"Informe o numero do contato a ser removido:\n\n"+
						"----- LISTA DE CONTATOS -----\n";
		for (Contato c : listaContatos) {
			msg += 	"Nome: " + c.getNome() + 
					"\nE-mail: " + c.getEmail() + 
					"\nTelefone: " + c.getTelefone() +
					"\n-----------------------------\n";
		}
		String numero = JOptionPane.showInputDialog(null, msg);
		int index = -1;
		for (int i=0; i<listaContatos.size();i++) {
			if (listaContatos.get(i).getTelefone().equals(numero)) {
				index = i;
			}	
		}

		if (index == -1)
			return "Numero inexistente";
		else {
			listaContatos.remove(index);
			return "Contato removido com sucesso";
		}
	}

}











