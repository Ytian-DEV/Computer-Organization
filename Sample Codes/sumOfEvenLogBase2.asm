;sum of even log2
.model small
.stack 64
.data
    wordArray dw 19,33,48,65,0
    sumLogBase2Approx dw 0

.code
    main proc near
    mov AX, @data
    mov ES, AX  
    mov DS, AX            
    
    lea SI, wordArray
    mov AX, 00
    
    start: 
        mov CX, 00
        xor DX, DX
        mov AX, [SI]
        
    log:
        shr AX, 1
        inc CX
        cmp AX, 00
        jne log 
    
    mov BX, CX
    dec BX
    mov AX, BX
    mov CX, 2 
    div CX
    cmp DX, 00
    jne begin
    
    ;mov AX, DI
    add sumLogBase2Approx, BX
    mov BX, 00   
    
    begin:
        ;mov AX, [SI]
        add SI, 2
        cmp AX, 00
        je end
        jmp start
    
    end:
    mov AX, 4C00h
    int 21h
    main endp
end main