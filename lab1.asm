#int main()
#{
#   static int a, b, dif;
#   static int x = 10;
#
#   a = readInt();
#   b = readInt();
#
#   if( a > b ) 
#       dif = a - b;
#   else
#       dif = b - a;
#
#   imprimeInt( dif );
#
#   exit( 0 );
#}
#
#
#########  rotina para ler numero inteiro e colocar o valor em $v0
      .text 
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
      .text    
imprimeChar: li   $v0, 11         # especifica em $V0 a funcao a ser executada
                                  # nesse caso a funcao Print Integer 
            syscall               # chama funcao do Sistema Operacional
            jr   $ra              # return

#########  rotina exit que termina programa com valor passado em  $a0
      .text 
exit:   li   $v0, 10          # system call for exit (especifica termino de programa)
        syscall               # we are out of here.  (chama SO para terminar)   
        #veja que nao tem return visto que o programa termina
   
