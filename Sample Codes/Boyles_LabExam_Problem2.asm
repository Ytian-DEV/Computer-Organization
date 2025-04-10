;Boyles,Christian Midterm Lab Exam  problem 2
  
.model small
.stack 64
.data
    numDenomPair dw 40, 50, 32, 12, 10, 14  
    gcf dw 0, 0, 0  
    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, numDenomPair 
    lea DI, gcf           

    
    mov CX, 3             
    
GCFLoop:
    
    mov AX, [SI]
    
    
    mov BX, [SI+2]
    
    
    call GCF
    
    
    mov [DI], AX
    
   
    add SI, 4
    add DI, 2

   
    loop GCFLoop

    
    mov AX, 4C00h
    int 21h

main endp


GCF1 proc
   
    GCFLoopStart:
        cmp BX, 0           
        je GCFDone
        xor DX, DX          
        div BX              
        mov AX, BX          
        mov BX, DX          
        jmp GCFLoopStart   

    GCFDone:
        ret
GCF1 endp
