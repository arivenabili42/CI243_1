## exemplo com IF resolvido em aula
#    int main()
.text
main:
#    {
.data
#       static int a, b, dif;
a: .space 4
b: .space 4
dif: .space 4
#       static int x = 10;
x: .word 10

#    
.text
#       a = readInt();
        jal readInt
        sw $v0, a

#       b = readInt(); 
        jal readInt
        sw $v0, b

#    
#       if( a > b ) {
        if1: 
           lw $t0, a
           lw $t1, b
           sgt $t0 ,$t0,$t1   
           beq $t0, $0, else1
     
#           dif = a - b;
            lw $t0, a
            lw $t1, b
            sub $t0, $t0, $t1
            sw $t0, dif

#           if( a+b >= 2*b ) {
            if2:
               lw $t0, a
               lw $t1, b
               add $t0, $t0, $t1
               lw $t1, b
               mul $t1, $t1, 2
               sge $t0, $t0, $t1
               beq $t0, $0, else2

#              a = a+1000;
               lw $t0, a
               li $t1, 1000
               add $t0, $t0, $t1
               sw $t0, a
               
#              dif = dif + 1000;
               lw $t0, dif
               li $t1, 1000
               add $t0, $t0, $t1
               sw $t0, dif
               
#           } else 
                 j fimIf2
            else2:
            
#              b = b+1000;
               lw $t0, b
               li $t1, 1000
               add $t0, $t0, $t1
               sw $t0, b
               
            fimIf2:
#       } else
      j fimIf1
else1:
#           dif = b - a;
            lw $t0, b
            lw $t1, a
            sub $t0, $t0, $t1
            sw $t0, dif
            
fimIf1:

#    
#       imprimeInt( a );
        lw $a0, a
        jal imprimeInt

#          imprimeChar( ' ' );
           li $a0, ' ' 
           jal imprimeChar

#    
#       imprimeInt( b );
        lw $a0, b
        jal imprimeInt
        
#          imprimeChar( ' ' );
           li $a0, ' ' 
           jal imprimeChar
#          
#       imprimeInt( dif );
        lw $a0, dif
        jal imprimeInt

#          imprimeChar( ' ' );
           li $a0, ' ' 
           jal imprimeChar
#    
#       exit( 0 );
           li $a0, 0 
           jal exit

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