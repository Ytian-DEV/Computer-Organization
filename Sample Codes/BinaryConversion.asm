;Binary Conversion
.model small
.stack 64
.data
    decNum dw 143
    binConv db 10 dup(?)
    ;base dw 2
    
.code
    main proc near
        mov AX, @data
        mov ES, AX
        mov DS, AX
        
        mov AX, decNum
        mov CX, 2
        lea SI, binConv
        
        
        divisionLoop:
            xor DX, DX
            div CX
            mov [SI], DL
            inc SI
            cmp AX, 0
            jne divisionLoop
            
            
        mov AX, 4C00h
        int 21h
     main endp
end main
