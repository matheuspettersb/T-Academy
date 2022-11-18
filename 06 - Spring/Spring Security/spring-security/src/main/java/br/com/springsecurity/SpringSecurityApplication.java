package br.com.springsecurity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class SpringSecurityApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurityApplication.class, args);
		
		//criptografia
		System.err.println("Administrador -> " + new BCryptPasswordEncoder().encode("admin"));
		System.err.println("User -> " + new BCryptPasswordEncoder().encode("123"));

	}

}
