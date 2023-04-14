section .data
    apps db 'A1', 0
         db 'A2', 0
         db 'A3', 0
    app_count equ ($ - apps) / 2

    last_response db 0

section .text
    global _start

_start:
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

    mov eax, url_repo
    mov eax, interval

loop_apps:
    pushad

    movzx eax, byte [ecx]
    call draw_app

    popad

    add ebx, 0
    add edi, esi
    add ecx, 2
    dec edx
    jnz loop_apps

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

loop:
    mov eax, 0
    cmp al, [last_response]
    je no_update
    mov [last_response], al

last_response:
    mov eax, 2

    jmp loop

draw_app:
    ret
