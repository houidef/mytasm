.386p
.model flat
public	_main
extrn _printf:PROC 
extrn LoadLibraryA:PROC 
extrn ExitProcess:PROC
extrn GetCommandLineA:PROC
extrn GetStdHandle:PROC
extrn GetModuleFileNameA:PROC

	
.data
    rvadll dd 0
	file db	"Tasm32.dll",0     
	Msg2 db	"[!] LoadLibraryA failed. Error: ",0		
	Msg3 db	"[+] Target DLL base address: 0x%p",10,0	
	Msg4 db	"[*] Calling EP at: %s",0
    var1 dd ?	
	myVar1 dd ?
	myVar2 dd ?
	myVar3 dd ?
	myVar4 dd ?
    StdHandle dd ?
	MyFileAsm dd 50 dup(0)
	MyTasm dd 50 dup(0)
	Copyright db "  Copyright (c) 1988, 2000 Inprise Corporation\r\n"
    test1 db "example.asm",0	
	test2 db "example.obj",0
    test3 db "Turbo assembler version 5.3",0		

    VMyFileAsmLocal  dd ?
	MyTasmLocal  dd ?
	MyInconnuVar  dd ?
	incparam  dd ?
	proc1  dd ?
	VirtualAloc  dd ?
	MyCfgFile  dd ?
	VIsSyntax  dd ?
	Syntax  dd ?
	MyWriteToConsole  dd ?
	MyPrintf  dd ?
	ErrorMsg  dd ?
	label1 dd ?
	label2 dd ?
	label3 dd ?
	adr1 dd ?
	proc2 dd ?
	vvar2 dd ?
	BVar1 dd ?
	BVar2 dd ?
	BVar3 dd ?
	BVar4 dd ?
	BVar5 dd ?
	BVar6 dd ?
	BVar7 dd ?
	proc3 dd ?
	proc4 dd ?
	VNbrError2 dd ?
	VNbrWarning2 dd ?
	VNewLine dd ?
	procBuild1 dd ?
	align	4
addition MACRO x,y
   mov eax, x 
   add eax,rvadll
   mov y ,eax
 endm
load MACRO x
   mov ebx, [x] 
endm
exit MACRO
	mov eax,0
	push eax
	call ExitProcess
endm
.code
;start:
;==================================================================================================
_main proc
    call LoaDLL
	call InitVar
	call mymain
@Final:
    push 0h	
    call ExitProcess
_main endp
;==================================================================================================
LoaDLL proc
    mov eax,offset file
	push eax
	call LoadLibraryA
	mov ebx,eax
	test ebx,ebx
	jne short @Librarfailed
	lea eax,dword ptr Msg2
	push eax
	call _printf
	pop ecx
	or eax,-1
	jmp short @Final
@Librarfailed:
    mov rvadll,ebx
LoaDLL endp
;==================================================================================================
InitVar proc
    push eax
	addition 2E900h,var1
	addition 2E904h,StdHandle ;2E904
	addition 2EA0Ch,MyFileAsm
	addition 2E90Ch,MyTasm
	addition 2E8F4h,myVar1
	addition 2E8F8h,myVar2
	addition 2E8FCh,myVar3
	addition 2E8FEh,myVar4
    addition 2F260h,VMyFileAsmLocal
	addition 2F264h,MyTasmLocal
	addition 2F25Ch,MyInconnuVar
	addition 2F799h,incparam
	addition 1F85Fh,proc1
	addition 1F516h,VirtualAloc
	addition 1F30Dh,MyCfgFile
	addition 2F7BAh,VIsSyntax
	addition 28C14h,Syntax
	addition 1EB2Ah,MyWriteToConsole
	addition 1EF47h,MyPrintf 
	addition 28B56h,ErrorMsg
	addition 1EA9Bh,label1
	addition 0106Bh,proc2
	addition 2F799h,adr1
	addition 2F7A2h,vvar2  
	addition 2F7AEh,BVar1
	addition 2F7BCh,BVar2
	addition 2F7B0h,VNbrError2
	addition 2F7B2h,VNbrWarning2
	addition 28962h,BVar3
	addition 28975h,BVar4
	addition 28988h,BVar5
	addition 28995h,BVar6
	addition 2F7B4h,BVar7
	addition 0117Ch,proc3
	addition 1EB10h,proc4
	;addition 1EBA1h,MyBuildingFile
	addition 28944h,VNewLine
	addition 1EBC1h,procBuild1
    pop eax	
InitVar endp
;==================================================================================================
mymain proc
	;---------
	;local @@ep1:dword
	;addition 1EFE7h,@@ep1
	;---------
	mov eax,esp
	sub eax,0C00h
	mov var1,eax
	push 0FFFFFFF5h;STD_OUTPUT_HANDLE
	call GetStdHandle
	load StdHandle
	mov  [ebx],eax
	call GetCommandLineA
	cld
	mov esi,eax
	mov al,byte ptr [esi]
	cmp al,22h
	jne LABEL_1 
	inc esi
LABEL_2:
	lodsb 
	cmp al,22h
	je LABEL_4
	cmp al,0h
	je LABEL_3
	jmp LABEL_2 
LABEL_1:
	lodsb 
	cmp al,20h
	ja LABEL_1 
LABEL_3: 
	dec esi
LABEL_4:
	mov edi,[MyFileAsm]
	
LABEL_5:
	lodsb 
	stosb 
	and al,al
	jne LABEL_5
	push 100h
	push [MyTasm]
	push 0h
	call GetModuleFileNameA
	mov eax,6h
	
	mov dword ptr [myVar1],eax
	mov dword ptr [myVar2],0h
	mov byte ptr [myVar3],2Dh
	mov byte ptr [myVar4],3Ah
	cld 
	mov eax,[MyFileAsm]
	mov ecx,[MyTasm]
	;call @@ep1
	call build 
	exit
mymain endp
;==================================================================================================
build proc
    load VMyFileAsmLocal 
	mov dword ptr [ebx],eax
	load MyTasmLocal
	mov dword ptr [ebx],ecx
	load MyInconnuVar 
	mov dword ptr [ebx],esp
	mov edi,[incparam]
	mov ecx,24h
	xor al,al
	rep stosb 
	call [proc1]
	call [VirtualAloc] 
	call [MyCfgFile]	
	jb notopen 
	load VIsSyntax
	cmp word ptr [ebx],0h
	jne Lbuild_4
	call [MyPrintf] 
	mov esi,[Syntax]
	call [MyWriteToConsole] 
	jmp Lbuild_1 
notopen :
	call [MyPrintf]  
	mov esi,[ErrorMsg] 
	exit
	jmp Lbuild_3 
sub_41F048:
	cmp al,41h
	jb fin 
	cmp al,5Ah
	ja fin 
	add al,20h
fin:
    ret
Lbuild_3:
    call [MyWriteToConsole]  ; 
     mov byte ptr [adr1],2h
Lbuild_1: 
    load MyInconnuVar
	mov esp,dword ptr [ebx]
	load vvar2
	mov eax,dword ptr [ebx]
	and eax,eax
	je Lbuild_2
	call [proc2] 
Lbuild_2:
	movzx eax,byte ptr [adr1]
	ret 
	;---------------------------------------------
Lbuild_4: ; 0x0041C12C
	call [proc3];_40117C
	call MyBuildFile ;<===== 
	load BVar1
	cmp word ptr [ebx],1h
	jbe Lbuild_1 
	load BVar2
	test byte ptr [ebx],1h
	je Lbuild_1 
	load BVar3
	mov esi,[ebx]
	load BVar1
	movzx ecx,word ptr [ebx]
	call [proc4] ;sub_41EB10h 
	mov esi,[BVar4]
	load BVar7
	movzx ecx,word ptr [ebx]
	call [proc4] 
	mov esi,[BVar5]
	load VNbrError2
	movzx ecx,word ptr [ebx]
	call [proc4]
	mov esi,[BVar6]
	load VNbrWarning2
	movzx ecx,word ptr [ebx]
	call [proc4] 
	mov esi,[VNewLine]
	call [MyWriteToConsole] 
	jmp Lbuild_1 
build endp
;==================================================================================================
MyBuildFile proc
    load vvar2
	mov edi,dword ptr [ebx]
LMyBuildFile1:
	cmp byte ptr [edi],1h
	jne LMyBuildFile2 
	mov esi,dword ptr [edi+10h]
LMyBuildFile3:
	cmp byte ptr [esi],0FFh
	je LMyBuildFile4 
	call [procBuild1] ;<==
	jae LMyBuildFile3 
LMyBuildFile2:
	ret 
LMyBuildFile4:
	inc esi
	mov edi,esi
	jmp LMyBuildFile1 
MyBuildFile endp
;==================================================================================================

end
;end start
