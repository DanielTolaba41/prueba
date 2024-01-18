;capturar 4 numeros garantizando que el usuario
;ingrese numeros  efectivamente, sumar los numero 1y2 
;restar los numero 3 y 4, multiplicar ambos resultados
;y mostrar el resultado(ya sea de 1 digito o 2 digitos)
include 'emu8086.inc'
org 100h 
inicio:
    mov ah,7
    int 21h
    cmp al,30h
    jb fin
    cmp al,39h
    ja fin
    mov bl,al
    mov dl,bl
    mov ah,2 
    int 21h
    mov dl,','
    int 21h
    
    mov ah,7
    int 21h
    cmp al,30h
    jb fin
    cmp al,39h
    ja fin
    mov bh,al
    mov dl,bh
    mov ah,2
    int 21h
    mov dl,','
    int 21h
    
    mov ah,7
    int 21h
    cmp al,30h
    jb fin
    cmp al,39h
    ja fin
    mov cl,al
    mov dl,cl
    mov ah,2
    int 21h
    mov dl,','
    int 21h
     
    mov ah,7
    int 21h
    cmp al,30h
    jb fin
    cmp al,39h
    ja fin
    mov ch,al
    mov dl,ch
    mov ah,2
    int 21h
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    
    sub bx,3030h
    sub cx,3030h
    
    add bh,bl
    sub cl,ch
    
    mov ax,0
    mov al,bh
    mul cl
    
    cmp al,9
    ja dosDigitos
    PRINT 'El resultado es de un digito y es:'
    mov dl,al
    add dl,30h
    mov ah,2
    int 21h
    jmp fin
    
    dosDigitos:
    
    mov ch,10
    div ch
    mov bx,ax
    mov dl,bl
    add dl,30h
    PRINT 'El resultado es de dos digitos y es:'
    mov ah,2
    int 21h
    mov dl,bh 
    add dl,30h
    int 21h
    
fin:int 20h



