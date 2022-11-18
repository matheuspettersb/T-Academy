package br.com.springsecurity.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

//usado pra sobrescrever algo do SpringSecurity
@Configuration
//dizendo q agora tem acesso aos nossos roles e atributos
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        //configurando o http
        http
            //precisa desse se n da erro
            .httpBasic()
            .and()
            .authorizeHttpRequests()
            .anyRequest().authenticated();
            return http.build();
    }

    //metodo para permitir acesso sem precisar de autenticação
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer(){
        //rota depois da barra = o que fica liberado
        return (web)-> web.ignoring().antMatchers("/");
    }

    //tem que comentar esse pedaço pq info em memoria + info em banco = conflito

    // //criação de credenciais em memória
    // @Bean
    // //User details = "objeto", user details service = link com o spring security
    // public UserDetailsService users(){
    //     //criando admin
    //     UserDetails admin = User.builder()
    //     .username("admin")
    //     .password(passwordEncoder().encode("admin"))
    //     .roles("ADMIN") //ROLE EM SPRING SECURITY PRECISA ESTAR EM CAPS
    //     .build();

    //     UserDetails user = User.builder()
    //     .username("user")
    //     .password(passwordEncoder().encode("123"))
    //     .roles("USER")
    //     .build();

    //     return new InMemoryUserDetailsManager(admin, user);
    // }

    // //password da role tem que ser convertida pra um tipo password
    // //metodo pra criptografar a senha

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
