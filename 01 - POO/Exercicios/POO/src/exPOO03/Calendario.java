package exPOO03;

public class Calendario {
	private int dia;
	private int mes;
	private int ano;

	public Calendario(String data) {
		String[] separacao = data.split("/");
		setDia(Integer.parseInt(separacao[0]));
		setMes(Integer.parseInt(separacao[1]));
		setAno(Integer.parseInt(separacao[2]));
	}

	public String diaAnterior() {
		if (!validaDataFull(this.getDia(), this.getMes(), this.getAno()))
			return "data inválida";
		else
			ajustaDia();
		return "Dia anterior: "+this.getDia()+"/"+this.getMes()+"/" +this.getAno();
	}

	public int ajustaDia() {
		if (this.getDia() == 1) {
			if (this.getMes() == 1 || this.getMes() == 2 || this.getMes() == 4 || this.getMes() == 6
					|| this.getMes() == 8 || this.getMes() == 9 || this.getMes() == 11) {
				setDia(31);
				ajustaMes(this.getMes());
			} else if (this.getMes() == 5 || this.getMes() == 7 || this.getMes() == 10 || this.getMes() == 12) {
				setDia(30);
				ajustaMes(this.getMes());
			} else if (this.getMes() == 3) {
				if (isBissexto(this.getAno())) {
					setDia(29);
					ajustaMes(this.getMes());
				} else {
					setDia(28);
					ajustaMes(this.getMes());
				}
			}
			return this.getDia();
		}
		setDia(this.getDia()-1);
		return this.getDia();
	}

	public int ajustaMes(int mes) {
		if (mes == 1) {
			setMes(12);
			ajustaAno(this.getAno());
		} else {
			setMes(mes - 1);
		}
		return this.getMes();
	}

	public int ajustaAno(int ano) {
		if (ano < 1900 || ano > 2100)
			return -1;
		this.setAno(ano - 1);
		return this.getAno();
	}

	public boolean isBissexto(int ano) {
		if (ano % 4 != 0) {
			return false;
		}
		return true;
	}

	public boolean validaDataFull(int dia, int mes, int ano) {
		if (dia<=0 || dia>31)
			return false;
		else if (mes<=0 || mes>12)
			return false;
		else if (ano<1900|| ano>2100)
			return false;
		return true;
	}

	// get/set
	public int getDia() {
		return dia;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public int getMes() {
		return mes;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

}
