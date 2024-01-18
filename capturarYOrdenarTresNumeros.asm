;Capturar 3 numeros de 2 digitos ordenarlos
;y mostrarlos de mayor a menor
include 'emu8086.inc'
org 100h
inicio:
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
    sub bh,30h
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
    sub bl,30h
    mov ax,0
    mov al,bh
    mov dh,10
    mul dh
    add al,bl
    mov bh,al
    mov dl,',' 
    mov ah,2
    int 21h
    
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
    sub bl,30h
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
    sub ch,30h
    mov ax,0
    mov al,bl
    mul dh
    add al,ch
    mov bl,al
    mov dl,',' 
    mov ah,2
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
    sub ch,30h
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
    sub cl,30h
    mov ax,0
    mov al,ch
    mul dh
    add al,cl
    mov ch,al
    mov dl,10 
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    PRINT 'Ordenado de Mayor a Menor es:'
    mov dl,10 
    mov ah,2
    int 21h
    mov dl,13
    int 21h
    
    cmp bh,bl
    ja mayor
    xchg bh,bl
    jmp mayor
    
    mayor:
    cmp bh,ch
    ja menor
    xchg bh,ch
    jmp menor
    
    menor:
    cmp bl,ch
    ja imprimir
    xchg bl,ch
    jmp imprimir
    
    
    imprimir:
    mov ax,0
    mov al,bh
    div dh
    mov dx,ax
    add dx,3030h
    mov ah,2
    int 21h
    mov dl,dh
    int 21h
    mov dl,','
    int 21h
    
    mov ax,0
    mov al,bl
    mov dh,10
    div dh
    mov dx,ax
    add dx,3030h
    mov ah,2
    int 21h
    mov dl,dh
    int 21h
    mov dl,','
    int 21h
    
    mov ax,0
    mov al,ch
    mov dh,10
    div dh
    mov dx,ax
    add dx,3030h
    mov ah,2
    int 21h
    mov dl,dh
    int 21h
    
    
    
fin: int 20h


