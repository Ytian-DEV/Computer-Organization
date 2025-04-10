;ReverseString
.model small
.stack 64

.data
    word db 'never$', 0
    length dw 05
    revString db 6 dup('$')      
    
.code
    main proc near
        mov AX, @data
        mov DS, AX
        mov SI, offset word
        mov DI, offset revString
        add SI, length
        dec SI
        
        revLoop:
            mov AL, [SI]
            mov [DI], AL
            inc DI
            dec SI
            dec length
            jnz revLoop
            
        mov byte ptr [DI], '$'
        mov AH, 09h
        mov DX, offset revString
        int 21h
            

    mov AX, 4C00h
    int 21h
    main endp
end main