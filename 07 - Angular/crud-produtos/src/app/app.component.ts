import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  // criar variaveis
  texto:string = 'Hello angular!'
  //TS por padrao usa apostrofo ao inves de aspas
  exibir:boolean = true;
  nomes:string[] = ['Ben', 'Max', 'Gwen', 'Kevin', 'Azmuth']

  //any é o default, pode ser qqr coisa, até obj
  clientes:any[] = [
    {'nome':'Benjamin', 'idade':10},
    {'nome':'Max', 'idade':64},
    {'nome':'Gwen', 'idade':11},
    {'nome':'Kevin', 'idade':11},
    {'nome':'Azmuth', 'idade':1700}
  ]

  //palavra function n funciona aqui
  // funcao para exibir uma msg
  mensagem():void {
    alert('grosso!');
  }

  exibirOcultar():void{
    this.exibir = !this.exibir;
  }

}
