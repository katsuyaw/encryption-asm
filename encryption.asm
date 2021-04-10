; Encryption Using Rotate Operations
; Handhika Yanuar Pratama

INCLUDE Irvine32.inc

.data
key BYTE -2,4,1,0,-3,5,2,-4,-4,6
keySize = $ - key
plainText Byte “Sample input",0


.code
main PROC
    call Clrscr
    mov edx,OFFSET plainText
    call WriteString
    call CrLf
    call CrLf
    mov esi,OFFSET plainText

L1: mov ecx,keySize
    mov edi, OFFSET key
    call Encryption
    jnz L1

    mov edx,OFFSET plainText
    call WriteString
    call CrLf
    call CrLf

    exit
main ENDP

Encryption PROC
L1 : 
push ecx
cmp BYTE PTR[esi], 0
je DONE

mov cl, [edi]
cmp cl, 0
jge RROT
jl LROT

LROT:
rol BYTE PTR[esi], cl
jmp ROT

RROT : 
ror BYTE PTR[esi], cl
jmp ROT

ROT:
inc esi
inc edi
pop ecx
loop L1
ret

DONE : 
pop ecx
ret

Encryption ENDP
END main

