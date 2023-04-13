section .data
    last_response db 0

section .text
    global _start

_start
    mov ecx, url_repo
    mov ecx, interval

loop:
    mov eax, 0
    cmp al, [last_response]
    je no_update
    mov eax, 1
    mov [last_response], al

last_response:
    mov eax, 2

    jmp loop
