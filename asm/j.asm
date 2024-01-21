; Written in x86 assembly, j bootsector
; Compile using nasm: nasm -fbin -o j j.asm
main:
	mov al, 10
	mov ah, 0
	int 0x10
	mov al, 3
	mov ah, 0
	int 0x10
	mov ah, 1
	mov cx, 0x2607
	int 0x10
	mov ah, 'j'
	mov dx, 0xb800
	mov ds, dx
	xor bx, bx
	mov [ds:bx], ah
	inc bx
	mov ah, 0x0f
	mov [ds:bx], ah
	jmp $

times (510 - ($ - $$)) db 0
db 0x55
db 0xaa
