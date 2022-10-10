package exPOO02;

public class Poupanca {
	private double valorInvestido;
	private int tempo;
	private double jurosAnual;
	private double valorTotal;
	
	public Poupanca(double valorInvestido, int tempo, double juros) {
		this.valorInvestido = valorInvestido;
		this.tempo = tempo;
		this.jurosAnual = juros;
		this.valorTotal = valorInvestido;
	}
	
	public double getJurosMensal(double anual) {
		return (anual/12);
	}
	
	public double aplicaJurosMensal(double mensal, double total) {
		double temp = this.valorTotal+(mensal*total);
		setValorTotal(temp);
		return (mensal*total);
	}
	
	public String getDadosPoupanca() {
		String str = " Mês - Valor ganho no mês - Total da aplicacao\n";
		for (int i=1; i<=this.getTempo(); i++) {
			str += 	i+"º mês  - R$ "+this.aplicaJurosMensal(this.getJurosMensal(this.getJurosAnual()), this.getValorTotal())+" - R$ "+
					this.getValorTotal()+"\n";
		}
		return str;
	}
	
	
	public double getValorInvestido() {
		return valorInvestido;
	}
	public void setValorInvestido(double valorInvestido) {
		this.valorInvestido = valorInvestido;
	}
	
	public int getTempo() {
		return tempo;
	}
	public void setTempo(int tempo) {
		this.tempo = tempo;
	}
	
	public double getJurosAnual() {
		return jurosAnual;
	}
	public void setJurosAnual(double juros) {
		this.jurosAnual = juros;
	}

	public double getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(double valorTotal) {
		this.valorTotal = valorTotal;
	}
	

}
