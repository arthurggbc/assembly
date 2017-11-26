.data    #Parde onde as variaveis do programa e mensagens que desejamos imprimir são definidas. 

mensagem:	.asciiz "Digite nota da prova:\n"
situacao:	.asciiz "\nA soma das notas do aluno foi:\n"
media:		.asciiz "\nMedia em provas:\n"

#.asciiz são utilizados por causa das strings acima

		
	.text
	# imprime as mensagens escritas no .asciiz
main:	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava nota1 no registrador $s0	
	add $s0, $zero, $v0

	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava nota1 no registrador $s1	
	add $s1, $zero, $v0
			
	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava nota3 no registrador $s2	
	add $s2, $zero, $v0

	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava nota3 no registrador $s3	
	add $s3, $zero, $v0

	# calcular total das notas
	add $t0, $s0, $s1
	add $t1, $s2, $s3
	add $t2, $t0, $t1

	# fazer media das notas
	addi $t0, $zero, 4
	div $t3, $t2, $t0

	# imprime media
	li $v0, 4 
	la $a0, media
	syscall
	li $v0, 1
	la $a0, ($t3)	
	syscall	

	# imprime total
	li $v0, 4 
	la $a0, situacao
	syscall
	li $v0, 1
	la $a0, ($t2)	
	syscall	

	jr $ra