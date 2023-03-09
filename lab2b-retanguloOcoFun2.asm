# CI243 - UFPR - LAB2b - Nota:   (wz)
# Aluno: 
# matricula: 
# Dado o programa C abaixo (em comentarios #) gerar o programa 
#   assemby equivalente do MIPS conforme padroes 
#   de geracao de codigo estudados.
# Gerar apenas a parte relativa ao codigo (parte de dados e
# funcoes de biblioteca ja' foram inseridas abaixo

# IMPORTANTE:
# cada linha do programa foi precedida de comentarios
# assim, DEVEMOS GERAR o programa lab2b-solucao.asm (assembly) escrevendo:
#    a) para linha programa em C inserir o 
#        codigo MIPS gerado adequadamente PARA CADA linha
#       ATENCAO: vc deve inserir codigo assembly DEPOIS da linha fonte,
#                em ORDEM, em SEQUENCIA, como no gabarito, caso nao seja seguido
#                pode nao ser possivel seguir seu codigo,
#                sera' descontado ate' 20 pts em caso nao siga essa diretiva.
#    b) MANTER o original em comentarios
#    c) escreva em assembly SEMPRE alinhando na MARGEM ESQUERDA
#       PORQUE? fica mais legivel, 
#            assembly alinha à esquerda, codigo C fica com alinhamento normal
#    d) NAO MUDE nada nas linhas de comentarios ##, 
#       NAO MUDE o ALINHAMENTO  (-10 pts se fizer isso)

# Entrega: somente ESSE arquivo (apenas um arquivo 
#                        com o codigo de TODAS as questoes)
# - NAO DELETE nada, nem os comentarios
# - alterar esse arquivo INSERINDO CODIGO assembly entre linhas
# - o numero de cada QUESTAO estah `a direita em comentarios
# - o valor de cada questao esta' ao final desse arquivo
# - seu codigo devera' funcionar mostrando resultados 
#     mesmo se nao fizer todas as questoes
 

# obs1: o numero 32 equivale ao espaco ' ' na tabela ASCII
# obs2: o numero 10 equivale ao \n na tabela ASCII

#
#// leia h e larg (lados de um retangulo)
#// imprime um retangulo de asteriscos com os lados acima
#
#
#int main()
#{
#    static int h, larg;
#    static int l;
#
#    h = readInt();
#    larg = readInt();
#
#    l = 0;
#    
#    while( l < h ) {
#
#       imprimeBrancos( 15 );
#       if( (l == 0) || (l == (h-1)) )
#           imprimeLinhaBeirada( 15, larg, '-' );
#       else
#           imprimeLinhaMeio( 15, larg, '|' );
#
#       l = l + 1;  
#       imprimeChar( '\n' );     
#    }
#
#    exit( 0 );
#}
#
#    void imprimeLinhaMeio( int ini, int larg, char ch )
#    {
#      static int c;
#
#       c = ini;
#       while( c < (ini+larg) ) {
#         if( (c == ini) || (c == (ini+larg-1)) )
#           imprimeChar( ch );
#         else
#            imprimeChar( ' ' );
#         c = c + 1;
#       }
#    }
#
#    void imprimeLinhaBeirada( int ini, int larg, char ch )
#    {
#      static int c;
#
#       c = ini;
#       while( c < (ini+larg) ) {
#
#           imprimeChar( ch );
#           c = c + 1;
#       }
#    }
#
#    void imprimeBrancos( int ini )
#    {
#      static int c;
#
#       c = 0;
#       while( c < ini ) {
#
#           imprimeChar( ' ' );
#           c = c + 1;
#       }
#    }
#


.text
#########  rotina para ler numero inteiro e colocar o valor em $v0
readInt:
         li $v0, 5             # numero da funcao readInt
         syscall               # chamar funcao do SO
         jr   $ra              # return
#########  rotina para imprimir numero inteiro que estah em $a0
imprimeInt: li   $v0, 1           # especifica em $V0 a funcao a ser executada
                                  # nesse caso a funcao Print Integer 
            syscall               # chama funcao do Sistema Operacional
            jr   $ra              # return
#########  rotina para imprimir um caracter que estah em $a0
imprimeChar: li   $v0, 11         # especifica em $V0 a funcao a ser executada
                                  # nesse caso a funcao Print Integer 
            syscall               # chama funcao do Sistema Operacional
            jr   $ra              # return
#########  rotina exit que termina programa com valor passado em  $a0
exit:   li   $v0, 10          # system call for exit (especifica termino de programa)
        syscall               # we are out of here.  (chama SO para terminar)   
         jr   $ra              # return
        #veja que nao tem return visto que o programa termina
#
