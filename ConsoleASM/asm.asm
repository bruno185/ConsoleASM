.data 
var1 dd 3

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
	
end