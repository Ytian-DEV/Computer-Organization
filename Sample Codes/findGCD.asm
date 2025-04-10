;find the GCD
.model small
.stack 64
.data
    n1 dw 17856
    n2 dw 12456
    gcd dw 0
    
.code 
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, n2
    mov BX, n1
    
    GCDofN1N2:
        mov DX, 00
        mov CX, 00
        div BX
        cmp DX, 00
        je done
        
        mov AX, BX
        mov BX, DX
        jmp GCDofN1N2
        
    done:
        mov gcd, BX
        
        mov AX, 4C00h
        int 21h
        
    main endp
end main
            