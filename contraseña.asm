include 'emu8086.inc'
org 100h

inicio:
    mov cx,10
    mov si,offset aux
    mov bx,0
    print 'Ingrese Contra:'
ciclo:
    
    mov ah,7
    int 21h
    cmp al,13
    je actualizar
    mov [si],al
    mov dl,'*'
    mov ah,2
    int 21h
    inc si
    inc bl
    loop ciclo

actualizar:
    mov si,offset aux
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    int 21h
    mov cl,bl
    PRINT 'Su contra es:'
    jmp mostrar
    mostrar:
    
    mov ah,2
    mov dl,[si]
    int 21h
    inc si
    loop mostrar

fin: int 20h
    aux db dup(20)