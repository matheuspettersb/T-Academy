import { Component } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { Produto } from '../modelo/Produto';
import { ProdutoService } from '../servicos/produto.service';

@Component({
  selector: 'app-produto',
  templateUrl: './produto.component.html',
  styleUrls: ['./produto.component.css']
})
export class ProdutoComponent {
  //construtor
  constructor(private servico:ProdutoService){}

  vetor:Produto[] =[];
  //formulario
  formulario =  new FormGroup({
    produto: new FormControl(),
    valor: new FormControl()
  });

  //inicialização (executa dps de carregar todo o componente)
  ngOnInit(){
    this.selecionar();
  }

  //funcao para retornar os valor no form
  testaForm():void{
    console.log(this.formulario.value)
  }

  //cadastrar
  cadastrar():void{
    let p = new Produto;

    //passando os parametros pro obj produto
    p.produto = this.formulario.value.produto
    p.valor = this.formulario.value.valor
    
    this.servico.cadastrar(p)
    .subscribe(retorno =>{
      //cadastrar produto no vetor
      this.vetor.push(retorno);

      //limpar campos de formulario
      this.formulario.reset();
    })
  }

  //remover produto
  remover(id:number):void{
    //remover do backend
    this.servico.remover(id)
    .subscribe(() =>{})

    //posicao do vetor que esta determinado id
    let pesquisaId = this.vetor.findIndex(obj => {return obj.id === id})

    //excluir produto atraves da psoicao do vetor
    this.vetor.splice(pesquisaId, 1);

  }

  //obter todos os produtos na api
  selecionar():void{
  this.servico.selecionar()
  .subscribe({
    next: retorno => this.vetor = retorno,
    error: () => alert("Falha ao listar") });
  }


}
