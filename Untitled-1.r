# OBS: Esse exercício é apenas para praticar
#      Não vale nota

# CI243 - UFPR - CopiaVetorReverso - Nota:   (wz)
# Aluno: 
# matricula: 
#
# Dado o programa C abaixo (em comentarios #) gerar o programa 
#   assemby equivalente do MIPS conforme padroes 
#   de geracao de codigo estudados.
# Gerar apenas a parte relativa ao codigo (parte de dados e
# funcoes de biblioteca ja' foram inseridas abaixo

# IMPORTANTE:
# cada linha do programa foi precedida de comentarios
# assim, DEVEMOS GERAR o programa copiaVetorReverso.asm (assembly) escrevendo:
#    a) para linha programa em C inserir o 
#        codigo MIPS gerado adequadamente PARA CADA linha
#    b) MANTER o original em comentarios
#    c) escreva em assembly SEMPRE alinhando na MARGEM ESQUERDA
#    d) NAO MUDE nada nas linhas de comentarios #, 
#       NAO MUDE o ALINHAMENTO  (-5 pts se fizer isso)

# - NAO DELETE nada, nem os comentarios
# - alterar esse arquivo INSERINDO CODIGO assembly entre linhas
# - o numero de cada QUESTAO estah `a direita em comentarios
# - o valor de cada questao esta' ao final desse arquivo
# - seu codigo devera' funcionar mostrando resultados 
#     se voce nao fizer todas as questoes 

# obs1: o numero 32 equivale ao espaco ' ' na tabela ASCII
# obs2: o numero 10 equivale ao \n na tabela ASCII

#       int main ( ) 
#       {
#          static int A[5];
#          static int Rev[5];
#          
#          static int i;
#          
#          // “Digite o vetor A: “
#          for( i=0; i < 5; i++ ) // leitura do Vetor A
#             A[i] = readInt();
#             
#          // copia A em Rev em ordem reversa (ver SLIDES)
#          for( i=0; i < 5; i++ )
#             Rev[i] = A[5-i-1];   // copia em ordem reversa
#       
#          for( i=0; i < 5; i++ ) { // imprime o vetor Rev
#             imprimeInt( Rev[i] );
#             imprimeChar( ' ' );
#          }   
#       
#          return 0;
#       } // fim do programa
       