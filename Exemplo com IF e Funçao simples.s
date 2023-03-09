## Exemplo com IF e Funçao simples (funçao MAX com 2 parametros)
#    int main()
.text
main:
#    {
.data
#       static int a, b, m;
a: .space 4
b: .space 4
m: .space 4

#    
.text
#       a = readInt();
        jal readInt
        sw $v0, a

#       b = readInt(); 
        jal readInt
        sw $v0, b

#    
#       m = max( a, b );
        lw $a0, a
        lw $a1, b
        jal max
        sw $v0, m

#    
#       imprimeInt( m );
        lw $a0, m
        jal imprimeInt


#    
#       exit( 0 );
           li $a0, 0 
           jal exit

#    }

#    int max( int a, int b )
#    {
.text
max:
#       if( a > b )
        if1:
           # observe que a e b sao parametros em $a0 e $a1
           sgt $t0, $a0, $a1
           beq $t0, $0, else1
           
#          return a;
           move $v0, $a0     #prepara o valor de retorno
           jr $ra
            
#       else
        j fimIf1  
else1:
        
#          return b;   
           move $v0, $a1     #prepara o valor de retorno
           jr $ra
           
fimIf1:           
           
#    }


#########  rotina para ler numero inteiro e colocar o valor em $v0
      .text 
readInt:
         li $v0, 5             # numero da funcao readInt
         syscall               # chamar funcao do SO
         jr   $ra              # return

#########  rotina para imprimir numero inteiro que estah em $a0
      .text 
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