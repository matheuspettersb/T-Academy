package br.com.servico2;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controle {
    
    @GetMapping("/verificar/{numero}")
    public String positivoNegativo(@PathVariable int numero){
        return numero < 0 ? "O numero é negativo" : "O numero é positivo";
    }
}
