.model small
.stack 64

.data
    array db 12, 45, 7, 3, 89, 34, 22, 19, 78, 10, 5, 66, 92, 1, 50

.code   
    mov CX, 15
    lea BX, array
    lea DI, array   
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
        
    
    selectionSort proc near   
        mov AH, [DI] 
        call getMin 
         
        mov AL, AH
        xchg [BX], AL 
        sub SI, BX
        xchg [BX+SI], AL 
        sub DI, CX   
        inc DI     
        inc BX
        loop selectionSort  
        
        
        mov AX, 4C00H
        int 21H 
        ret
    selectionSort endp
    
        
    getMin proc near  
        cmp DI, 15
        je endfunc       
        mov AL, [DI]
        cmp AL, AH
        jg skip
        mov AH, AL   
        mov SI, DI   
        
        skip:
        inc DI
        call getMin
        
        endfunc: 
        RET
    getMin endp     