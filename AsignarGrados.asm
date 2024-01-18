
org 100h

muestra macro aux
    mov dx,offset aux
    mov ah,9
    int 21h
endm

inicio:
    mov si,offset preKinder
    mov bp,offset kinder
    mov di,offset primaria
    
ciclo:
    muestra edad
    mov ah,1
    int 21h
    cmp al,13
    je imprimir
    call salto
    cmp bh,35h
    jb pk
    cmp bl,35h
    je k
    cmp ch,35h
    ja pr
    
pk: mov [si],al
    inc si
    mov [si],'-'
    inc si
    muestra nom
    call capturarSI
    call salto
    muestra ape
    call capturarSI
    call salto
    muestra apm
    call capturarSI
    call salto
    jmp ciclo

k:  mov [bp],al
    inc bp
    mov [bp],'-'
    inc bp
    muestra nom
    call capturarBP
    call salto
    muestra ape
    call capturarBP
    call salto
    muestra apm
    call capturarBP
    call salto
    jmp ciclo
    
pr: mov [di],al
    inc di
    mov [di],'-'
    inc di
    muestra nom
    call capturarDI
    call salto
    muestra ape
    call capturarDI
    call salto
    muestra apm
    call capturarDI
    call salto
    jmp ciclo
    
imprimir:
    muestra pre
    call salto
    muestra preKinder
    call salto
    muestra kin
    call salto
    muestra kinder
    call salto
    muestra pri
    call salto
    muestra primaria
    jmp fin    

fin:int 20h

nom db 'Nombre:$'
ape db 'Apellido Paterno:$'
apm db 'Apellido Materno:$'
edad db 'Edad:$'
pre db 'Alumnos de PreKinder:$' 
kin db 'Alumnos de Kinder:$'
pri db 'Alumnos de Primaria:$'


preKinder db 200 dup('$') 
kinder db 200 dup('$')
primaria db 200 dup('$')

salto proc
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    ret
    salto endp

capturarSI proc
r:    mov ah,1
    int 21h
    cmp al,13
    je finalizar
    mov [si],al
    inc si
    jmp r
finalizar:    
    ret 
    endp
capturarBP proc
c:    mov ah,1
    int 21h
    cmp al,13
    je finalizar2
    mov [bp],al
    inc bp
    jmp c
finalizar2:
    ret 
    endp
capturarDI proc
ciclar:    mov ah,1
    int 21h
    cmp al,13
    je finalizar3
    mov [di],al 
    inc di
    jmp ciclar
finalizar3:
    ret 
    endp
    
    
