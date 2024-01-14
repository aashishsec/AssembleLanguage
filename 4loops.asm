%include "util.asm"

global _start

section .text

_start:
     
     mov rdi,msg
     call printstr
     call readint
     mov [user_value],rax
     mov rbx,1
     
loop_start:

     mov rcx,[user_value]
     imul rcx,rbx
     mov rdi,rcx
     call printint
     call endl
     add rbx,1
     cmp rbx,100
     jne loop_start
     call exit0
     
     
section .data

     msg: db "Enter The Number-->",10,0

section .bss

     user_value: resb 8
