global _start

section .text

_start:
      jmp main

main:

    mov rax,0
    mov rdi,0
    mov rsi,user_key
    mov rdx,64
    syscall

compare_key:
     cmp rax,orginal_key_len
     jne access_denied
     mov rsi,orginal_key
     mov rdi,user_key
     mov rcx,orginal_key_len
     repe cmpsb
     je access_granted
     jne access_denied
     
     
access_granted:

     mov rax,1
     mov rdi,1
     mov rsi,access_granted_msg
     mov rdx, access_granted_msg_len
     syscall
     jmp exiting 

access_denied:
     mov rax,1
     mov rdi,1
     mov rsi,access_denied_msg
     mov rdx, access_denied_msg_len
     syscall

exiting:
      mov rax,60
      mov rdi,222
      syscall
     

section .data

     access_granted_msg: db "Access Granted!",10
     access_granted_msg_len: equ $-access_granted_msg
     access_denied_msg: db "Access Denied!",10
     access_denied_msg_len: equ $-access_denied_msg
     orginal_key: db "1111-2222-3333"
     orginal_key_len: equ $-orginal_key
    

section .bss

     user_key: resb 64
    
