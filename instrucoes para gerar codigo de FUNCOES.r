# Estampa/instrucoes para gerar codigo de FUNCOES (1 nível apenas)
# Nessa primeira parte do curso vamos gerar codigos de
#   funcoes EM UM NIVEL APENAS, ou seja, a funçao main
#   pode chamar outras funções, mas essas funçoes "chamadas"
#   por main NÃO PODEM chamar outras funções.

# Veremos na segunda parte da disciplina que essas 
#   funçoes chamadas por main são denominadas 
#   funções "folha" (pois não causam ativações de outras)

# Para definir e chamar apenas funções folha temos
$   códigos mais simples que NÂO necessitam de pilha
#   (pois o funcionamento da pilha só será visto na
#    segunda parte da disciplina)


# Essa sera' primeira vez que codificamos para funcoes
# portanto vamos explicar o que deve ser feito:
#
# para DEFINIR uma funcao:
# ------------------------
#
# a) para gerar uma funcao basta colocar o 
#     label com o nome da mesma e depois o seu codigo
#
#  b) O retorno da funcao deve ser feito com a instrucao abaixo
#     jr $ra     
#
#  c) pela convencao do processador MIPS
#     SE uma funcao  RETORNA um VALOR esse deve ser colocado em $v0
#     ANTES de se fazer o jr $ra
#
#  d) exemplo, suponha xx uma variavel em memoria,
#     para o comando return( xx ) devemos gerar o codigo a seguir:
#
#     lw $v0, xx         # carrega xx em $v0
#     jr $ra             # retorna
#
# para usar os PARAMETROS dentro das funcoes:
# -------------------------------------------
#
#     Os parametros passados para a funcao estao nos registradores $a0 ate' $a3
#     (entao a funcao pode RECEBER ate' 4 parametros de maneira simples)
#     voce pode usar os valores em $a0 ate' $a3 diretamente dentro 
#     da sua funcao,  assim suponha a funcao:
#
#     int soma( int x, int y ) {
#        x = x + y;
#        return( x );
#     }
#
#     pergunta: dentro da funcao soma onde estah a variavel x ?
#     resposta: no registrador $a0
#
#     pergunta: dentro da funcao soma onde estah a variavel y ?
#     resposta: no registrador $a1
#     
#     pergunta: qual e' o codigo a ser gerado para x = x + y acima ?
#     resposta:
#                add $a0, $a0, $a1    # apenas isso!
#
#     porque? porque as variaveis JA' estao nos registradores $a.
#             NESSE caso, nao e' necessario buscar esses valores da memoria
#             e nem alterar valor em memoria
#
#     pergunta: quem coloca os valores nos registradores $a ?
#     resposta: o codigo que CHAMOU a funcao e' responsavel por colocar
#               os valores corretos nos registradores $a 
#               ( na ordem correta dos parametros $a0 ate' $a4 )
#
#     pergunta: nesse caso qual o codigo para return( x )  ?
#     resposta: como x esta' no registrador $a0, e a funcao deve retorna-lo em $v0
#               devemos gerar:
#                           move $v0, $a0        # move x para $v0
#                           jr $ra               # retorna
#
#
#  para CHAMAR uma funcao:
#  -----------------------
#
#  - passar parametros da funcao nos registradores $a0 ate' $a4
#    (entao podemos PASSAR ate' 4 parametros de maneira simples)
#
#  assim, para chamar a funcao ff( xx, yy, zz ) devemos gerar:
#  lw $a0, xx      # busca xx na memoria e passa para $a0  (PRIMEIRO parametro)
#  lw $a1, yy      # busca yy na memoria e passa para $a1  (SEGUNDO parametro)
#  lw $a2, zz      # busca zz na memoria e passa para $a2  (TERCEIRO parametro)
#  jal ff          # CHAMA a funcao ff
#
# ----------------------------------------------------------------------------------