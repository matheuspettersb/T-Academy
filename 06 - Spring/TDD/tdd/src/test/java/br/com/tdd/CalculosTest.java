package br.com.tdd;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.Test;

public class CalculosTest {
    
    //esperando erro
    @Test(expected = NumberFormatException.class)
    public void testar(){
        Calculos c = new Calculos();
        double resultado = c.divisao("12.5", "a");
        assertEquals(resultado, 5);
    }

    @Test
    public void testeControle(){
        Controle c = new Controle();
        String retorno = c.retornaNome("Ana");
        assertNotEquals(retorno, null);
    }

}