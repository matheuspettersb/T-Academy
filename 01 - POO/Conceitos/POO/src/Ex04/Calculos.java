package Ex04;

public class Calculos {
	//exemplo do laço for -  se tirar o "static" ele sempre dá um, pq cada objeto tem seu proprio counter
	public static int counter;
	
	//se tirar a anotação de static fica obrigatorio criar um objeto de "Calculos" pra fazer a operação
	public static void soma(int n1, int n2) {
		System.out.println(n1+n2);
	}
	
	public Calculos() {
		counter++;
		System.out.println(counter);
	}
	
	
	
	
}
