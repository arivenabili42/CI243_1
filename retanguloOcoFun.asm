#// leia h e larg (lados de um retangulo)
#// imprime um retangulo de asteriscos com os lados acima
#
#

.data 
salvaRA: .space 4

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
#       if( (l == 0) || (l == (larg-1)) )
#           imprimeLinhaBeirada( larg );
#       else
#           imprimeLinhaMeio( larg );
#
#       l = l + 1;  
#      imprimeChar( '\n' )         
#    }
#
#    exit( 0 );
#}

#    void imprimeLinhaMeio( int larg )
#    {
#      static int c;
#
#       c = 0;
#       while( c < larg ) {
#         if( (c == 0) || (c == (larg-1)) )
#           imprimeChar( '*' );
#         else
#            imprimeChar( ' ' );
#         c = c + 1;
#       }
#    }

#    void imprimeLinhaBeirada( int larg )
#    {
#      static int c;
.data
cB: .space 4
salvaLarg: .space 4

.text
imprimeLinhaBeirada:

#       c = 0;
        sw $0, cB

#       while( c < larg ) {
while03:
          lw $t0, cB
          slt $t0, $t0, $a0
          beq $t0, $0, endWhile03

#           imprimeChar( '*' );
          sw $a0, salvaLarg
          li $a0, '*'
          sw $ra, salvaRA    // salva $ra
          jal imprimeChar  
          lw $ra, salvaRA    // recupera $ra
          lw $a0, salvaLarg
          
#         c = c + 1;
          lw $t0, cB
          addi $t0, $t0, 1
          sw $t0, cB
#       }
        j while03
endWhile03:
#    }
     jr $ra

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
