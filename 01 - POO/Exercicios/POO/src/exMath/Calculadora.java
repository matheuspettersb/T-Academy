package exMath;

public class Calculadora {
	
	public double soma(double n, double n2) {
		return (n+n2);
	}
	
	public double subtracao(double n, double n2) {
		return (n-n2);
	}
	
	public double multiplicacao(double n, double n2) {
		return (n*n2);
	}
	
	public double divisao(double n, double n2) {
		return (n/n2);
	}
	
	public double sen(double rad) {
		return Math.sin(rad);
	}
	
	public double cos(double rad) {
		return Math.cos(rad);
	}
	
	public double tg(double rad) {
		return Math.tan(rad);
	}
	
	public double log(double n) {
		return Math.log(n);
	}
	
	public double raizQuad(double n) {
		return Math.sqrt(n);
	}
	
	public double raizCub(double n) {
		return Math.cbrt(n);
	}
	
}
