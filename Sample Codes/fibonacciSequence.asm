;Fibonacci Sequence

.model small
.stack 64

.data
    fib_array dw 20 DUP(?)   

.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX  

    mov SI, OFFSET fib_array 

    mov AX, 0 
    mov [SI], AX
    add SI, 2

    mov AX, 1  
    mov [SI], AX
    add SI, 2 

    mov CX, 18

fibonacci_loop:
    mov BX, [SI - 4]
    add BX, [SI - 2]
    mov [SI], BX
    add SI, 2
    loop fibonacci_loop

    mov AX, 4C00H
    int 21H
main endp
end main