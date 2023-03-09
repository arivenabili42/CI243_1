comando IF
-----------

em C: (versão SEM else)
-----

       if( <exprLogica> )
             <comando>;

       
estampa do if em MIPS: (versão SEM else)
-----------------------

obs: nn eh o numero do label

ifnn: ## colocar um label com o numero do if (isso é OPCIONAL)

      # codigo de <exprLogica> 
      # ... usando instrucoes set
      # ... deixando verdadeiro ou falso em $t0
      beq $t0, $0, fimIfnn          # compara com falso
                                   #vai para fimIfnn se for falso
      # codigo do <comando>;
      ... # incluir aqui

fimIfnn:   #gera o label do fimIf com o número adequado
            # pois não tem parte else


------------------------------------------------------------
------------------------------------------------------------
em C: (versão COM else)
-----

       if( <exprLogica> )
             <comando1>;
       else      
             <comando2>;
       
estampa do if em MIPS: (versão COM else)
-----------------------

obs: nn eh o numero do label

ifnn: ## colocar um label com o numero do if (isso é OPCIONAL)

      # codigo de <exprLogica> 
      # ... usando instrucoes set
      # ... deixando verdadeiro ou falso em $t0
      beq $t0, $0, elsenn          # compara com falso
                                   #vai para elsenn se for falso
      # codigo do <comando1>
      ... # incluir aqui

      j fimIfnn
#elsenn:   #gera o label do elsenn com o número adequado
      # codigo do <comando2>;
      ... # incluir aqui
      
#fimIfnn:   #gera o label do fimIf com o número adequado
            # pois não tem parte else
