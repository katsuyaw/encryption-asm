INCLUDE Irvine32.inc

.data
key BYTE - 2, 4, 1, 0, -3, 5, 2, -4, -4, 6
keySize = SIZEOF key
plainText BYTE "Sample input text", 0
msg1 BYTE "Message to encrypt: ", 0
msg2 BYTE "Encrypting...", 0
msg3 BYTE "Encrypted message: ", 0


.code
main PROC
call Clrscr
mov edx, OFFSET msg1
call WriteString
mov edx, OFFSET plainText
call WriteString
call CrLf
mov esi, OFFSET plainText

L1 : mov ecx, keySize
mov edi, OFFSET key
call Encryption
jnz L1
mov edx, OFFSET msg2
call WriteString

mov edx, OFFSET msg3
call WriteString
mov edx, OFFSET plainText
call WriteString

call crlf
call crlf

exit
main ENDP

Encryption PROC
L1 : push ecx
cmp BYTE PTR[esi], 0
je DONE

mov cl, [edi]
cmp cl, 0
jge RROT
jl LROT

RROT : ror BYTE PTR[esi], cl
jmp INCR

LROT: rol BYTE PTR[esi], cl
jmp INCR

INCR : inc esi
inc edi
pop ecx
loop L1
ret

DONE: pop ecx
ret
Encryption ENDP
END main
