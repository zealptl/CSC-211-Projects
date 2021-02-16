; Author: Zeal Patel
; Date: Feb 19, 2021
; Class: CSC 211 - CC1
; Project 1 - Task 1

global _start

section .text
_start:
	push eax		; save eax to stack
	push message		; push argument to stack
	call strlen		; call the strlen function

	add esp, 4		; remove arguments
	mov edx, eax		; save the return value in edx from eax
	pop eax			; restore eax


	mov eax, 4		; move the system call number, 4 for write, into the eax register
	mov ebx, 1		; move the ststem call number, 1 for stdout, into ebx register
	mov ecx, message	; move the address of the message string into ecx register
	mov edx, edx		; move the size of the message string into edx 
	int 80h			; request and interrupt for libc
exit:
	mov eax, 1		; move the system call number, 1 for exit, into eax register
	mov ebx, 0		; return 0 upon exit
	int 80h 		; request an interrupt for libc

strlen:
; subrouine prologue
	push ebp		; save the old base pointer value
	mov  ebp, esp		; set the new base pointer value
	push edi		; save the register to be used for string 
	push esi		; save the register to  used as a counter

; subrouine body
	mov edi, [ebp+8] 	; register now has the string
	mov esi, 0		; set counter value to 0

stringstart:
	cmp [edi], byte 0	; check the byte for a character
	jz  stringend		; jump to end of string if previous statement if zero
	inc esi			; increment counter otherwise
	inc edi			; move the postion to next byte of string
	jmp stringstart		; start the next iteration of the loop

; subroutine epilogue
stringend:
	mov eax, esi 		; move value in esi to eax to be returned
	pop esi			; restore the original value of esi regiester
	pop edi			; restore the original value of edi register
	mov ebp, esp		; deallocate local variables
	pop ebp			; restore the caller's base pointer value
	ret

section .data
message: db "sample string", 0Ah	; message string with 0Ah as a line break
