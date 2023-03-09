#include <stdio.h>
#include <stdlib.h>
#void imprimeInt( int i )
#{
#    printf( "%d", i );
#}
#void imprimeChar( int i )
#{
#    printf( "%c", i );
#}

#int readInt( void )
#{
#    int a;
 #   scanf( "%d", &a );
 #   return a;
#}

#//  PROTOTIPOS DE FUNCOES
#    void imprimeLinhaMeio( int ini, int larg, char ch );
#    void imprimeLinhaBeirada( int ini, int larg, char ch );
#    void imprimeBrancos( int ini );
#//  fim PROTOTIPOS DE FUNCOES

#// leia h e larg (lados de um retangulo)
#// imprime um retangulo de asteriscos com os lados acima


#int main()
.text
main:
#{
 #   static int h, larg;
.data
      h: .space 4
      larg: .space 4
    
  #  static int l;
     l: .space 4

   # h = readInt();
     jal readInt
     sw $v0, h
    #larg = readInt();
     jal readInt
     sw $v0, larg
    #l = 0;
    li $t0, 0
    sw $t0, l
    # while( l < h ) {
      while1:
             lw $t0, l
             lw $t1,h
             slt $t0, $t0, $t1
             beq $t0, $0, fimwhile1
       # imprimeBrancos( 15 );
         li $a0, 15
         jal imprimeBrancos
         
      # if( (l == 0) || (l == (h-1)) )
        if1: 
           lw $t0, h
           subi $t0, $t0, 1 ## h-1
           lw $t1, l
           seq $t0, $t1, $t0 ##(l == (h-1)) 
           lw $t1, l
           seq $t1, $t1, $0 ##(l == 0)
           or $t0, $t1, $t0 ## ( (l == 0) || (l == (h-1)) )
           beq $t0, $0, else1
           
        #   imprimeLinhaBeirada( 15, larg, '-' );
           li $a0, 15
           lw $a1, larg
           li $a2, '-'
           j fimif1
           
      # else
        else1:
             
           #imprimeLinhaMeio( 15, larg, '|' );
            li $a0, 15
            lw $a1, larg
            li $a2, '|'
            fimif1:
#       l = l + 1;  
	lw $t0, l
	addi $t0, $t0, 1
	sw $t0, l
 #      imprimeChar( '\n' ); 
        li $a0,'\n'
   # }
     j while1
     fimwhile1:
    #exit( 0 );
    li $a0, 0
    jal exit
#}

  #  void imprimeLinhaMeio( int ini, int larg, char ch ) a0 = ini, a1 = larg, a2 = ch
  .text
  imprimeLinhaMeio:
   # {
   
    #  static int cc;
       .data
       cc: .space 4
     #   cc = ini;
     .text
     sw $a0, cc
       # while( cc < (ini+larg) ) {
       while2:
              add $t0, $a0, $a1
              lw $t1, cc
              slt $t0, $t1, $t0
              beq $t0, $0, fimwhile2
              
         # if( (cc == ini) || (cc == (ini+larg-1)) )
           if2:
                add $t0, $a0, $a1 ##(ini+larg)
                subi $t0, $t0, 1 ## (ini+larg-1)
                lw $t1, cc
                seq $t0, $t1, $t0
                lw $t1, cc
                seq $t1, $t1, $a0 ##(cc == ini)
                or $t0, $t1, $t0
                beq $t0, $0, else2
                
           # imprimeChar( ch );
           lw $a0, ch
           jal imprimeChar
           j fimif2
         # else
           else2:
           # imprimeChar( ' ' );
           li $a0, ' '
           jal imprimeChar
           fimif2:
         #cc = cc + 1;
         lw $t0, cc
         addi $t0, $t0, 1
         sw $t0, cc
     #  } 
        j while2
        fimwhile2:
        jr $ra
  #  }

    # void imprimeLinhaBeirada( int ini, int larg, char ch )
    # {
    .text
    imprimeBeirada:
      # static int ccc;
     .data
     ccc: .space 4
     .text
  #     ccc = ini;
        sw $a0, ccc
        
  #     while( ccc < (ini+larg) ) {
        while3:
              add $t0, $a0, $a1
              lw $t1, ccc
              slt $t0, $t1, $t0
              beq $t0, $0, fimwhile3

        #  imprimeChar( ch );
           lw $a0, ch
           jal imprimeChar

       #    ccc = ccc + 1;
         lw $t0, ccc
         addi $t0, $t0, 1
         sw $t0, ccc
       #}
       j while3
       fimwhile3:
       jr $ra
       
   # }

 #   void imprimeBrancos( int ini )
 .text
 imprimeBrancos:
  #  {
  
    #   static int cccc;
    .data
    cccc: .space 4
    .text
      # cccc = 0;
      sw $0, cccc
      
       # while( cccc < ini ) {
       while4:
             lw $t0, cccc
             slt $t0, $t0, $a0
             beq $t0, $0, fimwhile4
    #       imprimeChar( ' ' );
           li $a0, ' '
           jal imprimeChar

      #      cccc = cccc + 1;
         lw $t0, cccc
         addi $t0, $t0, 1
         sw $t0, cccc
      # }
      j while4
      fimwhile4:
      jr $ra
 #   }
#########  rotina para ler numero inteiro e colocar o valor em $v0
      .text 
readInt:
         li $v0, 5             # numero da funcao readInt
         syscall               # chamar funcao do SO
         jr   $ra              # return

#########  rotina para imprimir numero inteiro que estah em $a0
imprimeInt: li   $v0, 1           # especifica em $V0 a funcao a ser executada
                                  ## nesse caso a funcao Print Integer 
            syscall               # chama funcao do Sistema Operacional
            jr   $ra              # return
	
#########  rotina para imprimir um caracter que estah em $a0
      .text    
imprimeChar: li   $v0, 11         # especifica em $V0 a funcao a ser executada
                                  ## nesse caso a funcao Print Integer 
            syscall               # chama funcao do Sistema Operacional
            jr   $ra              # return

#########  rotina exit que termina programa com valor passado em  $a0
      .text 
exit:   li   $v0, 10          # system call for exit (especifica termino de programa)
        syscall               # we are out of here.  (chama SO para terminar)   
        #veja que nao tem return visto que o programa termina