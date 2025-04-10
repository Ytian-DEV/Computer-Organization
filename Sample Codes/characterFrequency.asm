;Character Frequency
.model small
.stack 64
.data
    string db 'pneumonoultramicroscopicsilicovolcanoconiosis$', 0
    target db 'i'
    count db 0

.code          
    main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov SI, offset string
    mov CL, 0
    
    check:                          
    
        mov AL, [SI]
        cmp AL, '$'
        je done
        cmp AL, target
        jne skip
        inc CL
        
        
    skip:
        inc SI
        jmp check
        
    done:
        mov count, CL
        
    mov AX, 4C00h
    int 21h
    main endp
end main