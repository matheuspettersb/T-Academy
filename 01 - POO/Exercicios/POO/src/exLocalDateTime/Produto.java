package exLocalDateTime;

import java.time.LocalDateTime;

public class Produto {
	private String nome;
	private double valor;
	private int qtdEsqtoque;
	private LocalDateTime dataHoraCadastro;

	public Produto(String nome, double valor, int qtd) {
		this.setNome(nome);
		this.setValor(valor);
		this.setQtdEsqtoque(qtd);
		this.setDataHoraCadastro(LocalDateTime.now());
		}
	
	public String getDataHoraCadastroFormatado() {
		String dhCad = 	this.dataHoraCadastro.getDayOfMonth() +"/"+this.dataHoraCadastro.getMonthValue()+"/"+this.dataHoraCadastro.getYear()+"/"+
						" - "+this.dataHoraCadastro.getHour()+":"+this.dataHoraCadastro.getMinute();
		return dhCad ;
	}
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	
	public int getQtdEsqtoque() {
		return qtdEsqtoque;
	}
	public void setQtdEsqtoque(int qtdEsqtoque) {
		this.qtdEsqtoque = qtdEsqtoque;
	}
	
	public LocalDateTime getDataHoraCadastro() {
		return dataHoraCadastro;
	}
	
	public void setDataHoraCadastro(LocalDateTime dataHoraCadastro) {
		this.dataHoraCadastro = dataHoraCadastro;
	}
	
	
}
