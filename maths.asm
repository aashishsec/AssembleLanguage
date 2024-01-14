global _start

section .text

_start:

   mov rax,12
   add rax,23
   
   mov rax,2
   sub rax,12
   
   mov rax,11
   imul rax,rax,21
   
   mov rax,100
   mov rdx,0
   mov rbx,2
   idiv rbx

_exit:
  
   mov rax,60
   mov rdi,2222
   syscall
