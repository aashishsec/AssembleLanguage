global _start

section .text

_start:
      mov rax,1
      mov rdi,1
      mov rsi,hello
      mov rdx,hello_input
      syscall
      
 user_input:
      mov rax,0
      mov rdi,0
      mov rsi,input
      mov rdx,1000
      syscall
      mov rbx,rax
 
message_printing:
      mov rax,1
      mov rdi,1
      mov rsi,welcome_mess
      mov rdx,welcome_len
      syscall
 
printing_input:
      mov rax,1
      mov rdi,1
      mov rsi,input
      mov rdx,rbx
      syscall
       
exit:
      mov rax,60
      mov rdi,22
      syscall 

section .data
     
      hello: db 'Enter the Name: '
      hello_input: equ $-hello
      welcome_mess: db 'Ram Ram, '
      welcome_len: equ $-welcome_mess

section .bss
        
        input: resb 1000

