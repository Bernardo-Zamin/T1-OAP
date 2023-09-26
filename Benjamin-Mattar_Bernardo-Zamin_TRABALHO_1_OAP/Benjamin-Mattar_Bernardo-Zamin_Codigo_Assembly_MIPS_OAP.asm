.data

ack: .asciiz   "              Programa Ackermann"

nomes: .asciiz "Componentes: <Benjamin Mattar e Bernardo Zamin>"

espaco: .asciiz "=============================================="

mnString: .asciiz "Digite os parametros m e n para calcular A(m, n) ou -1 para abortar a execuçao "

newline: .asciiz "\n"       # String de nova linha

resposta1: .asciiz "A("	
resposta2: .asciiz ", "
resposta3: .asciiz ") = "


impFim: .asciiz "Valor negativo digitado! Programa encerrado!"
#A(1, 2) = 4
.text
	.globl main
		main:
			li $v0, 4
			la $a0, ack
			syscall
			la $a0, newline
			syscall
			la $a0, espaco
			syscall
			la $a0, newline
			syscall
			li $v0, 4
			la $a0, nomes
			syscall
			la $a0, newline
			syscall
			li $v0, 4
			la $a0, espaco
			syscall
			la $a0, newline
			syscall
			move $t0, $zero  #m
			move $t1, $zero  #n
			li $t5, 1

			loop:
    				# Verificar se m >= 0  exemplo: m=-1  dai t2 =1
    				#slti $t2, $t0, 0     # $t2 = 1 se $t0 < 0, senão $t2 = 0
    
    				# Verificar se n >= 0   exemplo: n=-1  dai t3=1
    				#slti $t3, $t1, 0     # $t3 = 1 se $t1 < 0, senão $t3 = 0
    
   	 			# Verificar se pelo menos um dos m >= 0 ou n >= 0
    				#se qualquer um dos dois for negativo, $t4 = 1
    				#or $t4, $t2, $t3     # $t4 = 1 se $t2 = 1 ou $t3 = 1, senão $t4 = 0
    
  	  			# Sair do loop se a condição for falsa
  	  			#beq $t4, $t5, end_loop   # Pular para o fim do loop se $t4 = 0
    
  	  			li $v0, 4
  	  			la $a0, mnString
  	  			syscall
    
   	 			li $v0, 5
   	 			syscall
  	  
  	  			move $t0, $v0  #m
    
   	 			blt $t0, $zero, end_loop
   	 			
   	 			move 	$s1, $v0
    				
    				li $v0, 5
   	 			syscall
    
  	  			move $t1, $v0 #n
    
   	 			blt $t1, $zero, end_loop
   	 			
   	 			move 	$s2, $v0
   	 			
   	 			move	$a0, $s1
				move	$a1, $s2
				
				
				
				jal	Ackermann
				move	$s0, $v0
				
				li	$v0, 4
				la	$a0, resposta1
				syscall
				move $a0, $t0
				li	$v0, 1
				syscall
				li	$v0, 4
				la	$a0, resposta2
				syscall
				move $a0, $t1
				li	$v0, 1
				syscall
				li	$v0, 4
				la	$a0, resposta3
				syscall
				li	$v0, 1
				move	$a0, $s0
				syscall
				
				li	$v0, 4
				la $a0, newline
				syscall
	
				j loop
	
Ackermann:
	addi	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$s0, 16($sp)
        sw	$s1, 12($sp)
        sw	$s2, 8($sp)
        sw	$s3, 4($sp)
        sw	$s4, 0($sp)
	
	move	$s0, $a0
	move	$s1, $a1
	move	$s2, $0
	
	bne	$s0, 0, caso1
	addi	$s2, $s1, 1
caso1:
	ble	$s0, 0, caso2
	bne	$s1, 0, caso2
	addi	$a0, $s0, -1
	addi	$a1, $0, 1
	jal	Ackermann
	move	$s2, $v0
caso2:
	ble	$s0, 0, fim
	ble	$s1, 0, fim
	move	$a0, $s0
	addi	$a1, $s1, -1
	jal	Ackermann
	move	$a1, $v0
	addi	$a0, $s0, -1
	jal	Ackermann
	move	$s2, $v0
fim:
	move	$v0, $s2
	
	lw  	$ra, 20($sp)
        lw	$s0, 16($sp)
        lw	$s1, 12($sp)
        lw	$s2, 8($sp)
        lw	$s3, 4($sp)
        lw	$s4, 0($sp)        
        addi	$sp, $sp, 24
        jr      $ra
    				
    				
    
  	  			

				end_loop:
				li $v0, 4
				la $a0, newline
				syscall
				la $a0, impFim
				syscall
				li $v0, 10
				syscall




