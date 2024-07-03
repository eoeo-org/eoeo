; Written in x86 assembly, eoeo bootsector
; Compile using nasm: nasm -fbin -o eoeo eoeo.asm
main:
    ; Set video mode to 10h
    mov al, 10
    mov ah, 0
    int 0x10
    ; Set video mode to 03h (80x25 text mode)
    mov al, 3
    mov ah, 0
    int 0x10
    ; Set cursor type
    mov ah, 1
    mov cx, 0x2607
    int 0x10

    ; Prepare for writing to video memory
    mov dx, 0xb800
    mov ds, dx
    xor bx, bx

    ; Write 'e' to video memory
    mov ah, 'e'
    mov [ds:bx], ah
    inc bx
    mov ah, 0x0f
    mov [ds:bx], ah
    inc bx

    ; Write 'o' to video memory
    mov ah, 'o'
    mov [ds:bx], ah
    inc bx
    mov ah, 0x0f
    mov [ds:bx], ah
    inc bx

    ; Write 'e' to video memory
    mov ah, 'e'
    mov [ds:bx], ah
    inc bx
    mov ah, 0x0f
    mov [ds:bx], ah
    inc bx

    ; Write 'o' to video memory
    mov ah, 'o'
    mov [ds:bx], ah
    inc bx
    mov ah, 0x0f
    mov [ds:bx], ah

    ; Infinite loop to keep the program running
    jmp $

times (510 - ($ - $$)) db 0
db 0x55
db 0xaa
