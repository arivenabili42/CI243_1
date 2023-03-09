# int main() 
.text
main:
# {
.data
#    	static int a, b, c, d, m;
    	a: .space a 
      b: .space b 
      c: .space c 
      d: .space d 
      m: .space m
.text
#    	a = readInt();
    	jal readInt
      sw $v0, a
#    	b = readInt();
    	jal readInt
      sw $v0, b
#    	c = readInt();
    	jal readInt
      sw $v0, c 
#    	d = readInt();
    	jal readInt
      sw $v0, d 
#    	m = max( a, b );
    	lw $t0, a 
      lw $t1, b 
      jal max 
      sw $v0, m
#    	m = max( m, c );
    	lw $t0, m 
      lw $t1, c 
      jal max
      sw $v0, m
#    	m = max( m, d );
    	lw $t0, m 
      lw $t1, d
      jal max
      sw $v0, m
#    imprimeInt( m );
    	lw $a0, m
      jal imprimeInt
#      exit( 0 );
	li $a0, 0 
      jal exit
# }


# int max( int a, int b )
.text
main:
# {
.data
#   static int maior;
    maior: .space 4
.text
#   	if( a > b ) // a e b são parametros 
	if1:
            sgt $t0, $a0, $a1
            beq $t0, $0, else1
#      	maior = a;
	      sw $a0, m
#   else
    j fimif1
    else1:
#           maior = b;
	      sw $a1, m
fimif1:	
#   	return( maior );
      lw $v0, m 
      jr $ra
#	prepara o valor de retorno
	
# }


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

