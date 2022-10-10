package ex06;

public class Class2 extends Class1 {
	
	public Class2() {		// precisa puxar o nome pra classe 1 - constructor super();
		super("Robson");	// nesse caso fica sempre o mesmo
							//além disso, sempre executa o super/construtor da 1 antes da 2, não dá pra mudar
		System.out.println("Executando Classe 2");
	}
	
}
