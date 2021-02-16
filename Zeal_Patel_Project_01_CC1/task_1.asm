; Author: Zeal Patel
; Title: Project 1 - Task 1
; Class: CSC 211 - CC1
; Date: Feb 19, 2021

global _start

section .text
_start:
	mov eax, 4		; Move the system call number, 4 for write, into the eax register
	mov ebx, 1		; Move the ststem call number, 1 for stdout, into ebx register
	mov ecx, message	; Move the address of the message string into ecx register
	mov edx, 24		; Move the size of the message string into edx 
	int 80h			; Request and interrupt for libc
exit:
	mov eax, 1		; Move the system call number, 1 for exit, into eax register
	mov ebx, 0		; Return 0 upon exit
	int 80h 		; Request an interrupt for libc

section .data
message db "Zeal Patel", 0Ah, "23727917", 0Ah, "CC1", 0Ah	; message string with 0Ah as a line break
