section .data
    apps db 'A1', 0
         db 'A2', 0
         db 'A3', 0
    app_count equ $/8

    last_response db 0

section .text
    global _start

_start
    mov ecx, apps
    mov ebx, 0
    mov edi, 0
    mov esi, 40
    mov edx, app_count

    mov ax, 0x4F02
    mov bx, 0x4114
    int 0x10
    test ah, ah
    jnz error

    mov ecx, url_repo
    mov ecx, interval

    mov eax, 0
    jmp exit

exit:
    mov ebx, eax
    mov eax, 1
    int 0x80

loop:
    mov eax, 0
    cmp al, [last_response]
    je no_update
    mov eax, 1
    mov [last_response], al

last_response:
    mov eax, 2

    jmp loop
