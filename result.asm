org 7C00h

jmp start

fio: db 'Suvorov Oleg Andreevich',0
group: db 'NMT-323901',0

start:
;set video mode
mov ah, 00h
mov al, 13h
int 10h

; ����� ���
mov si, fio
mov dl, 0
mov dh, 23
loop1:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next1
mov bl, 04h         ; ������������� ������� ���� ������
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop1
next1:

; ����� ������
mov si, group
mov dl, 0
mov dh, 24
loop2:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next2
mov bl, 04h         ; ������������� ������� ���� ������
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop2
next2:

; ��������� ������
mov si, positions
loop3:
mov ah, 0ch         ; ������� ��� ��������� ��������
mov bh, 0           ; ����� ��������
mov cx, [cs:si]
cmp cx, 0
je next3
add cx, 160         ; ������� X ������ (���������� ������)
add si, 2
mov dx, [cs:si]
add dx, 1           ; ������� Y ����
mov al, 04h         ; ������������� ������� ���� �������
int 10h
add si, 2
jmp loop3
next3:

; ����� ����� �����������
MOV CX, 0FH
MOV DX, 4240H
MOV AH, 86H
INT 15H
jmp exit

positions:
dw 143, 1
dw 144, 1
dw 145, 1
dw 146, 1
dw 147, 1
dw 148, 1
dw 149, 1
dw 150, 1
dw 151, 1
dw 152, 1
dw 153, 1
dw 154, 1
dw 155, 1
dw 156, 2
dw 157, 2
dw 158, 3
dw 159, 4
dw 159, 5
dw 159, 6
dw 159, 7
dw 159, 8
dw 158, 9
dw 157, 10
dw 156, 10
dw 155, 11
dw 154, 11
dw 153, 11
dw 152, 11
dw 151, 11
dw 150, 11
dw 149, 11
dw 148, 11
dw 147, 11
dw 146, 11
dw 145, 11
dw 144, 11
dw 143, 11
dw 142, 10
dw 141, 10
dw 140, 9
dw 139, 8
dw 139, 7
dw 139, 6
dw 139, 5
dw 139, 4
dw 140, 3
dw 141, 2
dw 142, 2
dw 0

exit:

db 510-($-$$) dup 0
dw 0AA55h
