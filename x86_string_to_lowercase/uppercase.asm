section .data
message_1: db "String you want lowercase:", 0xA
message_2: db "Here's your string in lowercase:", 0xA

section .bss
buffer resb 64

section .text

global _start

_start:
  mov rax, 1
  mov rdi, 1
  lea rsi, [message_1]
  mov rdx, 27
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 64
  syscall

  mov rbx, rax
  lea rdi, [buffer]

  xor rax, rax
  call _str_lower
  
  mov rax, 1
  mov rdi, 1
  lea rsi, [message_2]
  mov rdx, 33
  syscall

  mov rax, 1
  lea rsi, [buffer]
  mov rdx, rbx
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall

_str_lower:
  char_checker:
  cmp rax, rbx
  je done

  cmp byte [rdi], 0x5a
  jg past_treatment
  cmp byte [rdi], 0x41
  jl past_treatment

  add byte [rdi], 0x20

  past_treatment:
  inc rax
  inc rdi
  cmp byte [rdi], 0x00
  jne char_checker

  done:
  ret
