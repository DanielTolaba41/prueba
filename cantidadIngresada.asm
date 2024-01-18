include 'emu8086.inc'
org 100h

inicio:
    mov bx,0
    mov dh,0
ciclo:
    mov ah,1
    int 21h
    cmp al,30h
    je mostrar
    cmp al,30h
    jb caracter
    cmp al,39h
    jbe esNumero
    cmp al,'A'
    jb caracter
    cmp al,'Z'
    jbe esLetra
    cmp al,'a'
    jb caracter
    cmp al,'z'
    jbe esLetra
    cmp al,'z'
    ja caracter
    
caracter:
    inc bh
    jmp ciclo 

esNumero:
    inc bl
    jmp ciclo
                
esLetra:
    inc dh
    jmp ciclo            

mostrar:
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    Print 'cantidad de caracteres:'
    
    add bx,3030h
    mov dl,bh
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    Print 'cantidad de numeros:'
    mov dl,bl
    int 21h
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    Print 'cantidad de letras:'
    mov dl,dh
    add dl,30h
    int 21h
    jmp fin

fin:int 20h
    



