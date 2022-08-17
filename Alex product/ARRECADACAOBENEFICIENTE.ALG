algoritmo "arrecadacao"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Rita de Cássia
var
   D: inteiro
   valor, totarrec: real
   doador: caractere
inicio
      escreval("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _")
      escreval("        Arrecadação Beneficiente")
      escreval("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _")
      escreval("    Muito Obrigado por colaborar")
      escreval("[1] para doar R$ 10 ")
      escreval("[2] para doar R$ 25 ")
      escreval("[3] para doar R$ 50 ")
      escreval("[4] para doar outros valores")
      escreval("[5] para cancelar")
            leia(D)
      escolha(D)
      caso 1
           valor <- 10
      caso 2
           valor <- 25
      caso 3
           valor <- 50
      caso 4
           escreva("Qual o valor da doação? R$ ")
      caso 5
           valor <- 0
      fimescolha
      escreval("Digite seu Nome por favor:")
      leia (doador)
      escreval("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _")
      escreval("    Sua doação foi de R$", valor)
      escreval("           Muito Obrigado ", doador)
      escreval("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _")


      
      
      
      
fimalgoritmo