.data 
var1 dd 3
bool DWORD  10

.code

myProc proc
	mov eax,var1
	sal eax,1
	mov var1,eax
	;mov eax,var1
	sal eax,1
	ret
myProc endp

makeitDouble proc
	mov eax,ecx
	sal eax,1
	ret
makeitDouble endp

makeMul proc
	mov eax,ecx
	imul eax,edx
	ret
makeMul endp

doString proc
	;mov rax,0		; init rax
	inc rcx			; pour avoir la 2eme lettre de la chaine
	mov al,[rcx]	; il faut faire r�f�rence � rcx (et non pas � eax) pour avoir l'adresse compl�te (sinon exception)
	ret				; renvoie le premier char de la chaine (dans AL)
doString endp

doCharLen proc
	mov rbx,0		; init rbx
	mov rax,0		; init rax
read:
	mov al,[rcx]	; lit un caractere
	cmp al,0		; fin de chaine  ?
	je fin			; oui => fin
	inc ebx			; inc. compteur
	inc rcx			; ajuste pointeur 
	jmp read
fin:
	mov eax,ebx
	ret				; renvoie la longueur de la chaine (dans eax)
doCharLen endp

doStrLen proc
	mov rbx,0		; init rbx
	mov rax,0		; init rax
	add rcx,8		; ajustement pour la structure en m�moire des string en C++
read:
	mov al,[rcx]	; lit un caractere
	cmp al,0		; fin de chaine  ?
	je fin			; oui => fin
	inc ebx			; inc. compteur
	inc rcx			; ajuste pointeur 
	jmp read
fin:
	mov eax,ebx
	ret				; renvoie la longueur de la chaine (dans eax)
doStrLen endp

doTab proc
	shl rdx,2 ; indice du tableau mul by 4 (4 octets par �l�ment du tableau)
	mov eax, dword ptr [rcx+rdx] ; �l�ment du tableau ==> rax
	add bool,eax ; pour v�rifier que la variable est commune � toutes les proc  (cf. proc doReadLocal) 
	ret
doTab endp

doReadLocal proc
	mov eax, bool ; = eax,dword ptr [bool]
	; equivant � :
	; 	lea rbx,bool
	;	mov eax,dword ptr [rbx]
	ret
doReadLocal endp

end