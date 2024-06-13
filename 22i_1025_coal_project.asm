INCLUDE Irvine32.inc
INCLUDE Macros.inc
BUFFER_SIZE = 5000
INCLUDELIB winmm.lib

.data
gametitle BYTE "--------------------------------------------------PAC-MAN:)------------------------------------------------------------",0
ground BYTE "########################################################################################################################",0
ground1 BYTE "#",0ah,0
ground2 BYTE "|",0
ground3 BYTE "-",0




;buffer1 resb 1 ; Buffer to store the read character
;wall1
wall1x db 30 dup(0) 
wall1y db 30 dup (0) 
;wall2
wall2x db 30 dup(0) 
wall2y db 30 dup (0) 
;wall3
wall3x db 30 dup(0) 
wall3y db 30 dup (0) 
;wall4
wall4x db 30 dup(0) 
wall4y db 30 dup (0) 
;wall5
wall5x db 30 dup(0) 
wall5y db 30 dup (0) 
;wall6
wall6x db 30 dup(0) 
wall6y db 30 dup (0) 
;wall7
wall7x db 30 dup(0) 
wall7y db 30 dup (0) 
;wall8
wall8x db 30 dup(0) 
wall8y db 30 dup (0) 
;wall9
wall9x db 30 dup(0) 
wall9y db 30 dup (0) 
;wall10
wall10x db 30 dup(0) 
wall10y db 30 dup (0) 
;wall11
wall11x db 30 dup(0) 
wall11y db 30 dup (0) 
;wall12
wall12x db 30 dup(0) 
wall12y db 30 dup (0) 
;wall13
wall13x db 30 dup(0) 
wall13y db 30 dup (0) 
;/////////////////// file handling/////////
buffer BYTE BUFFER_SIZE DUP(?)
filename     BYTE "output.txt",0
fileHandle   HANDLE ?
stringLength DWORD ?
stringLength1 DWORD ?
stringLength2 DWORD ?
bytesWritten DWORD ?
str1 BYTE "Cannot create file",0dh,0ah,0
str2 BYTE "Bytes written to file [output.txt]:",0
str3 BYTE "Enter up to 500 characters and press"
     BYTE "[Enter]: ",0dh,0ah,0

strfilen byte " ",0
strfiles byte " ",0
strfilel byte " ",0
strfilenc byte " ",0
strfilesc byte " ",0
strfilelc byte " ",0
filestr1 byte " ",0
filelength dword 0,0
filestr2 byte " ",0
filecurrent byte " ",0
filestrcount dword 1,0
;///////////////

temp byte ?
up dword "w",0
un dword ?
down dword "s",0
un1 dword ?
right dword "d",0
un2 dword ?
left dword "a",0
un3 dword ?
pausescr byte "p",0
playertype byte "X",0
pacmancount dword 0
pacmanspeed dword 100

strScore BYTE "Your score is: ",0

;Title ->
    gamename BYTE  "  _____      __        ____              ___      ___        __        _      _  ", 0
    gamename1 BYTE " |  __ \    / /\      / ___|            |   \    /   |      / /\      |  \   | | ", 0
    gamename2 BYTE " | |__) |  / /\ \    | |        ____    | |\ \  / /| |     / /\ \     | | \  | | ", 0
    gamename3 BYTE " |  ___/  / /__\ \   | |       |____|   | | \ \/ / | |    / /__\ \    | |\ \ | | ", 0
    gamename4 BYTE " | |     / /____\ \  | |___             | |  \__/  | |   / /____\ \   | | \ \| | ", 0
    gamename5 BYTE " |_|    /_/      \_\  \____|            |_|        |_|  /_/      \_\  |_|  \___| ", 0
;<- Title

strNAME Byte "PECMAN"
endgamestr Byte " congratulations!! you won :)",0
endgamestr1 Byte "sorry:( better luck next time",0
score word 0
cscore BYTE 0
strPlayername byte "Player's name is:",0
strPlayernam byte "fahad jamil_22i-1025",0dh,0ah,0
wallflag byte 0
speed dword 500,0
level db 1
lives db 3,0
movementcheck db 0

xPos BYTE 22
yPos BYTE 22


;;///////////////labling 
ExPos BYTE 35
EyPos BYTE 12
flage1 byte 0
e1coin byte 0
epresent byte 1
;enemy2
E2xPos BYTE 24
E2yPos BYTE 12
flage2 byte 0
e2coin byte 0
e2present byte 1
;enemy3
E3xPos BYTE 93
E3yPos BYTE 4
flage3 byte 0
e3coin byte 0
e3present byte 1
;enemy4
E4xPos BYTE 62
E4yPos BYTE 12
flage4 byte 0
e4coin byte 0
e4present byte 1



numberOfCoins = 255t
numOfCoins byte numberOfCoins
xCoinPos BYTE ?
yCoinPos BYTE ?

xCoin BYTE numberOfCoins dup (0)
yCoin BYTE numberOfCoins dup (0)

numberofobsticles=5
xobs BYTE numberofobsticles dup (0)
yobs BYTE numberofobsticles dup (0)
obsticles byte "!",0
xobsPos BYTE ?
yobsPos BYTE ?

numberofFruits=3
xFruits BYTE numberofFruits dup (0)
yFruits BYTE numberofFruits dup (0)
fruits byte "F",0
xFruitsPos BYTE ?
yFruitsPos BYTE ?

numberofcherry=5
xcherry BYTE numberofcherry dup (0)
ycherry BYTE numberofcherry dup (0)
cherry byte "C",0
xcherryPos BYTE ?
ycherryPos BYTE ?

numberofpowerups=2
xpu BYTE numberofpowerups dup (0)
ypu BYTE numberofpowerups dup (0)
pu byte "U",0
xpuPos BYTE ?
ypuPos BYTE ?
putaken byte 0

inputChar BYTE ?
msec DWORD ?
DELAY_TIME equ 1000
counter dword 0
countere2 dword 0
countere3 dword 0
countere4 dword 0
timer dword 20000
count dword 0

;sound data type


beginSound BYTE ".\sounds\pacman_beginning.wav", 0
deathSound BYTE ".\sounds\pacman_death.wav", 0
midsound BYTE ".\sounds\TUNAK.wav", 0

snd_asy  equ 00000001h
snd_nowait  equ 00002000h

PlaySoundA PROTO,
pszSound:PTR BYTE, 
hmod:DWORD, 
fdwSound:DWORD


;///////////////////






.code
main PROC
    invoke PlaySoundA, ADDR beginSound, 0, snd_asy or snd_nowait
    
    ;mov eax, 5000 ; Adjust the duration in milliseconds
    ;call Sleep

    call StartGaMe
    
    call startmenu
    exit
gameLoop Proc 
        mov al,level
        cmp al,3
        jne noteleport
        call teleportation
        noteleport:
        call gameT
        call showlevel
        call showlives
        call scores
        call points
        call poweruptaken
        call fruitstaken
        call cherrytaken
        call highestscr
        ;cmp level,3
        ;jne nohid
        ;call hiddenpassage
        ;nohid:
        cmp putaken,1
        jne nopus
        inc count
        
        mov ebx,count
        cmp ebx,timer
        jl nopus

        cmp epresent,1
        je e1pr
        mov epresent,1
        mov ExPos ,35
        mov EyPos, 12
        e1pr:

        cmp e2present,1
        je e2pr
        mov e2present,1
        mov E2xPos,50
        mov E2yPos, 24

        e2pr:
        cmp e3present,1
        je e3pr

        mov e3present,1
        mov E3xPos , 93
        mov E3yPos , 4

        e3pr:
        cmp e4present,1
        je e4pr
        
        mov e4present,1
        mov E4xPos , 62
        mov E4yPos , 12
        e4pr:

        mov count,0
        mov putaken,0
        nopus:
        inc counter
        inc countere2
        inc countere3
        inc countere4
        cmp level,1
        jne high1
        mov eax,counter
        mov ebx, speed
        cmp eax,ebx
        jne lala1
        mov counter,0
        cmp epresent,1
        jne lala1
        call Updateenemy
        call drawenemy
        lala1:
        mov eax,countere2
        mov ebx, speed
        cmp eax,ebx
        jne lala
        mov countere2,40
        cmp level,1
        jne high1
        cmp e2present,1
        jne lala
        call Updateenemy2
        call drawenemy2
        
        jmp lala
        high1:
        mov eax,counter
        mov ebx, speed
        cmp eax,ebx
        jne lala5
        mov counter,0
        cmp epresent,1
        jne lala5
        call UpdateenemyAI
        call drawenemy
        lala5:
        mov eax,countere2
        mov ebx, speed
        cmp eax,ebx
        jne laaa
        mov countere2,40
        cmp e2present,1
        jne laaa
        call Updateenemy2AI
        call drawenemy2
        laaa:
        cmp level,3
        jne lala
        mov eax,countere3
        mov ebx, speed
        cmp eax,ebx
        jne haha9
        mov countere3,80
        cmp e3present,1
        jne haha9
        call Updateenemy3AI
        call drawenemy3
        haha9:
        mov eax,countere4
        mov ebx, speed
        cmp eax,ebx
        jne lala
        mov countere4,120
        cmp e4present,1
        jne lala
        call Updateenemy4AI
        call drawenemy4
        lala:
        ;/////checking lives/////
        mov al,xpos
        mov ah,ypos
        mov bl,ExPos
        mov bh,EyPos
        cmp al,bl
        jne nochange
        cmp ah,bh
        jne nochange
        cmp putaken,1
        jne lah
        add score,5
        mov epresent,0
        mov ExPos,0
        mov EyPos,0
        jmp nochange
        lah:
        dec lives
        mov xPos, 22
        mov yPos, 22
        call DrawPlayer
        mov movementcheck,0
        cmp lives,0
        jne nochange
        mov esi, OFFSET endgamestr
        mov edi, OFFSET endgamestr1
        mov ecx,29
        la:
        mov al,[edi]
        mov [esi],al
        inc esi
        inc edi
        loop la
        call gamefinished
        nochange:

        mov bl,E2xPos
        mov bh,E2yPos
        cmp al,bl
        jne nochange1
        cmp ah,bh
        jne nochange1
        cmp putaken,1
        jne lah1
        mov E2xPos,0
        mov E2yPos,0
        mov e2present,0
        add score,5
        jmp nochange1
        lah1:
        mov xPos, 22
        mov yPos, 22
        call DrawPlayer
        dec lives
        mov movementcheck,0
        cmp lives,0
        jne nochange1
        mov esi, OFFSET endgamestr
        mov edi, OFFSET endgamestr1
        mov ecx,29
        la1:
        mov al,[edi]
        mov [esi],al
        inc esi
        inc edi
        loop la1
        call gamefinished
        nochange1:

        cmp level,3
        jne nochange3
        mov bl,E3xPos
        mov bh,E3yPos
        cmp al,bl
        jne nochange2
        cmp ah,bh
        jne nochange2
        cmp putaken,1
        jne lah3
        mov E3xPos,0
        mov E3yPos,0
        mov e3present,0
        add score,5
        jmp nochange2
        lah3:
        mov xPos, 22
        mov yPos, 22
        call DrawPlayer
        dec lives
        mov movementcheck,0
        cmp lives,0
        jne nochange2
        mov esi, OFFSET endgamestr
        mov edi, OFFSET endgamestr1
        mov ecx,29
        la2:
        mov al,[edi]
        mov [esi],al
        inc esi
        inc edi
        loop la2
        call gamefinished
        nochange2:

        mov bl,E4xPos
        mov bh,E4yPos
        cmp al,bl
        jne nochange3
        cmp ah,bh
        jne nochange3
        
        cmp putaken,1
        jne lah4
        mov E4xPos,0
        mov E4yPos,0
        mov e4present,0
        add score,5
        jmp nochange3
        lah4:
        mov xPos, 22
        mov yPos, 22
        call DrawPlayer
        dec lives
        mov movementcheck,0
        cmp lives,0
        jne nochange3
        mov esi, OFFSET endgamestr
        mov edi, OFFSET endgamestr1
        mov ecx,29
        la3:
        mov al,[edi]
        mov [esi],al
        inc esi
        inc edi
        loop la3
        call gamefinished
        nochange3:

        ;//////////////////

        mov al,level
        cmp al,1
        jne notlevel1
        mov al,cscore
        mov bl, numOfCoins
        cmp al,bl
        jl notnextlevel 
        call level2
        jmp notnextlevel

        ;//
        notlevel1:
        mov al,numberoffruits
        mov bl,10
        mul bl
        mov dl, numOfCoins
        add al,dl
        mov dl,cscore
        cmp al,dl
        jne notnextlevel 
        cmp level,1
        je level2
        cmp level,2
        je level3
        call gamefinished

        notnextlevel:

        mov eax,white (black * 16)
        call SetTextColor
        ;call gravity

        ; get user key input:
        inc pacmancount
        mov  eax,1
        call Readkey
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        jne blah
        mov esi, OFFSET endgamestr
        mov edi, OFFSET endgamestr1
        mov ecx,29
        lal:
        mov al,[edi]
        mov [esi],al
        inc esi
        inc edi
        loop lal

        call gamefinished
        
        blah:
        
        mov esi,offset up
        mov al,[esi]
        cmp inputChar,al
        je moveUp
        mov esi,offset down
        mov al,[esi]
        cmp inputChar,al
        je moveDown

        mov esi,offset left
        mov al,[esi]
        cmp inputChar,al
        je moveLeft

        mov esi,offset right
        mov al,[esi]
        cmp inputChar,al
        je moveRight

        mov esi,offset pausescr
        mov al,[esi]
        cmp inputChar,al
        je pausescreen

        
        mov eax,pacmancount
        cmp eax,pacmanspeed
        jl laa3
        mov pacmancount,0
        nomove1:
        cmp movementcheck,1
        jne laa
        jmp moveUp
        laa:
        cmp movementcheck,2
        jne laa1
        jmp movedown
        laa1:
        cmp movementcheck,3
        jne laa2
        jmp moveLeft
        laa2:
        cmp movementcheck,4
        jne laa3
        jmp moveright
        laa3:
        jmp nomove
        moveUp:
        mov movementcheck,1
        mov dl,xpos
        mov dh,ypos
        dec dh
        call wallcheck
        cmp wallflag,1
        je nomove
        ; allow player to jump:
        ;mov ecx,1
        jumpLoop:
            call UpdatePlayer
            mov bl,ypos
            cmp bl,3
            jl noymoveu
            dec yPos
            noymoveu:
            
            call DrawPlayer
           ; mov eax,100
           ; call Delay
      ;  loop jumpLoop
        jmp gameLoop


        moveDown:
        mov movementcheck,2
        mov dl,xpos
        mov dh,ypos
        inc dh
        call wallcheck
        cmp wallflag,1
        je nomove

        call UpdatePlayer
        mov bl,ypos
        cmp bl,27
        jg noymove
        inc yPos
        noymove:
        call DrawPlayer
        jmp gameLoop

        moveLeft:
        mov movementcheck,3
         mov dl,xpos
        mov dh,ypos
        dec dl
        call wallcheck
        cmp wallflag,1
        je nomove

        call UpdatePlayer
        mov bl,xpos
        cmp bl,22
        jl noxmove
        dec xPos
        noxmove:
        
        call DrawPlayer
        jmp gameLoop

        moveRight:
        mov movementcheck,4
        mov dl,xpos
        mov dh,ypos
        inc dl
        call wallcheck
        cmp wallflag,1
        je nomove

        call UpdatePlayer
        mov bl,xpos
        cmp bl,98
        jg noxmover
        inc xPos
        noxmover:
        
        call DrawPlayer
        jmp gameLoop
        
        nomove:


        mov wallflag,0
    jmp gameLoop

    exitGame:
    exit
    gameloop endp
    ;exitGame:
    ;exit
    
main ENDP
;;//////////////////////   playsoundA   //////////////////////////////////;;
; PlaySoundA function definition

;;//////////////////////   gravity logic   //////////////////////////////////;;

  gravity proc 

        cmp yPos,27
        jg onGround
        cmp xPos,0
        jg fahad
        mov xPos,0
        fahad:
       ; make player fall:
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        mov eax,80
        call Delay
        jmp gravity

        onGround:
   ret
   gravity endp

;;//////////////////////   getting points   //////////////////////////////////;;
points proc uses esi eax ebx ecx edx edi
push esi
push edi
push ecx

mov ecx,numberofcoins
mov esi, offset xCoin
mov edi, offset yCoin

l1:
        mov bl,xPos
        cmp bl,[esi]
        jne notCollecting
        mov bl,yPos
        cmp bl,[edi]
        jne notCollecting
        ; player is intersecting coin:
        mov al,0
        mov [esi],al
        mov [edi],al
        inc score
        inc cscore
        notCollecting:
        inc esi
        inc edi
loop l1
        

pop ecx
pop edi
pop esi
    ret
    points ENDP

;;//////////////////////   getting cherry   //////////////////////////////////;;
cherrytaken proc uses esi eax ebx ecx edx edi
push esi
push edi
push ecx

mov ecx,numberofcherry
mov esi, offset xcherry
mov edi, offset ycherry

l1:
        mov bl,xPos
        cmp bl,[esi]
        jne notCollecting
        mov bl,yPos
        cmp bl,[edi]
        jne notCollecting
        ; player is intersecting coin:
        inc lives
        mov al,0
        mov [esi],al
        mov [edi],al
        notCollecting:
        inc esi
        inc edi
loop l1
        

pop ecx
pop edi
pop esi
    ret
cherrytaken ENDP
;;//////////////////////   getting fruits   //////////////////////////////////;;
fruitstaken proc uses esi eax ebx ecx edx edi
push esi
push edi
push ecx

mov ecx,numberoffruits
mov esi, offset xfruits
mov edi, offset yfruits

l1:
        mov bl,xPos
        cmp bl,[esi]
        jne notCollecting
        mov bl,yPos
        cmp bl,[edi]
        jne notCollecting
        ; player is intersecting coin:
        add score,10
        add cscore,10
        mov al,0
        mov [esi],al
        mov [edi],al

        notCollecting:
        inc esi
        inc edi
loop l1
        

pop ecx
pop edi
pop esi
    ret
fruitstaken ENDP

;;//////////////////////   getting powerups   //////////////////////////////////;;
poweruptaken proc uses esi eax ebx ecx edx edi
push esi
push edi
push ecx

mov ecx,numberofpowerups
mov esi, offset xpu
mov edi, offset ypu

l1:
        mov bl,xPos
        cmp bl,[esi]
        jne notCollecting
        mov bl,yPos
        cmp bl,[edi]
        jne notCollecting
        ; player is intersecting coin:
        mov count,0
        mov al,0
        mov [esi],al
        mov [edi],al
        mov putaken,1
        notCollecting:
        inc esi
        inc edi
loop l1
        

pop ecx
pop edi
pop esi
    ret
poweruptaken ENDP


;;//////////////////////   Move enemy  //////////////////////////////////;;

Updateenemy PROC uses esi eax ebx ecx edx edi
;comment &
    ;comment^
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,ExPos
    mov dh,EyPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e1coin, 1
    after:
    inc esi
    inc edi
    loop coinloop
    
    pop ecx
    pop edi
    pop esi


    mov wallflag,0
    mov dl,ExPos
    mov dh,EyPos
    call Gotoxy
    cmp flage1,0
    je hha
    dec dl
    jmp hha2
    hha:
    inc dl
    hha2:
    call wallcheck
    cmp wallflag,0
    je haha7
    cmp flage1,0
    je hha3
    mov flage1,0
    jmp haha8
    hha3:
    mov flage1,1
    haha8:
    mov eax,black +(black*16)
    
    call SetTextColor
    mov al," "
    mov wallflag,0
    ;call WriteChar
    jmp haha2
  
    haha7:
   ; &
    mov dl,ExPos
    mov dh,EyPos
    call Gotoxy

    mov eax,black +(black*16)
    call SetTextColor
    mov al," "

    ;mov eax,speed
    ;call delay

    mov bl,exPos
    cmp bl,100
    jg haha

    cmp bl,22
    jl haha5
    jmp haha2
    haha5:
    mov flage1,0
    jmp haha2
   
    haha:
    
    mov flage1,1
    haha2:
    
    cmp flage1,0
    je haha3
    dec exPos
    jmp haha4
    haha3:
    inc exPos
    haha4:


    cmp e1coin,0
    je nopresentcoin

    mov eax,black +(black*16)
    call SetTextColor
    mov al,yellow 
    call SetTextColor
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e1coin,0
    
    call WriteChar
    ret
Updateenemy ENDP

;;//////////////////////   Move enemyAI  //////////////////////////////////;;

UpdateenemyAI PROC uses esi eax ebx ecx edx edi
;comment &
    ;comment^
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,ExPos
    mov dh,EyPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e1coin, 1
    ;jmp change
    after:
    inc esi
    inc edi
    loop coinloop
    
    mov esi,offset xpu
    mov edi,offset ypu
    mov ecx,numberofpowerups
    puloop:
    mov dl,ExPos
    mov dh,EyPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after2
    cmp dh,bh
    jne after2
    mov e1coin, 2
    ;jmp change
    after2:
    inc esi
    inc edi
    loop puloop

    mov esi,offset xfruits
    mov edi,offset yfruits
    mov ecx,numberoffruits
    fruitloop:
    mov dl,ExPos
    mov dh,EyPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after3
    cmp dh,bh
    jne after3
    mov e1coin, 3
    ;jmp change
    after3:
    inc esi
    inc edi
    loop fruitloop
    
    mov esi,offset xcherry
    mov edi,offset ycherry
    mov ecx,numberoffruits
    cherryloop:
    mov dl,ExPos
    mov dh,EyPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after4
    cmp dh,bh
    jne after4
    mov e1coin, 4
    ;jmp change
    after4:
    inc esi
    inc edi
    loop cherryloop
    
    pop ecx
    pop edi
    pop esi

    ;change:
    mov wallflag,0
    mov dl,ExPos
    mov dh,EyPos
    call Gotoxy
    mov bl,xpos
    mov bh,ypos
    cmp bl,dl
    je yla

    cmp bl,dl
    jng lala1
    inc dl
    call wallcheck
    cmp wallflag,1
    je lala2
    inc expos
    jmp next

    lala2:
    mov wallflag,0
    dec dl
    mov bh,ypos
    cmp bh,dh
    jg lal
    dec dh
    jmp lal1
    lal:
    inc dh
    lal1:

    call wallcheck
    cmp wallflag,1
    je lala6
    mov eypos,dh
    lala6:
    mov wallflag,0
    ;////xless
    jmp next
    
    lala1:

    ;comment &
    dec dl
    call wallcheck
    cmp wallflag,1
    je lala4
    dec expos
    jmp next

    lala4:
    mov wallflag,0
    inc dl
    mov bh,ypos
    cmp bh,dh
    jg lal3
    dec dh
    jmp lal2
    lal3:
    inc dh
    lal2:
    call wallcheck
    cmp wallflag,1
    je lala7
    mov eypos,dh
    lala7:
    mov wallflag,0
    jmp next
   ; &
   yla:
   mov wallflag,0
   cmp bh,dh
   jg yla1
   dec dh
   call wallcheck
   cmp wallflag,1
   je ylala2
   mov eypos,dh
   ylala2:
   mov wallflag,0
   jmp next

   yla1:
   inc dh
   call wallcheck
   cmp wallflag,1
   je next
   mov eypos,dh

    next:
    
    mov eax,black +(black*16)
    call SetTextColor
    cmp e1coin,0
    je nopresentcoin

    mov al,yellow 
    call SetTextColor
    cmp e1coin,1
    je l4
    cmp e1coin,2
    je l5
    cmp e1coin,3
    je l6
    mov esi, offset cherry
    mov al,[esi]
    jmp l3
    l6:
    mov esi, offset fruits
    mov al,[esi]
    jmp l3
    l5:
    mov esi, offset pu
    mov al,[esi]
    jmp l3
    l4:
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e1coin,0
    
    call WriteChar
    ret
UpdateenemyAI ENDP

;;//////////////////////   Move enemy2AI  //////////////////////////////////;;

Updateenemy2AI PROC uses esi eax ebx ecx edx edi
;comment &
    ;comment^
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,E2xPos
    mov dh,E2yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e2coin, 1
    after:
    inc esi
    inc edi
    loop coinloop

    mov esi,offset xpu
    mov edi,offset ypu
    mov ecx,numberofpowerups
    puloop:
    mov dl,E2xPos
    mov dh,E2yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after2
    cmp dh,bh
    jne after2
    mov e2coin, 2
    ;jmp change
    after2:
    inc esi
    inc edi
    loop puloop

    mov esi,offset xfruits
    mov edi,offset yfruits
    mov ecx,numberoffruits
    fruitloop:
    mov dl,E2xPos
    mov dh,E2yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after3
    cmp dh,bh
    jne after3
    mov e2coin, 3
    ;jmp change
    after3:
    inc esi
    inc edi
    loop fruitloop
    
    mov esi,offset xcherry
    mov edi,offset ycherry
    mov ecx,numberoffruits
    cherryloop:
    mov dl,E2xPos
    mov dh,E2yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after4
    cmp dh,bh
    jne after4
    mov e2coin, 4
    ;jmp change
    after4:
    inc esi
    inc edi
    loop cherryloop

    
    pop ecx
    pop edi
    pop esi


    mov wallflag,0
    mov dl,E2xPos
    mov dh,E2yPos
    call Gotoxy
    mov bl,xpos
    mov bh,ypos
    cmp bl,dl
    je yla

    cmp bl,dl
    jng lala1
    inc dl
    call wallcheck
    cmp wallflag,1
    je lala2
    inc e2xpos
    jmp next

    lala2:
    mov wallflag,0
    dec dl
    mov bh,ypos
    cmp bh,dh
    jg lal
    dec dh
    jmp lal1
    lal:
    inc dh
    lal1:

    call wallcheck
    cmp wallflag,1
    je lala6
    mov e2ypos,dh
    lala6:
    mov wallflag,0
    ;////xless
    jmp next
    
    lala1:

    ;comment &
    dec dl
    call wallcheck
    cmp wallflag,1
    je lala4
    dec e2xpos
    jmp next

    lala4:
    mov wallflag,0
    inc dl
    mov bh,ypos
    cmp bh,dh
    jg lal3
    dec dh
    jmp lal2
    lal3:
    inc dh
    lal2:
    call wallcheck
    cmp wallflag,1
    je lala7
    mov e2ypos,dh
    lala7:
    mov wallflag,0
    jmp next
   ; &
   yla:
   mov wallflag,0
   cmp bh,dh
   jg yla1
   dec dh
   call wallcheck
   cmp wallflag,1
   je ylala2
   mov e2ypos,dh
   ylala2:
   mov wallflag,0
   jmp next

   yla1:
   inc dh
   call wallcheck
   cmp wallflag,1
   je next
   mov e2ypos,dh

    next:
    
    ;mov eax,speed
    ;call delay


    mov eax,black +(black*16)
    call SetTextColor
    cmp e2coin,0
    je nopresentcoin

    mov al,yellow 
    call SetTextColor
    cmp e2coin,1
    je l4
    cmp e2coin,2
    je l5
    cmp e2coin,3
    je l6
    mov esi, offset cherry
    mov al,[esi]
    jmp l3
    l6:
    mov esi, offset fruits
    mov al,[esi]
    jmp l3
    l5:
    mov esi, offset pu
    mov al,[esi]
    jmp l3
    l4:
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e2coin,0
    
    call WriteChar
    ret
Updateenemy2AI ENDP

;;//////////////////////   Move enemy3AI  //////////////////////////////////;;

Updateenemy3AI PROC uses esi eax ebx ecx edx edi
;comment &
    ;comment^
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,E3xPos
    mov dh,E3yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e3coin, 1
    after:
    inc esi
    inc edi
    loop coinloop

    mov esi,offset xpu
    mov edi,offset ypu
    mov ecx,numberofpowerups
    puloop:
    mov dl,E3xPos
    mov dh,E3yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after2
    cmp dh,bh
    jne after2
    mov e3coin, 2
    ;jmp change
    after2:
    inc esi
    inc edi
    loop puloop

    mov esi,offset xfruits
    mov edi,offset yfruits
    mov ecx,numberoffruits
    fruitloop:
    mov dl,E3xPos
    mov dh,E3yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after3
    cmp dh,bh
    jne after3
    mov e3coin, 3
    ;jmp change
    after3:
    inc esi
    inc edi
    loop fruitloop
    
    mov esi,offset xcherry
    mov edi,offset ycherry
    mov ecx,numberoffruits
    cherryloop:
    mov dl,E3xPos
    mov dh,E3yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after4
    cmp dh,bh
    jne after4
    mov e3coin, 4
    ;jmp change
    after4:
    inc esi
    inc edi
    loop cherryloop
    
    pop ecx
    pop edi
    pop esi


    mov wallflag,0
    mov dl,E3xPos
    mov dh,E3yPos
    call Gotoxy
    mov bl,xpos
    mov bh,ypos
    cmp bl,dl
    je yla

    cmp bl,dl
    jng lala1
    inc dl
    call wallcheck
    cmp wallflag,1
    je lala2
    inc e3xpos
    jmp next

    lala2:
    mov wallflag,0
    dec dl
    mov bh,ypos
    cmp bh,dh
    jg lal
    dec dh
    jmp lal1
    lal:
    inc dh
    lal1:

    call wallcheck
    cmp wallflag,1
    je lala6
    mov e3ypos,dh
    lala6:
    mov wallflag,0
    ;////xless
    jmp next
    
    lala1:

    ;comment &
    dec dl
    call wallcheck
    cmp wallflag,1
    je lala4
    dec e3xpos
    jmp next

    lala4:
    mov wallflag,0
    inc dl
    mov bh,ypos
    cmp bh,dh
    jg lal3
    dec dh
    jmp lal2
    lal3:
    inc dh
    lal2:
    call wallcheck
    cmp wallflag,1
    je lala7
    mov e3ypos,dh
    lala7:
    mov wallflag,0
    jmp next
   ; &
   yla:
   mov wallflag,0
   cmp bh,dh
   jg yla1
   dec dh
   call wallcheck
   cmp wallflag,1
   je ylala2
   mov e3ypos,dh
   ylala2:
   mov wallflag,0
   jmp next

   yla1:
   inc dh
   call wallcheck
   cmp wallflag,1
   je next
   mov e3ypos,dh

    next:


    mov eax,black +(black*16)
    call SetTextColor
    cmp e3coin,0
    je nopresentcoin

    mov al,yellow 
    call SetTextColor
    cmp e3coin,1
    je l4
    cmp e3coin,2
    je l5
    cmp e3coin,3
    je l6
    mov esi, offset cherry
    mov al,[esi]
    jmp l3
    l6:
    mov esi, offset fruits
    mov al,[esi]
    jmp l3
    l5:
    mov esi, offset pu
    mov al,[esi]
    jmp l3
    l4:
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e3coin,0
    
    call WriteChar
    ret
Updateenemy3AI ENDP


;;//////////////////////   Move enemy4AI  //////////////////////////////////;;

Updateenemy4AI PROC uses esi eax ebx ecx edx edi
;comment &
    ;comment^
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,E4xPos
    mov dh,E4yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e4coin, 1
    after:
    inc esi
    inc edi
    loop coinloop

    mov esi,offset xpu
    mov edi,offset ypu
    mov ecx,numberofpowerups
    puloop:
    mov dl,E4xPos
    mov dh,E4yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after2
    cmp dh,bh
    jne after2
    mov e4coin, 2
    ;jmp change
    after2:
    inc esi
    inc edi
    loop puloop

    mov esi,offset xfruits
    mov edi,offset yfruits
    mov ecx,numberoffruits
    fruitloop:
    mov dl,E4xPos
    mov dh,E4yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after3
    cmp dh,bh
    jne after3
    mov e4coin, 3
    ;jmp change
    after3:
    inc esi
    inc edi
    loop fruitloop
    
    mov esi,offset xcherry
    mov edi,offset ycherry
    mov ecx,numberoffruits
    cherryloop:
    mov dl,E4xPos
    mov dh,E4yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after4
    cmp dh,bh
    jne after4
    mov e4coin, 4
    ;jmp change
    after4:
    inc esi
    inc edi
    loop cherryloop
    
    pop ecx
    pop edi
    pop esi


    mov wallflag,0
    mov dl,E4xPos
    mov dh,E4yPos
    call Gotoxy
    mov bl,xpos
    mov bh,ypos
    cmp bl,dl
    je yla

    cmp bl,dl
    jng lala1
    inc dl
    call wallcheck
    cmp wallflag,1
    je lala2
    inc e4xpos
    jmp next

    lala2:
    mov wallflag,0
    dec dl
    mov bh,ypos
    cmp bh,dh
    jg lal
    dec dh
    jmp lal1
    lal:
    inc dh
    lal1:

    call wallcheck
    cmp wallflag,1
    je lala6
    mov e4ypos,dh
    lala6:
    mov wallflag,0
    ;////xless
    jmp next
    
    lala1:

    ;comment &
    dec dl
    call wallcheck
    cmp wallflag,1
    je lala4
    dec e4xpos
    jmp next

    lala4:
    mov wallflag,0
    inc dl
    mov bh,ypos
    cmp bh,dh
    jg lal3
    dec dh
    jmp lal2
    lal3:
    inc dh
    lal2:
    call wallcheck
    cmp wallflag,1
    je lala7
    mov e4ypos,dh
    lala7:
    mov wallflag,0
    jmp next
   ; &
   yla:
   mov wallflag,0
   cmp bh,dh
   jg yla1
   dec dh
   call wallcheck
   cmp wallflag,1
   je ylala2
   mov e4ypos,dh
   ylala2:
   mov wallflag,0
   jmp next

   yla1:
   inc dh
   call wallcheck
   cmp wallflag,1
   je next
   mov e4ypos,dh

    next:


    mov eax,black +(black*16)
    call SetTextColor
    cmp e4coin,0
    je nopresentcoin

    mov al,yellow 
    call SetTextColor
    cmp e4coin,1
    je l4
    cmp e4coin,2
    je l5
    cmp e4coin,3
    je l6
    mov esi, offset cherry
    mov al,[esi]
    jmp l3
    l6:
    mov esi, offset fruits
    mov al,[esi]
    jmp l3
    l5:
    mov esi, offset pu
    mov al,[esi]
    jmp l3
    l4:
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e4coin,0
    
    call WriteChar
    ret
Updateenemy4AI ENDP

;;//////////////////////   Draw enemy  //////////////////////////////////;;

DrawEnemy PROC uses esi eax ebx ecx edx edi
    ; draw player at (xPos,yPos):
    mov eax,blue +(blue*16)
    call SetTextColor
    mov dl,ExPos
    mov dh,EyPos
    call Gotoxy
    mov al,"|"
    call WriteChar
    ret
DrawEnemy ENDP

;;//////////////////////   Move enemy2  //////////////////////////////////;;

Updateenemy2 PROC uses esi eax ebx ecx edx edi
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,E2xPos
    mov dh,E2yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e2coin, 1
    after:
    inc esi
    inc edi
    loop coinloop
    
    pop ecx
    pop edi
    pop esi


    mov wallflag,0
    mov dl,E2xPos
    mov dh,E2yPos
    call Gotoxy
    cmp flage2,0
    je hha
    dec dh
    jmp hha2
    hha:
    inc dh
    hha2:
    call wallcheck
    cmp wallflag,0
    je haha7
    cmp flage2,0
    je hha3
    mov flage2,0
    jmp haha8
    hha3:
    mov flage2,1
    haha8:
    mov eax,black +(black*16)
    
    call SetTextColor
    mov al," "
    mov wallflag,0
    ;call WriteChar
    jmp haha2
  
    haha7:
    

    mov dl,E2xPos
    mov dh,E2yPos
    call Gotoxy

    mov eax,black +(black*16)
    call SetTextColor
    mov al," "

    ;mov eax,speed
    ;call delay

    mov bl,E2yPos
    cmp bl,27
    jg haha

    cmp bl,3
    jl haha5
    jmp haha2
    haha5:
    mov flage2,0
    jmp haha2
    haha6:

    jmp haha2

    haha:
    cmp flage2,0
    jnz haha2
    mov flage2,1
    haha2:
    
    cmp flage2,0
    je haha3
    dec E2yPos
    jmp haha4
    haha3:
    inc E2yPos
    haha4:

    cmp e2coin,0
    je nopresentcoin

    mov eax,black +(black*16)
    call SetTextColor
    mov al,yellow 
    call SetTextColor
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e2coin,0
    
    call WriteChar
    
   
    ret
Updateenemy2 ENDP

;;//////////////////////   Draw enemy2  //////////////////////////////////;;

DrawEnemy2 PROC uses esi eax ebx ecx edx edi
    ; draw player at (xPos,yPos):
    mov eax,red (red*16)
    call SetTextColor
    mov dl,E2xPos
    mov dh,E2yPos
    call Gotoxy
    mov al,"|"
    call WriteChar
    ret
DrawEnemy2 ENDP


;;//////////////////////   Move enemy3  //////////////////////////////////;;

Updateenemy3 PROC uses esi eax ebx ecx edx edi
    push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,E3xPos
    mov dh,E3yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e3coin, 1
    after:
    inc esi
    inc edi
    loop coinloop
    
    pop ecx
    pop edi
    pop esi
    

    mov wallflag,0
    mov dl,E3xPos
    mov dh,E3yPos
    call Gotoxy
    cmp flage3,0
    je hha
    dec dh
    jmp hha2
    hha:
    inc dh
    hha2:
    call wallcheck
    cmp wallflag,0
    je haha7
    cmp flage3,0
    je hha3
    mov flage3,0
    jmp haha8
    hha3:
    mov flage3,1
    haha8:
    mov eax,black +(black*16)
    
    call SetTextColor
    mov al," "
    mov wallflag,0
    ;call WriteChar
    jmp haha2
  
    haha7:
    

    mov dl,E3xPos
    mov dh,E3yPos
    call Gotoxy

    mov eax,black +(black*16)
    call SetTextColor
    mov al," "

   ; mov eax,speed
    ;call delay

    mov bl,E3yPos
    cmp bl,27
    jg haha

    cmp bl,3
    jl haha5
    jmp haha2
    haha5:
    mov flage3,0
    jmp haha2
    haha6:

    jmp haha2

    haha:
    cmp flage3,0
    jnz haha2
    mov flage3,1
    haha2:
    
    cmp flage3,0
    je haha3
    dec E3yPos
    jmp haha4
    haha3:
    inc E3yPos
    haha4:

   cmp e3coin,0
    je nopresentcoin

    mov eax,black +(black*16)
    call SetTextColor
    mov al,yellow 
    call SetTextColor
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e3coin,0
    
    call WriteChar
    
   
    ret
Updateenemy3 ENDP

;;//////////////////////   Draw enemy3  //////////////////////////////////;;

DrawEnemy3 PROC uses esi eax ebx ecx edx edi
    ; draw player at (xPos,yPos):
    mov eax,yellow (yellow*16)
    call SetTextColor
    mov dl,E3xPos
    mov dh,E3yPos
    call Gotoxy
    mov al,"|"
    call WriteChar
    ret
DrawEnemy3 ENDP

;;//////////////////////   Move enemy4  //////////////////////////////////;;

Updateenemy4 PROC uses esi eax ebx ecx edx edi

   push esi
    push edi
    push ecx
    mov esi,offset xCoin
    mov edi,offset yCoin
    mov ecx,numberofcoins
    coinloop:
    mov dl,E4xPos
    mov dh,E4yPos
    mov bl,[esi]
    mov bh,[edi]
    cmp dl,bl
    jne after
    cmp dh,bh
    jne after
    mov e4coin, 1
    after:
    inc esi
    inc edi
    loop coinloop
    
    pop ecx
    pop edi
    pop esi
    

    mov wallflag,0
    mov dl,E4xPos
    mov dh,E4yPos
    call Gotoxy
    cmp flage4,0
    je hha
    dec dh
    jmp hha2
    hha:
    inc dh
    hha2:
    call wallcheck
    cmp wallflag,0
    je haha7
    cmp flage4,0
    je hha3
    mov flage4,0
    jmp haha8
    hha3:
    mov flage4,1
    haha8:
    mov eax,black +(black*16)
    
    call SetTextColor
    mov al," "
    mov wallflag,0
    ;call WriteChar
    jmp haha2
  
    haha7:
    

    mov dl,E4xPos
    mov dh,E4yPos
    call Gotoxy

    mov eax,black +(black*16)
    call SetTextColor
    mov al," "

    ;mov eax,speed
    ;call delay

    mov bl,E4yPos
    cmp bl,27
    jg haha

    cmp bl,3
    jl haha5
    jmp haha2
    haha5:
    mov flage4,0
    jmp haha2
    haha6:

    jmp haha2

    haha:
    cmp flage4,0
    jnz haha2
    mov flage4,1
    haha2:
    
    cmp flage4,0
    je haha3
    dec E4yPos
    jmp haha4
    haha3:
    inc E4yPos
    haha4:

   cmp e4coin,0
    je nopresentcoin

    mov eax,black +(black*16)
    call SetTextColor
    mov al,yellow 
    call SetTextColor
    mov al,"*"
    jmp l3
    nopresentcoin:
    mov al, " "
    l3:
    mov e4coin,0
    
    call WriteChar 
   
    ret
Updateenemy4 ENDP

;;//////////////////////   Draw enemy4  //////////////////////////////////;;

DrawEnemy4 PROC uses esi eax ebx ecx edx edi
    ; draw player at (xPos,yPos):
    mov eax,yellow (green*16)
    call SetTextColor
    mov dl,E4xPos
    mov dh,E4yPos
    call Gotoxy
    mov al,"|"
    call WriteChar
    ret
DrawEnemy4 ENDP

;;//////////////////////   Draw Player  //////////////////////////////////;;

DrawPlayer PROC uses esi eax ebx ecx edx edi
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov esi,offset playertype
    mov al,[esi]
    call WriteChar
    
    ret
DrawPlayer ENDP

;;//////////////////////   Draw cherry  //////////////////////////////////;;

Drawcherry PROC uses esi eax ebx ecx edx edi
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xcherryPos
    mov dh,ycherryPos
    call Gotoxy
    mov esi, offset cherry
    mov al,[esi]
    call WriteChar
    ret
Drawcherry ENDP

;;//////////////////////   Draw fruits  //////////////////////////////////;;

Drawfruits PROC uses esi eax ebx ecx edx edi
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xFruitsPos
    mov dh,yFruitsPos
    call Gotoxy
    mov esi, offset fruits
    mov al,[esi]
    call WriteChar
    ret
Drawfruits ENDP



;;//////////////////////   Update Player  //////////////////////////////////;;

UpdatePlayer PROC uses esi eax ebx ecx edx edi
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP
;;//////////////////////   Draw obsticles  //////////////////////////////////;;

Drawobsticles PROC uses esi eax ebx ecx edx edi
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xobsPos
    mov dh,yobsPos
    call Gotoxy
    mov esi,offset obsticles
    mov al,[esi]
    call WriteChar
    ret
Drawobsticles ENDP

;;//////////////////////   Draw powerups  //////////////////////////////////;;

Drawpowerups PROC uses esi eax ebx ecx edx edi
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xpuPos
    mov dh,ypuPos
    call Gotoxy
    mov esi,offset pu
    mov al,[esi]
    call WriteChar
    ret
Drawpowerups ENDP

;;//////////////////////   Create Random powerup  //////////////////////////////////;;
CreateRandompowerup PROC uses esi eax ebx ecx edx edi

push ecx
push esi
push edi
start:
    mov wallflag,0
    mov eax,77
    inc eax
    call RandomRange
    add al,22
    mov xpuPos,al
    mov eax,25
    call RandomRange
    add al,2

    mov ypuPos,al
    mov dl,xpuPos
    mov dh,ypuPos
    call wallcheck
    cmp wallflag,0
    jne start

    
    mov ecx,numberOfpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l1:
    mov dh,ypuPos
    mov dl,xpuPos
    cmp dl,[esi]
    jne end1
    cmp dh,[edi]
    je start
    end1:
    inc esi
    inc edi
    loop l1

    mov ecx,numberOffruits
    mov esi,offset xfruits
    mov edi,offset yfruits
    
    l2:
    mov dh,ypuPos
    mov dl,xpuPos
    cmp dl,[esi]
    jne end2
    cmp dh,[edi]
    je start
    end2:
    inc esi
    inc edi
    loop l2
    
    

    mov ecx,numberOfobsticles
    mov esi,offset xobs
    mov edi,offset yobs
    l3:
    mov dh,ypuPos
    mov dl,xpuPos
    cmp dl,[esi]
    jne end3
    cmp dh,[edi]
    je start
    end3:
    inc esi
    inc edi
    loop l3

    mov ecx,numberOfcherry
    mov esi,offset xcherry
    mov edi,offset ycherry
    l4:
    mov dh,ypuPos
    mov dl,xpuPos
    cmp dl,[esi]
    jne end4
    cmp dh,[edi]
    je start
    end4:
    inc esi
    inc edi
    loop l4

    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l5:
    mov dh,ypuPos
    mov dl,xpuPos
    cmp dl,[esi]
    jne end5
    cmp dh,[edi]
    je start
    end5:
    inc esi
    inc edi
    loop l5



    pop edi
    pop esi
    pop ecx
    ret
    CreateRandompowerup ENDP

;;//////////////////////   Create Random fruits  //////////////////////////////////;;
CreateRandomfruits PROC uses esi eax ebx ecx edx edi

push ecx
push esi
push edi
start:
    mov wallflag,0
    mov eax,77
    inc eax
    call RandomRange
    add al,22
    mov xfruitsPos,al
    mov eax,25
    call RandomRange
    add al,2
    mov yfruitsPos,al
    mov dl,xfruitsPos
    mov dh,yfruitsPos
    call wallcheck
    cmp wallflag,0
    jne start

    
    mov ecx,numberOfpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l1:
    mov dh,yfruitsPos
    mov dl,xfruitsPos
    cmp dl,[esi]
    jne end1
    cmp dh,[edi]
    je start
    end1:
    inc esi
    inc edi
    loop l1

    mov ecx,numberOffruits
    mov esi,offset xfruits
    mov edi,offset yfruits
    
    l2:
    mov dh,yfruitsPos
    mov dl,xfruitsPos
    cmp dl,[esi]
    jne end2
    cmp dh,[edi]
    je start
    end2:
    inc esi
    inc edi
    loop l2
    
    

    mov ecx,numberOfobsticles
    mov esi,offset xobs
    mov edi,offset yobs
    l3:
    mov dh,yfruitsPos
    mov dl,xfruitsPos
    cmp dl,[esi]
    jne end3
    cmp dh,[edi]
    je start
    end3:
    inc esi
    inc edi
    loop l3

    mov ecx,numberOfcherry
    mov esi,offset xcherry
    mov edi,offset ycherry
    l4:
    mov dh,yfruitsPos
    mov dl,xfruitsPos
    cmp dl,[esi]
    jne end4
    cmp dh,[edi]
    je start
    end4:
    inc esi
    inc edi
    loop l4

    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l5:
    mov dh,yfruitsPos
    mov dl,xfruitsPos
    cmp dl,[esi]
    jne end5
    cmp dh,[edi]
    je start
    end5:
    inc esi
    inc edi
    loop l5
    
    pop edi
    pop esi
    pop ecx


    ret
    CreateRandomfruits ENDP

;;//////////////////////   Create Random obsticle  //////////////////////////////////;;
CreateRandomobsticle PROC uses esi eax ebx ecx edx edi

push ecx
push esi
push edi
start:
    mov wallflag,0
    mov eax,77
    inc eax
    call RandomRange
    add al,22
    mov xobsPos,al
    mov eax,25
    call RandomRange
    add al,2
    mov yobsPos,al
    mov dl,xobsPos
    mov dh,yobsPos
    call wallcheck
    cmp wallflag,0
    jne start

    
    mov ecx,numberOfpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l1:
    mov dh,yobsPos
    mov dl,xobsPos
    cmp dl,[esi]
    jne end1
    cmp dh,[edi]
    je start
    end1:
    inc esi
    inc edi
    loop l1

    mov ecx,numberOffruits
    mov esi,offset xfruits
    mov edi,offset yfruits
    
    l2:
    mov dh,yobsPos
    mov dl,xobsPos
    cmp dl,[esi]
    jne end2
    cmp dh,[edi]
    je start
    end2:
    inc esi
    inc edi
    loop l2
    
    

    mov ecx,numberOfobsticles
    mov esi,offset xobs
    mov edi,offset yobs
    l3:
    mov dh,yobsPos
    mov dl,xobsPos
    cmp dl,[esi]
    jne end3
    cmp dh,[edi]
    je start
    end3:
    inc esi
    inc edi
    loop l3

    mov ecx,numberOfcherry
    mov esi,offset xcherry
    mov edi,offset ycherry
    l4:
    mov dh,yobsPos
    mov dl,xobsPos
    cmp dl,[esi]
    jne end4
    cmp dh,[edi]
    je start
    end4:
    inc esi
    inc edi
    loop l4

    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l5:
    mov dh,yobsPos
    mov dl,xobsPos
    cmp dl,[esi]
    jne end5
    cmp dh,[edi]
    je start
    end5:
    inc esi
    inc edi
    loop l5
    
    pop edi
    pop esi
    pop ecx


    ret
    CreateRandomobsticle ENDP


;;//////////////////////   Create Random cherry  //////////////////////////////////;;
CreateRandomcherry PROC uses esi eax ebx ecx edx edi

push ecx
push esi
push edi
start:
    mov wallflag,0
    mov eax,77
    inc eax
    call RandomRange
    add al,22
    mov xcherryPos,al
    mov eax,25
    call RandomRange
    add al,2
    mov ycherryPos,al
    mov dl,xcherryPos
    mov dh,ycherryPos
    call wallcheck
    cmp wallflag,0
    jne start

    
   mov ecx,numberOfpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l1:
    mov dh,ycherryPos
    mov dl,xcherryPos
    cmp dl,[esi]
    jne end1
    cmp dh,[edi]
    je start
    end1:
    inc esi
    inc edi
    loop l1

    mov ecx,numberOffruits
    mov esi,offset xfruits
    mov edi,offset yfruits
    
    l2:
    mov dh,ycherryPos
    mov dl,xcherryPos
    cmp dl,[esi]
    jne end2
    cmp dh,[edi]
    je start
    end2:
    inc esi
    inc edi
    loop l2
    
    

    mov ecx,numberOfobsticles
    mov esi,offset xobs
    mov edi,offset yobs
    l3:
    mov dh,ycherryPos
    mov dl,xcherryPos
    cmp dl,[esi]
    jne end3
    cmp dh,[edi]
    je start
    end3:
    inc esi
    inc edi
    loop l3

    mov ecx,numberOfcherry
    mov esi,offset xcherry
    mov edi,offset ycherry
    l4:
    mov dh,ycherryPos
    mov dl,xcherryPos
    cmp dl,[esi]
    jne end4
    cmp dh,[edi]
    je start
    end4:
    inc esi
    inc edi
    loop l4

    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l5:
    mov dh,ycherryPos
    mov dl,xcherryPos
    cmp dl,[esi]
    jne end5
    cmp dh,[edi]
    je start
    end5:
    inc esi
    inc edi
    loop l5
    
    pop edi
    pop esi
    pop ecx


    ret
    CreateRandomcherry ENDP
;;//////////////////////   Draw Coin  //////////////////////////////////;;

DrawCoin PROC uses esi eax ebx ecx edx edi
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"*"
    call WriteChar
    ret
DrawCoin ENDP

;;//////////////////////   Create Random Coin  //////////////////////////////////;;
CreateRandomCoin PROC uses esi eax ebx ecx edx edi

push ecx
push esi
push edi
start:
    mov wallflag,0
    mov eax,77
    inc eax
    call RandomRange
    add al,22
    mov xCoinPos,al
    mov eax,25
    call RandomRange
    add al,2
    mov yCoinPos,al
    mov dl,xCoinPos
    mov dh,yCoinPos
    call wallcheck
    cmp wallflag,0
    jne start

    
   mov ecx,numberOfpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l1:
    mov dh,yCoinPos
    mov dl,xCoinPos
    cmp dl,[esi]
    jne end1
    cmp dh,[edi]
    je start
    end1:
    inc esi
    inc edi
    loop l1

    mov ecx,numberOffruits
    mov esi,offset xfruits
    mov edi,offset yfruits
    
    l2:
    mov dh,yCoinPos
    mov dl,xCoinPos
    cmp dl,[esi]
    jne end2
    cmp dh,[edi]
    je start
    end2:
    inc esi
    inc edi
    loop l2
    
    

    mov ecx,numberOfobsticles
    mov esi,offset xobs
    mov edi,offset yobs
    l3:
    mov dh,yCoinPos
    mov dl,xCoinPos
    cmp dl,[esi]
    jne end3
    cmp dh,[edi]
    je start
    end3:
    inc esi
    inc edi
    loop l3

    mov ecx,numberOfcherry
    mov esi,offset xcherry
    mov edi,offset ycherry
    l4:
    mov dh,yCoinPos
    mov dl,xCoinPos
    cmp dl,[esi]
    jne end4
    cmp dh,[edi]
    je start
    end4:
    inc esi
    inc edi
    loop l4

    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l5:
    mov dh,yCoinPos
    mov dl,xCoinPos
    cmp dl,[esi]
    jne end5
    cmp dh,[edi]
    je start
    end5:
    inc esi
    inc edi
    loop l5
    
    pop edi
    pop esi
    pop ecx


    ret
    CreateRandomCoin ENDP
;;//////////////////////  StartGame  menu  //////////////////////////////////;;
StartGaMe proc uses esi eax ebx ecx edx edi
; Display "PECMAN" at the start of the game
    mov eax,green ;(blue*16)
    call SetTextColor
    mov eax,500
    call delay
    mov dl,20
    mov dh,5
    call Gotoxy
    mov eax, 1
    mov edx,OFFSET GAMENAME 
    call WriteString
    call crlf
    mov eax,500
    call delay
     mov dl,20
    mov dh,6
    call Gotoxy
    mov eax, 2
    mov edx,OFFSET GAMENAME1 
    call WriteString
    call crlf
    mov eax,500
    call delay
     mov dl,20
    mov dh,7
    call Gotoxy
    mov eax, 3
    mov edx,OFFSET GAMENAME2 
    call WriteString
    mov eax,500
    call delay
    mov dl,20
    mov dh,8
    call crlf
    call Gotoxy
    mov eax, 4
    mov edx,OFFSET GAMENAME3 
    call WriteString
    call crlf
    mov eax,500
    call delay
    mov dl,20
    mov dh,9
    call Gotoxy
    mov eax, 5
    mov edx,OFFSET GAMENAME4
    call WriteString
    call crlf
    mov eax,500
    call delay
    mov dl,20
    mov dh,10
    call Gotoxy
    mov eax, 6
    mov edx,OFFSET GAMENAME5
    call WriteString
    call crlf
    mov eax,500
    call delay
    mov dl,45
    mov dh,18
    call Gotoxy
    call waitmsg
    call Clrscr
ret
StartGaMe endp

;;//////////////////////    drawing boundries   ///////////////////////////;;
boundry proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,red ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,27
    mov dh,2
    mov temp,dh
    l1:
    mov dh,temp
    mov dl,20
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    loop l1


    mov ecx,27
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,100
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    loop l2

    cmp level,3
    jne no
    mov eax,lightred ;(black * 16)
    call SetTextColor
    mov dh,14
    mov dl,100
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    mov dh,14
    mov dl,20
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString

    

    no:

ret
boundry endp

;;////////////////////////    drawing sores   ///////////////////////////////;;
scores proc uses esi eax ebx ecx edx edi
    mov eax,yellow ;(blue*16)
    call SetTextColor
        mov dl,0
        mov dh,10
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt
        ret
scores endp

;;////////////////////////    game title   ///////////////////////////////;;
gameT proc uses esi eax ebx ecx edx edi
    mov eax,white ;(blue*16)
    call SetTextColor
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET gametitle
        call WriteString
        ret
gameT endp


;;////////////////////////    drawing names   ///////////////////////////////;;
names proc uses esi eax ebx ecx edx edi
    mov eax,green ;(blue*16)
    call SetTextColor
        mov dl,0
        mov dh,17
        call Gotoxy
        mov edx,OFFSET strPlayername
        call WriteString
        mov eax,gray ;(blue*16)
        call SetTextColor
        mov dl,0
        mov dh,18
        call Gotoxy
        mov edx,OFFSET strPlayernam
        call WriteString
        ret
names endp

;;////////////////////////    drawing heighest score   ///////////////////////////////;;
highestscr proc uses esi eax ebx ecx edx edi
    mov eax,white ;(blue*16)
    call SetTextColor
        mov dl,102
        mov dh,6
        call Gotoxy
        mWrite " heighest score:"
        
        mov dh,8
        mov dl,108
        call Gotoxy
        mov edx,OFFSET strfiles
        call WriteString
        ret
highestscr endp

;;////////////////////////   asking name   ///////////////////////////////;;
askingname proc uses esi eax ebx ecx edx edi
    call clrscr
    mov dl,0
    mov dh,0
    call gotoxy
    mov edx,OFFSET strPlayername
    call WriteString
    mov edx, OFFSET strPlayernam
    mov ecx,20
    call ReadString
    mov stringLength,eax
    mov  eax,black+(black*16)
    call SetTextColor
    call clrscr

        ret
askingname endp
;;////////////////////////   wall1 name   ///////////////////////////////;;

wall1 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,18
    inc eax
    call RandomRange
    add al,22
    mov wall1x,al
    mov dl,al

    mov al,21
    mov wall1y,al
    mov dh,al
    mov ecx,24
    mov esi,offset wall1x
    mov edi,offset wall1y
    l4:
    mov dl,[esi]
    mov bl,[esi]
    inc bl
    inc esi
    mov [esi],bl
    mov dh,[edi]
    inc edi
    mov[edi],dh
    
    call Gotoxy
    mov edx,OFFSET ground3
    call WriteString
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall1 endp

;;////////////////////////   wall2 name   ///////////////////////////////;;

wall2 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    ;mov eax,10
    ;inc eax
    ;call RandomRange
    add al,30
    mov wall2x,al
    mov dl,al

    mov al,3
    mov wall2y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall2x
    mov edi,offset wall2y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall2 endp

;;////////////////////////   wall3 name   ///////////////////////////////;;

wall3 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

   ; mov eax,20
    ;inc eax
    ;call RandomRange
    add al,31
    mov wall3x,al
    mov dl,al

    mov al,14
    mov wall3y,al
    mov dh,al
    mov ecx,24
    mov esi,offset wall3x
    mov edi,offset wall3y
    l4:
    mov dl,[esi]
    mov bl,[esi]
    inc bl
    inc esi
    mov [esi],bl
    mov dh,[edi]
    inc edi
    mov[edi],dh
    
    call Gotoxy
    mov edx,OFFSET ground3
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall3 endp
;;////////////////////////   wall4 name   ///////////////////////////////;;

wall4 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    ;mov eax,10
    ;inc eax
    ;call RandomRange
    add al,88
    mov wall4x,al
    mov dl,al

    mov al,10
    mov wall4y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall4x
    mov edi,offset wall4y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall4 endp

;;////////////////////////   wall5 name   ///////////////////////////////;;

wall5 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

   ; mov eax,20
    ;inc eax
    ;call RandomRange
    add al,64
    mov wall5x,al
    mov dl,al

    mov al,10
    mov wall5y,al
    mov dh,al
    mov ecx,24
    mov esi,offset wall5x
    mov edi,offset wall5y
    l4:
    mov dl,[esi]
    mov bl,[esi]
    inc bl
    inc esi
    mov [esi],bl
    mov dh,[edi]
    inc edi
    mov[edi],dh
    
    call Gotoxy
    mov edx,OFFSET ground3
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall5 endp

;;////////////////////////   wall6 name   ///////////////////////////////;;

wall6 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,25
    ;inc eax
    call RandomRange
    add al,44
    mov wall6x,al
    mov dl,al

    mov al,5
    mov wall6y,al
    mov dh,al
    mov ecx,24
    mov esi,offset wall6x
    mov edi,offset wall6y
    l4:
    mov dl,[esi]
    mov bl,[esi]
    inc bl
    inc esi
    mov [esi],bl
    mov dh,[edi]
    inc edi
    mov[edi],dh
    
    call Gotoxy
    mov edx,OFFSET ground3
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall6 endp

;;////////////////////////   wall7 name   ///////////////////////////////;;

wall7 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    ;mov eax,10  
    ;call RandomRange
    add al,65
    mov wall7x,al
    mov dl,al

    mov al,17
    mov wall7y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall7x
    mov edi,offset wall7y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall7 endp
;;////////////////////////   wall8 name   ///////////////////////////////;;

wall8 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,10
    call RandomRange
    add al,50
    mov wall8x,al
    mov dl,al

    mov al,2
    mov wall8y,al
    mov dh,al
    mov ecx,10
    mov esi,offset wall8x
    mov edi,offset wall8y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall8 endp

;;////////////////////////   wall9 name   ///////////////////////////////;;

wall9 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,10
    call RandomRange
    add al,26
    mov wall9x,al
    mov dl,al

    mov al,16
    mov wall9y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall9x
    mov edi,offset wall9y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall9 endp


;////////////////////////   wall10 name   ///////////////////////////////;;

wall10 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,0
    ;call RandomRange
    add al,76
    mov wall10x,al
    mov dl,al

    mov al,13
    mov wall10y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall10x
    mov edi,offset wall10y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall10 endp

;;////////////////////////   wall11 name   ///////////////////////////////;;

wall11 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,25
    ;inc eax
    ;all RandomRange
    add al,12
    mov wall11x,al
    mov dl,al

    mov al,8
    mov wall11y,al
    mov dh,al
    mov ecx,24
    mov esi,offset wall11x
    mov edi,offset wall11y
    l4:
    mov dl,[esi]
    mov bl,[esi]
    inc bl
    inc esi
    mov [esi],bl
    mov dh,[edi]
    inc edi
    mov[edi],dh
    
    call Gotoxy
    mov edx,OFFSET ground3
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall11 endp


;////////////////////////   wall12 name   ///////////////////////////////;;

wall12 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,10
    ;call RandomRange
    add al,74
    mov wall12x,al
    mov dl,al

    mov al,17
    mov wall12y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall12x
    mov edi,offset wall12y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall12 endp

;////////////////////////   wall13 name   ///////////////////////////////;;

wall13 proc uses esi eax ebx ecx edx edi
; draw ground at (0,29):
    mov eax,green ;(black * 16)
    call SetTextColor

    mov eax,10
    ;call RandomRange
    add al,86
    mov wall13x,al
    mov dl,al

    mov al,17
    mov wall13y,al
    mov dh,al
    mov ecx,12
    mov esi,offset wall13x
    mov edi,offset wall13y
    l4:
    mov dl,[esi]
    inc esi
    mov [esi],dl
    mov dh,[edi]
    mov bl,[edi]
    inc bl
    inc edi
    mov [edi],bl
    
    
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    
    loop l4
    mov al,0
    mov [esi],al
    mov [edi],al
ret
wall13 endp

;////////////////////////   pause menu   ///////////////////////////////;;

pausescreen PROC uses esi eax ebx ecx edx edi
    l1:
    call Readchar
    mov inputChar,al
    ; exit game if user types 'x':
    cmp inputChar,"c"
    je l2

    jmp l1
    l2:
    call gameloop
ret
pausescreen endp


;////////////////////////   wallcheck   ///////////////////////////////;;
wallcheck proc uses esi eax ebx ecx edx edi
;/////obsticle check    
push esi
push edi
push ecx

mov ecx,numberofobsticles
mov esi, offset xobs
mov edi, offset yobs

lo:
        mov bl,dl
        cmp bl,[esi]
        jne notCollecting
        mov bl,dh
        cmp bl,[edi]
        jne notCollecting
        ; player is intersecting coin:
        
        mov wallflag,1
        notCollecting:
        inc esi
        inc edi
loop lo
        

pop ecx
pop edi
pop esi

;//////////////////
cmp level,3
jne boundary
cmp dl,20
jne boundary1
cmp dh,14
jne boundary
mov dl,21
call gotoxy
mov eax," "
call writechar
mov xpos,99
ret
boundary1:
cmp dl,100
jne boundary
cmp dh,14
jne boundary
mov dl,99
call gotoxy
mov eax," "
call writechar
mov xpos,21
ret



boundary:
push ecx
cmp dl,20
jg ll1
mov wallflag,1
ll1:
cmp dl,100
jl ll2
mov wallflag,1
ll2:
cmp dh,1
jg ll3
mov wallflag,1
ll3:

cmp dh,29
jl ll4
mov wallflag,1
ll4:

;wall1

mov cx,30
mov esi,offset wall1x
mov edi,offset wall1y
l1:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l2
cmp bh,dh
jne l2
mov wallflag,1
l2:
loop l1



;for wall2
mov cx,30
mov esi,offset wall2x
mov edi,offset wall2y
l3:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l4
cmp bh,dh
jne l4
mov wallflag,1
l4:
loop l3

;for wall3
mov cx,30
mov esi,offset wall3x
mov edi,offset wall3y
l5:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l6
cmp bh,dh
jne l6
mov wallflag,1
l6:
loop l5

;for wall4
mov cx,30
mov esi,offset wall4x
mov edi,offset wall4y
l7:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l8
cmp bh,dh
jne l8
mov wallflag,1
l8:
loop l7

;for wall5
mov cx,30
mov esi,offset wall5x
mov edi,offset wall5y
l9:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l10
cmp bh,dh
jne l10
mov wallflag,1
l10:
loop l9

;for wall6
mov cx,30
mov esi,offset wall6x
mov edi,offset wall6y
l11:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l12
cmp bh,dh
jne l12
mov wallflag,1
l12:
loop l11

;for wall7
mov cx,30
mov esi,offset wall7x
mov edi,offset wall7y
l13:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l14
cmp bh,dh
jne l14
mov wallflag,1
l14:
loop l13

;for wall8
mov cx,30
mov esi,offset wall8x
mov edi,offset wall8y
l15:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l16
cmp bh,dh
jne l16
mov wallflag,1
l16:
loop l15

;for wall9
mov cx,30
mov esi,offset wall9x
mov edi,offset wall9y
l17:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l18
cmp bh,dh
jne l18
mov wallflag,1
l18:
loop l17

;for wall10
mov cx,30
mov esi,offset wall10x
mov edi,offset wall10y
l19:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l20
cmp bh,dh
jne l20
mov wallflag,1
l20:
loop l19

;for wall11
mov cx,30
mov esi,offset wall11x
mov edi,offset wall11y
l21:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l22
cmp bh,dh
jne l22
mov wallflag,1
l22:
loop l21

;for wall12
mov cx,30
mov esi,offset wall12x
mov edi,offset wall12y
l23:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l24
cmp bh,dh
jne l24
mov wallflag,1
l24:
loop l23

;for wall13
mov cx,30
mov esi,offset wall13x
mov edi,offset wall13y
l25:
mov bl,[esi]
mov bh,[edi]
inc esi
inc edi
cmp bl,dl
jne l26
cmp bh,dh
jne l26
mov wallflag,1
l26:
loop l25

pop ecx
ret
wallcheck endp

;;//////////////////////   displaying level  //////////////////////////////////;;

showlevel PROC uses esi eax ebx ecx edx edi
    mov  eax,yellow;+(green*16)
    call SetTextColor
    mov dl,0
    mov dh,3
    call Gotoxy
    mwrite "level:"
    mov eax,0
    mov al,level
    call WriteInt
    ret
showlevel ENDP




;;//////////////////////   displaying lives  //////////////////////////////////;;

showlives PROC uses esi eax ebx ecx edx edi
    mov dl,0
    mov dh,24
    call Gotoxy
    mov  eax,cyan;+(green*16)
    call SetTextColor
    mwrite "lives:"
    mov eax,0
    mov al,lives
    call WriteInt
    ret
showlives ENDP
;;//////////////////////   level1  //////////////////////////////////;;

level1 PROC uses esi eax ebx ecx edx edi
    call clrscr
    mov  eax,yellow+(red*16)
    call SetTextColor
    
    mov dl,50
    mov dh,13
    call Gotoxy
    mwrite "level1:"
    mov speed,600
    mov eax,3000
    call delay
    mov  eax,black+(black*16)
    call SetTextColor
    call clrscr
    mov level,1
    call wall1
    call wall2
    call wall3
    call wall4
    call wall5
    call wall6
    call wall7
    numberOfCoins = 100t
    mov numOfCoins,numberofcoins
    call boundry
    call DrawPlayer
    mov ecx,0
    mov cl,numOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l1:
    push esi
    push edi
    call Randomize
    call CreateRandomCoin
    call DrawCoin
    pop edi
    pop esi
    mov dl,xCoinPos
    mov dh,yCoinPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l1
    ;//////////////////////

    

    call names
    call gameloop

    call gameloop

    ret
level1 ENDP


;;//////////////////////   level2  //////////////////////////////////;;

level2 PROC uses esi eax ebx ecx edx edi
    call clrscr
    mov  eax,yellow+(red*16)
    call SetTextColor
    mov dl,50
    mov dh,13
    call Gotoxy
    mwrite "level2:"
    mov count,0
    mov putaken,0
    mov ExPos ,35
    mov EyPos, 12
    mov E2xPos,50
    mov E2yPos, 24
    mov epresent,1
    mov e2present,1
    mov e3present,1
    mov e4present,1
    mov movementcheck,0

    mov counter,0
    mov countere2,0
    mov speed,400
    mov eax,3000
    call delay
    numberOfCoins = 10t
    mov numOfCoins,numberofcoins
    mov xPos ,22
    mov yPos, 22
    mov cscore,0
    mov level,2
    mov  eax,black+(black*16)
    call SetTextColor
    call clrscr    
    call wall1
    call wall2
    call wall3
    call wall4
    call wall5
    call wall6
    call wall7
    call wall9
    call wall10
    call wall8

    call boundry
    call DrawPlayer
    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l1:
    push esi
    push edi
    call Randomize
    call CreateRandomCoin
    call DrawCoin
    pop edi
    pop esi
    mov dl,xCoinPos
    mov dh,yCoinPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l1
    ;/////////////calling powerups///////
    mov ecx,0
    mov cl,numberofpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l2:
    push esi
    push edi
    call Randomize
    call CreateRandompowerup
    call Drawpowerups
    pop edi
    pop esi
    mov dl,xpuPos
    mov dh,ypuPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l2
    ;//////////////////////
    ;/////////////calling Fruites///////
    mov ecx,0
    mov cl,numberofFruits
    mov esi,offset xFruits
    mov edi,offset yFruits
    l3:
    push esi
    push edi
    call Randomize
    call CreateRandomFruits
    call DrawFruits
    pop edi
    pop esi
    mov dl,xFruitsPos
    mov dh,yFruitsPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l3
    ;//////////////////////
    
    call names

    call gameloop

    ret
level2 ENDP

;;//////////////////////   level3  //////////////////////////////////;;

level3 PROC uses esi eax ebx ecx edx edi
    call clrscr
    mov  eax,yellow+(red*16)
    call SetTextColor
    mov dl,50
    mov dh,13
    call Gotoxy
    mwrite "level3:"
    mov count,0
    mov putaken,0
    mov ExPos ,35
    mov EyPos, 12
    mov E2xPos,50
    mov E2yPos, 24
    mov epresent,1
    mov e2present,1
    mov e3present,1
    mov e4present,1
    mov movementcheck,0

    mov counter,0
    mov countere2,0
    mov countere3,0
    mov countere4,0
    mov speed,200
    mov eax,3000
    call delay
    numberOfCoins = 20t
    mov numOfCoins,numberofcoins
    mov xPos ,22
    mov yPos, 22
    mov cscore,0
    mov level,3
    mov  eax,black+(black*16)
      call SetTextColor
    call clrscr    
    call wall1
    call wall2
    call wall3
    call wall4
    call wall5
    call wall6
    call wall7
    call wall9
    call wall10
    call wall11
    call wall8
    call wall12
    call wall13

    call boundry
    call DrawPlayer
    mov ecx,numberOfCoins
    mov esi,offset xCoin
    mov edi,offset yCoin
    l1:
    push esi
    push edi
    call Randomize
    call CreateRandomCoin
    call DrawCoin
    pop edi
    pop esi
    mov dl,xCoinPos
    mov dh,yCoinPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l1
    ;/////////////calling powerups///////
    mov ecx,0
    mov cl,numberofpowerups
    mov esi,offset xpu
    mov edi,offset ypu
    l2:
    push esi
    push edi
    call Randomize
    call CreateRandompowerup
    call Drawpowerups
    pop edi
    pop esi
    mov dl,xpuPos
    mov dh,ypuPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l2
    ;//////////////////////
    ;/////////////calling Fruites///////
    mov ecx,0
    mov cl,numberofFruits
    mov esi,offset xFruits
    mov edi,offset yFruits
    l3:
    push esi
    push edi
    call Randomize
    call CreateRandomFruits
    call DrawFruits
    pop edi
    pop esi
    mov dl,xFruitsPos
    mov dh,yFruitsPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l3
    ;//////////////////////
     ;/////////////calling cherry///////
    mov ecx,0
    mov cl,numberofcherry
    mov esi,offset xcherry
    mov edi,offset ycherry
    l4:
    push esi
    push edi
    call Randomize
    call CreateRandomcherry
    call Drawcherry
    pop edi
    pop esi
    mov dl,xcherryPos
    mov dh,ycherryPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l4
    ;//////////////////////
    mov ecx,0
    mov cl,numberofobsticles
    mov esi,offset xobs
    mov edi,offset yobs
    l5:
    push esi
    push edi
    call Randomize
    call CreateRandomobsticle
    call Drawobsticles
    pop edi
    pop esi
    mov dl,xobsPos
    mov dh,yobsPos
    mov [esi],dl
    mov [edi],dh
    inc esi
    inc edi
    loop l5
    
    call names

    call gameloop

    ret
level3 ENDP



;;//////////////////////   gamefinished  //////////////////////////////////;;

gamefinished PROC uses esi eax ebx ecx edx edi
    
    mov  eax,cyan+(cyan*16)
    call SetTextColor
    call clrscr
    
    mov eax,red +(cyan*16)
    call SetTextColor
    
    mov dl,25
    mov dh,2
    call Gotoxy
    mwrite"       ('-.       .-') _  _ .-') _                       ('-.     _   .-')       ('-. "
    mov dl,25
    mov dh,3
    call Gotoxy
    mwrite" _(  OO)     ( OO ) )( (  OO) )                     ( OO ).-.( '.( OO )_   _(  OO)  "
    mov dl,25
    mov dh,4
    call Gotoxy
    mwrite"(,------.,--./ ,--,'  \     .'_         ,----.      / . --. / ,--.   ,--.)(,------. "
    mov dl,25
    mov dh,5
    call Gotoxy
    mwrite" |  .---'|   \ |  |\  ,`'--..._)       '  .-./-')   | \-.  \  |   `.'   |  |  .---' "
    mov dl,25
    mov dh,6
    call Gotoxy
    mwrite" |  |    |    \|  | ) |  |  \  '       |  |_( O- ).-'-'  |  | |         |  |  |    " 
    mov dl,25
    mov dh,7
    call Gotoxy
    mwrite"(|  '--. |  .     |/  |  |   ' |       |  | .--, \ \| |_.'  | |  |'.'|  | (|  '--."  
    mov dl,25
    mov dh,8
    call Gotoxy
    mwrite" |  .--' |  |\    |   |  |   / :      (|  | '. (_/  |  .-.  | |  |   |  |  |  .--'  "
    mov dl,25
    mov dh,9
    call Gotoxy
    mwrite" |  `---.|  | \   |   |  '--'  /       |  '--'  |   |  | |  | |  |   |  |  |  `---. "
    mov dl,25
    mov dh,10
    call Gotoxy
    mwrite" `------'`--'  `--'   `-------'         `------'    `--' `--' `--'   `--'  `------' "
    

        mov dl,47
        mov dh,13
        call Gotoxy
        mov edx,OFFSET endgamestr
        call WriteString
        
        mov dl,50
        mov dh,15
        call Gotoxy
        mov edx,OFFSET strPlayernam
        call WriteString
        mov eax,red +(cyan*16)
        call SetTextColor
        mov dl,50
        mov dh,16
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt
        mov dl,35
    mov dh,21
    call Gotoxy
    mwrite"__________" 
    mov dh,22
    call Gotoxy
    mwrite"\______   \_____   ____             _____ _____    ____"  
    mov dh,23
    call Gotoxy
    mwrite"|     ___/\__  \ _/ ___\   ______  /     \\__  \  /    \" 
    mov dh,24
    call Gotoxy
    mwrite"|    |     / __ \\  \___  /_____/ |  Y Y  \/ __ \|   |  \"
    mov dh,25
    call Gotoxy
    mwrite"|____|    (____  /\___  >         |__|_|  (____  /___|  /"
    mov dh,26
    call Gotoxy
    mwrite"               \/     \/                \/     \/     \/ "

    call crlf
    call crlf
    
    invoke PlaySoundA, ADDR deathSound, 0, snd_asy or snd_nowait
    mov eax,3000
    call delay
   
    ;//////////inserting in file///////


mov edx,OFFSET filename
    call OpenInputFile
    mov fileHandle,eax

    ; Read the file into a buffer.
    mov edx,OFFSET buffer
    mov ecx,BUFFER_SIZE
    call ReadFromFile
    mov buffer[eax],0
    mov filelength,eax
    ; display file size
    
    close_file:
    mov eax,fileHandle
    call CloseFile
    
    




    ; Create a new text file.
    mov edx,OFFSET filename
    call CreateOutputFile
    mov fileHandle,eax
    ; Check for errors.
    cmp eax, INVALID_HANDLE_VALUE ; error found?
    jne file_ok
    ; no: skip
    mov edx,OFFSET str1
    ; display error
    call WriteString
    jmp quit
    file_ok:
    ; Ask the user to input a string.
    mov edx,OFFSET str3
    ; "Enter up to ...."
    call WriteString
;///////////////////////
 


;/////////////////////////////
;///////writing to file///////
;////////////////////////////

mov esi, offset filecurrent



mov edi, offset strPlayernam
mov ecx, stringLength
l1:
    mov al,[edi]
    mov [esi],al
    inc esi
    inc edi
loop l1

;inc stringLength
mov al,"/"
mov [esi],al
inc esi
inc stringLength
mov edi ,offset score
mov bx,100
cmp [edi],bx
jmp higherscore
; for score 0,99
comment ^
mov bx, 30h      
mov ax, [edi]    
test ax, ax      
jne lol          
mov ax,0
mov dx, 0        
jmp lol1         
lol:
mov cx, 10       
mov dx,0
div cx           
lol1:
add bx, dx       
mov [esi], bx 
inc stringLength
inc esi
add ax,30h
mov [esi],ax
inc stringLength
;;;;/////////reversing string//////

mov ax,[esi]
dec esi
mov bx,[esi]
mov [esi],ax
inc esi
mov [esi],bx

;////////////////////


inc esi
jmp next
^
;for score 100-999
higherscore:

mov bx, 30h      
mov ax, [edi]    
mov cx, 10       
mov dx,0
div cx           
add bx, dx       
mov [esi], bx 
inc stringLength
inc esi

mov bx, 30h
mov cx, 10       
mov dx,0
div cx           
add bx, dx       
mov [esi], bx 
inc stringLength
inc esi

add ax,30h
mov [esi],ax
inc stringLength

;;;;/////////reversing string//////

mov ax,[esi]
dec esi
mov dx,[esi]
dec esi
mov bx,[esi]
mov [esi],ax
inc esi
mov [esi],dx
inc esi
mov [esi],bx

inc esi

;//////


next:
mov al,";"
mov [esi],al
inc esi
inc stringLength
mov edi ,offset level
mov bl,30h
mov dl,[edi]
add bl,dl
mov [esi],bl
inc esi
inc stringLength
mov al,","
mov [esi],al
inc esi
inc stringLength

mov edi, offset buffer
mov ecx, filelength
sub stringLength,2
cmp ecx,0
je first
l2:
mov al,[edi]
mov [esi],al
inc stringLength
inc esi
inc edi
loop l2
add stringLength,2
first:

mov edx,OFFSET filecurrent
mov ecx,stringLength


mov eax,fileHandle
call WriteToFile


mov bytesWritten,eax
; save return value
mov eax,fileHandle
call CloseFile
; Display the return value.
mov edx,OFFSET str2
; "Bytes written"
call WriteString
call Crlf
quit:

        
   call ending1
   ret
gamefinished ENDP

;;//////////////////////   list of players  //////////////////////////////////;;

ListOfPlayers PROC uses esi eax ebx ecx edx edi
    mov  eax,cyan+(cyan*16)
    call SetTextColor
    call clrscr
    
    mov  eax,red+(cyan*16)
    call SetTextColor
mov dl,12
mov dh,2
call gotoxy
mwrite"__________.__                                     __________                              .___"
mov dh,3
call gotoxy
mwrite"\______   \  | _____  ___.__. ___________  ______ \______   \ ____   ____  ___________  __| _/"
mov dh,4
call gotoxy
mwrite" |     ___/  | \__  \<   |  |/ __ \_  __ \/  ___/  |       _// __ \_/ ___\/  _ \_  __ \/ __ | "
mov dh,5
call gotoxy
mwrite" |    |   |  |__/ __ \\___  \  ___/|  | \/\___ \   |    |   \  ___/\  \__(  <_> )  | \/ /_/ | "
mov dh,6
call gotoxy
mwrite" |____|   |____(____  / ____|\___  >__|  /____  >  |____|_  /\___  >\___  >____/|__|  \____ | "
mov dh,7
call gotoxy
mwrite"                    \/\/         \/           \/          \/     \/     \/                 \/ "

mov  eax,black+(cyan*16)
    call SetTextColor

mov dl,20
mov dh,9
call gotoxy
mwrite"Names"

mov dl,49
mov dh,9
call gotoxy
mwrite"score"

mov dl,68
mov dh,9
call gotoxy
mwrite"level"

mov  eax,red+(cyan*16)
    call SetTextColor
    
    ; Open the file for input.
    mov edx,OFFSET filename
    call OpenInputFile
    mov fileHandle,eax
    
    file_ok:
    ; Read the file into a buffer.
    mov edx,OFFSET buffer
    mov ecx,BUFFER_SIZE
    call ReadFromFile
    mov buffer[eax],0
    mov filelength,eax
    
    mov eax,fileHandle
    call CloseFile
    quit:
    mov dl,20
    mov dh,10
    
    mov esi, offset buffer
    ;inc esi
    mov edi, offset filestr2
    mov ecx,filelength
    l2:
    mov al,[esi]
    cmp al,2fh
    je name1
    cmp al,3bh
    je sc
    cmp al,2ch
    je lev
    mov [edi],al
    inc esi
    inc edi
    cmp ecx,0
    je haha
    loop l2
    name1:
    mov dl,20
    push esi
    push edi
    push edx

    call gotoxy
    ;inc edi
    mov al,0
    mov [edi],al
    mov edx, offset filestr2
    call writestring
    pop edx
    pop edi
    pop esi
    mov edi, offset filestr2
    inc esi
    cmp ecx,0
    je haha
    
    ;inc dh
    loop l2
    
    sc:
    mov dl,50
    push esi
    push edi
    push edx
    call gotoxy
    ;inc edi
    mov al,0
    mov [edi],al
    mov edx, offset filestr2
    call writestring
    pop edx
    pop edi
    pop esi
    mov edi, offset filestr2
    inc esi
    cmp ecx,0
    je haha
    ;inc dh
    loop l2

    lev:
    mov dl,70
    push esi
    push edi
    push edx
    call gotoxy
    ;inc edi
    mov al,0
    mov [edi],al
    mov edx, offset filestr2
    call writestring
    pop edx
    pop edi
    pop esi
    mov edi, offset filestr2
    inc esi
    cmp ecx,0
    je haha
    inc dh
    jmp l2

;    3bh;//;
    haha:




    call Readchar
    call startmenu

    ret
ListOfPlayers ENDP

;;//////////////////////   heighest score  //////////////////////////////////;;

heighestscore PROC uses esi eax ebx ecx edx edi
  
    
    ; Open the file for input.
    mov edx,OFFSET filename
    call OpenInputFile
    mov fileHandle,eax
    
    file_ok:
    ; Read the file into a buffer.
    mov edx,OFFSET buffer
    mov ecx,BUFFER_SIZE
    call ReadFromFile
    mov buffer[eax],0
    mov filelength,eax
    mov eax,fileHandle
    call CloseFile
    quit:
    mov dl,20
    mov dh,10
    
    mov esi, offset buffer
    mov edi, offset filestr2
    mov strfiles,"0"

    mov ecx,filelength

    l2:
    mov al,[esi]
    cmp al,2fh
    je name1
    cmp al,3bh
    je sc
    cmp al,2ch
    je lev
   
    mov [edi],al
    inc esi
    inc edi
    
    cmp ecx,0
    je haha
    loop l2
    name1:
    
   
    mov al,0
    mov [edi],al
    
    mov edi, offset filestr2
    inc esi
    cmp ecx,0
    je haha
    loop l2
    
    sc:
    
    mov al,0
    mov [edi],al
    INVOKE Str_compare,ADDR filestr2,ADDR strfiles
    jb haha1
    INVOKE Str_copy,ADDR filestr2,ADDR strfiles
    haha1:
   
    mov edi, offset filestr2
    inc esi
    cmp ecx,0
    je haha
    dec ecx
    jmp l2

    lev:
    
    mov al,0
    mov [edi],al
    
    mov edi, offset filestr2
    inc esi
    cmp ecx,0
    je haha

    dec ecx
    jmp l2
    haha:

    ret
heighestscore ENDP


;;//////////////////////   instruction menu  //////////////////////////////////;;

instruction PROC uses esi eax ebx ecx edx edi
    
    mov  eax,cyan+(cyan*16)
    call SetTextColor
    call clrscr
    
    mov  eax,red+(cyan*16)
    call SetTextColor
    mov dl,0
    mov dh,3
    call Gotoxy
    mwrite "INSTRUCTIONS:"
    
    mov dh,6
    call Gotoxy
    mwrite "* Game contains 3 levels"
    
    mov dh,8
    call Gotoxy
    mwrite "* Initally move up (w) down(s) left(a) right(d)"

    mov dh,10
    call Gotoxy
    mwrite "* You can change controls in game settings"

    mov dh,12
    call Gotoxy
    mwrite "* Collect all the coins and fruit if present"

    mov dh,14
    call Gotoxy
    mwrite "* Watch out from ghost and collect the bonuses"

    mov dh,16
    call Gotoxy
    mwrite "* Enjoy the game:)"

    mov dh,18
    call Gotoxy
    call waitmsg




    call Readchar
    call startmenu

    ret
instruction ENDP

;;//////////////////////   start menu  //////////////////////////////////;;

startmenu PROC uses esi eax ebx ecx edx edi

invoke PlaySoundA, ADDR midSound, 0, snd_asy or snd_nowait
    
    mov  eax,cyan+(cyan*16)
    call SetTextColor
    call clrscr

    mov  eax,red+(cyan*16)
    call SetTextColor
    
    mov dl,40
    mov dh,1
    call Gotoxy
    mwrite "         _   .-')       ('-.       .-') _   " 
    mov dl,40
    mov dh,2
    call Gotoxy
    mwrite "( '.( OO )_   _(  OO)     ( OO ) )          " 
    mov dl,40
    mov dh,3
    call Gotoxy
    mwrite " ,--.   ,--.)(,------.,--./ ,--,' ,--. ,--. "
    mov dl,40
    mov dh,4
    call Gotoxy
    mwrite " |   `.'   |  |  .---'|   \ |  |\ |  | |  | "  
    mov dl,40
    mov dh,5
    call Gotoxy
    mwrite " |         |  |  |    |    \|  | )|  | | .-')" 
    mov dl,40
    mov dh,6
    call Gotoxy
    mwrite " |  |'.'|  | (|  '--. |  .     |/ |  |_|( OO )"
    mov dl,40
    mov dh,7
    call Gotoxy
    mwrite " |  |   |  |  |  .--' |  |\    |  |  | | `-' /"
    mov dl,40
    mov dh,8
    call Gotoxy
    mwrite " |  |   |  |  |  `---.|  | \   | ('  '-'(_.-' "
    mov dl,40
    mov dh,9
    call Gotoxy
    mwrite " `--'   `--'  `------'`--'  `--'   `-----'    "

    mov dl,50
    mov dh,13
    call Gotoxy
    mwrite "press s to start game"

    mov dl,50
    mov dh,14
    call Gotoxy
    mwrite "press g for gamesetup"

    mov dl,50
    mov dh,15
    call Gotoxy
    mwrite "press i for instructions menu"
    
    mov dl,50
    mov dh,16
    call Gotoxy
    mwrite "press H for seeing all the records of player"

    mov dl,50
    mov dh,17
    call Gotoxy
    mwrite "press x for exit game"
    
    mov dl,35
    mov dh,21
    call Gotoxy
    mwrite"__________" 
    mov dh,22
    call Gotoxy
    mwrite"\______   \_____   ____             _____ _____    ____"  
    mov dh,23
    call Gotoxy
    mwrite"|     ___/\__  \ _/ ___\   ______  /     \\__  \  /    \" 
    mov dh,24
    call Gotoxy
    mwrite"|    |     / __ \\  \___  /_____/ |  Y Y  \/ __ \|   |  \"
    mov dh,25
    call Gotoxy
    mwrite"|____|    (____  /\___  >         |__|_|  (____  /___|  /"
    mov dh,26
    call Gotoxy
    mwrite"               \/     \/                \/     \/     \/ "
    
    call heighestscore
    l4:
    call READCHAR
    ;jmp l2
    mov inputChar,al
    ; exit game if user types 'x':
    cmp inputChar,"s"
    je l2
    cmp inputChar,"i"
    je l5

    cmp inputChar,"x"
    je l3

    cmp inputChar,"h"
    je l7

    cmp inputChar,"g"
    je gamesetting
    
    jmp l4
    l2:
    call askingname
    ;////////////////
    cmp level,1
    je level1
    cmp level,2
    je level2
    cmp level,3
    je level3

    l5:
    call instruction
    
    l7:
    call listOfPlayers
    
    l3:
    call ending1
    
    ret
startmenu ENDP

;;//////////////////////   start menu  //////////////////////////////////;;

gamesetting PROC uses esi eax ebx ecx edx edi
    
    mov  eax,cyan+(cyan*16)
    call SetTextColor
    call clrscr

    mov  eax,red+(cyan*16)
    call SetTextColor
    mov dl,44
    mov dh,6
    call Gotoxy
    mwrite "press 1 to change moving up command"

    mov dl,44
    mov dh,8
    call Gotoxy
    mwrite "press 2 to change moving down command"

    mov dl,44
    mov dh,10
    call Gotoxy
    mwrite "press 3 to change moving right command"

    mov dl,44
    mov dh,12
    call Gotoxy
    mwrite "press 4 to change moving left command"
    
    mov dl,44
    mov dh,14
    call Gotoxy
    mwrite "press 5 to change players character"

    mov dl,44
    mov dh,16
    call Gotoxy
    mwrite "press 6 to change starting level"

    mov dl,44
    mov dh,18
    call Gotoxy
    mwrite "press x to return"
    

    mov dl,35
    mov dh,21
    call Gotoxy
    mwrite"__________" 
    mov dh,22
    call Gotoxy
    mwrite"\______   \_____   ____             _____ _____    ____"  
    mov dh,23
    call Gotoxy
    mwrite"|     ___/\__  \ _/ ___\   ______  /     \\__  \  /    \" 
    mov dh,24
    call Gotoxy
    mwrite"|    |     / __ \\  \___  /_____/ |  Y Y  \/ __ \|   |  \"
    mov dh,25
    call Gotoxy
    mwrite"|____|    (____  /\___  >         |__|_|  (____  /___|  /"
    mov dh,26
    call Gotoxy
    mwrite"               \/     \/                \/     \/     \/ "
    
    l4:
    call Readchar
    mov inputChar,al
    ; exit game if user types 'x':
    cmp inputChar,"1"
    je l2
    cmp inputChar,"2"
    je l5

    cmp inputChar,"3"
    je l8

    cmp inputChar,"4"
    je l6

    cmp inputChar,"5"
    je l7

    cmp inputChar,"6"
    je l9

    cmp inputChar,"x"
    je startmenu
    
    jmp l4
   ; call startmenu
    l2:
    mov dl,44
    mov dh,27
    call Gotoxy
    mwrite "now enter the key you want to replace "
    ;//////////moving up////
    mov esi, offset up
    call Readchar
    mov [esi],al
    
    
    jmp l3
    ;//////////moving down////
    l5:
    mov dl,44
    mov dh,27
    call Gotoxy
    mwrite "now enter the key you want to replace "
    mov esi, offset down
    call Readchar
    mov [esi],al
    jmp l3
    ;//////////moving left////
    l6:
    mov dl,44
    mov dh,27
    call Gotoxy
    mwrite "now enter the key you want to replace "
    mov esi, offset left
    call Readchar
    mov [esi],al
    jmp l3
    ;//////////moving right////
    l8:
    mov dl,44
    mov dh,27
    call Gotoxy
    mwrite "now enter the key you want to replace "
    mov esi, offset right
    call Readchar
    mov [esi],al
    jmp l3
    ;//////////players icon////
    l7:
    mov dl,44
    mov dh,27
    call Gotoxy
    mwrite "now enter the key you want to replace "
    mov esi, offset playertype
    call Readchar
    mov [esi],al
    jmp l3
    ;//////////level number////
    l9:
    mov dl,44
    mov dh,27
    call Gotoxy
    mwrite "now enter the level you want to start your game with "
    call Readchar
    cmp al,"1"
    jne l10
    mov level,1
    jmp l3
    l10:
    cmp al,"2"
    jne l11
    mov level,2
    jmp l3
    l11:
    cmp al,"3"
    jne l12
    mov level,3
    jmp l3
    l12:

    jmp l9

    ;////////////////
    
    
    l3:
    jmp gamesetting
    
    ret
gamesetting ENDP

;;//////////////////////   teleportation  //////////////////////////////////;;

teleportation PROC uses esi eax ebx ecx edx edi
    
    mov al,xpos
    mov ah,ypos
    cmp ah,2
    jne l1
    cmp al,97
    jng l1
    mov xpos,23
    mov ypos,28
    call drawplayer
    l1:

    mov al,xpos
    mov ah,ypos
    cmp ah,28
    jne l2
    cmp al,22
    jg l2
    mov xpos,97
    mov ypos,2
    call drawplayer
    l2:


    mov al,xpos
    mov ah,ypos
    cmp ah,2
    jne l3
    cmp al,22
    jg l3
    mov xpos,97
    mov ypos,28
    call drawplayer
    l3:

    mov al,xpos
    mov ah,ypos
    cmp ah,28
    jne l4
    cmp al,97
    jng l4
    mov xpos,23
    mov ypos,2
    call drawplayer
    l4:


    mov  eax,white+(black*16)
    call SetTextColor
    mov dl,98
    mov dh,2
    call Gotoxy
    mwrite "->"
    mov dl,21
    mov dh,28
    call Gotoxy
    mwrite "->"

    mov  eax,gray+(black*16)
    call SetTextColor
    mov dl,21
    mov dh,2
    call Gotoxy
    mwrite "->"
    mov dl,98
    mov dh,28
    call Gotoxy
    mwrite "->"

    ret
teleportation endp

;;//////////////////////   ending  //////////////////////////////////;;

ending1 PROC
    mov ax,0
    exit
ret
ending1 Endp

;//////////////////////////////////////////////////////////;;///

END main