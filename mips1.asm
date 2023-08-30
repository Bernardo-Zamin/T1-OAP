.data
m: .space 4
n: .space 4
m_String:
	.asciiz "Entre com valor de m: "
	
n_String: 
	.asciiz "Entre com valor de n: "

resposta:
	.asciiz "Resultado da recursao Ackermann: "	


.text
	.globl main
main:
	la	$a0, m_String
	li	$v0, 4 
	syscall		#Imprime "Entre com calor de m"
	
	li	$v0,5	#leitura de M
	syscall 
	move 	$s1, $v0
	
	la	$a0, n_String
	li	$v0, 4
	syscall		#. "Entre com valor de n: "
	
	li	$v0, 5
	syscall
	move 	$s2, $v0
	
	move	$a0, $s1
	move	$a1, $s2
	jal	Ackermann
	move	$s0, $v0
	
	la	$a0, resposta
	li	$v0, 4
	syscall
	li	$v0, 1
	move	$a0, $s0
	syscall
	
	li	$v0, 10
	syscall
	
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
        
loop:
	
	
	
	
	
