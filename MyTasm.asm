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
	BVar8 dd ?
	BVar9 dd ?
	BVar10 dd ?
	BVar11 dd ?
	BVar12 dd ?
	BVar13 dd ?
	BVar14 dd ?
	BVar15 dd ?	
	BVar16 dd ?
	BVar17 dd ?
	BVar18 dd ?
	BVar19 dd ?
	BVar20 dd ?
	BVar21 dd ?
	BVar22 dd ?
	BVar23 dd ?
	BVar24 dd ?
	BVar25 dd ?
	BVar26 dd ?
	VNbrError2 dd ?
	VNbrWarning2 dd ?
	VNewLine dd ?
	VNbrError dd ?
	VNbrWarning dd ?
	MyPrintMsg dd ?
	proc3 dd ?
	proc4 dd ?
	proc5 dd ?
	proc6 dd ?
	proc7 dd ?
	proc8 dd ?
	proc9 dd ?
	proc10 dd ?
	proc11 dd ?
	proc12 dd ?
	proc13 dd ?
	proc14 dd ?
	proc15 dd ?
	MyFileAsm2 dd ?
	MyFileObj dd ?
	VNbrPassed2 dd ?
	VNbrPassed1 dd ?
    MyFileName dd ?
	MyCreateObjFile dd ?
	VTurboVarsion dd ?
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

	addition 2F28Eh,VNbrError
	addition 2F290h,VNbrWarning
	addition 2F7B6h,BVar10
	addition 2F79Ch,BVar11
	addition 1EA48h,proc6
	addition 1EF1Dh,proc5
	addition 1EED8h,proc7
	addition 1EEE6h,proc8
	addition 1EF06h,proc9
	addition 2F299h,MyFileAsm2
	addition 2F499h,BVar8
	addition 2F599h,BVar9
	addition 2F399h,MyFileObj
	addition 2A7B4h,BVar22
	addition 2A7C8h,BVar23
	addition 2A7B6h,VNbrPassed2
	addition 2F292h,VNbrPassed1
	addition 2A7B8h,BVar24
	addition 2A7C4h,BVar25
	addition 2A7C2h,BVar26
	addition 288C8h,VTurboVarsion
	addition 1EA55h,proc10
	addition 2F79Bh,BVar12
	addition 2A7B5h,BVar13
	addition 28927h,BVar16
	addition 2F275h,BVar17
	addition 2F294h,BVar18
	addition 2F296h,BVar19
	addition 289E9h,BVar20
	addition 2F276h,BVar21
	addition 42EC5Ch,BVar14
	addition 2F295h,BVar15
	addition 1EE13h,MyPrintMsg
    addition 1EA6Fh,proc11
	addition 1EA7Ch,proc12
	addition 2F699h,MyFileName
	addition 1EA62h,MyCreateObjFile
	addition 099E3h,proc12
	addition 0100Dh,proc13
	addition 1E9A8h,proc14
	
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
procBuild1 proc
	push edi
	push edi
	push esi
	xor eax,eax
	load VNbrError
	mov word ptr [ebx],ax
	load VNbrWarning
	mov word ptr [ebx],ax
	mov eax,[MyFileAsm2]
	load BVar10
	mov dword ptr [ebx],eax
	load BVar11
	mov byte ptr [ebx],0h
	load BVar2
	and byte ptr [ebx],0FDh
	call [proc6]
	jae LprocBuild1 
	pop esi
	pop edi
	push esi
	call [proc5]
	stc 
	jmp LprocBuild2 
LprocBuild1:
	pop esi
	mov edi,[MyFileAsm2]
	call [proc7] 
	mov edi,[MyFileObj]
	call [proc7]  
	mov edi,[BVar8]
	call [proc7] 
	mov edi,[BVar9]
	call [proc7] 
	push esi
	mov esi,[MyFileAsm2]
	call [proc8]
	mov edi,[MyFileName]
	call [proc7] 
	mov esi,[MyFileName]
	call [proc9]
	mov byte ptr [esi],0h
	pop esi
	pop edi
	push esi
	mov ax,word ptr [edi+1h]
	load BVar22
	mov word ptr [ebx],ax
	mov al,byte ptr [edi+3h]
	load BVar23
	mov byte ptr [ebx],al
	mov ax,word ptr [edi+4h]
	load VNbrPassed2
	mov word ptr [ebx],ax
	load VNbrPassed1
	mov word ptr [ebx],ax
	mov ax,word ptr [edi+6h]
	load BVar24
	mov word ptr [ebx],ax
	mov ebx,dword ptr [edi+8h]
	push ebx
	load BVar25
	mov word ptr [ebx],64h
	load BVar26
	mov word ptr [ebx],0FFFFh
	load VTurboVarsion
	mov edi,[ebx]
    pop ebx	
	mov ax,503h
	call [proc10]
	load BVar12
	mov byte ptr [ebx],1h
	;===================
	jae LprocBuild3 
	call [proc5] 
	stc 
	jmp LprocBuild4 
LprocBuild3:
    load BVar13
	test byte ptr [ebx],2h
	jne LprocBuild12 
	call [MyPrintf]
LprocBuild12:
	pop esi
	pop edi
	push edi
	push esi
	lea esi,dword ptr [edi+14h]
LprocBuild11:
	cmp esi,dword ptr [edi+10h]
	;=============================
	jae LprocBuild10 
	push edi
	lodsb 
	push eax
	mov edi,[BVar14] 
	mov edx,edi
	exit
	call [proc7]  
	pop eax
	push esi
	cmp al,1h
	je LprocBuild13 
	mov byte ptr [BVar15],49h
	call [proc11] 
	jmp LprocBuild14 
LprocBuild13:
	mov byte ptr [BVar15],44h
	mov edi,edx
	call [proc12]
LprocBuild14:
    ;exit
	pop esi
	pop edi
	jae LprocBuild11 
	call [MyPrintMsg]
	mov esi,[BVar16]
	call [MyWriteToConsole] 
	mov al,byte ptr [BVar17]
	mov byte ptr [BVar18],al
	mov byte ptr [BVar19],0h
	mov esi,BVar18
	call MyWriteToConsole 
	mov esi,[BVar8]
	call MyWriteToConsole 
	mov esi,BVar20
	call [MyWriteToConsole] 
	call [proc5] 
	mov esi,[VNewLine]
	call [MyWriteToConsole] 
	stc 
	jmp LprocBuild4
LprocBuild10:
	mov byte ptr [BVar21],0h
	mov ebx,[MyFileAsm2]
	mov edx,[MyFileObj]
	mov esi,[BVar8]
	mov edi,[BVar9]
	cmp byte ptr [esi],0h
	;=========================================
	jne LprocBuild8 
	mov byte ptr [edi],0h
LprocBuild8:
	mov ecx,[MyFileName]
	call [MyCreateObjFile] ;<==
	exit
	jae LprocBuild9 
	mov byte ptr [BVar21],1h
LprocBuild9:
	call MyPrintMsg
	cmp byte ptr [BVar21],1h
	jne LprocBuild7 
	call [MyPrintf]   
	call [proc5] 
	inc word ptr [BVar7]
LprocBuild7:
	test byte ptr [BVar2],2h
	je LprocBuild6 
	mov esi,[VNewLine]
	call [MyWriteToConsole]
LprocBuild6:
	inc word ptr [BVar1]
	mov ax,word ptr [VNbrError]
	add word ptr [VNbrError2],ax
	mov ax,word ptr [VNbrWarning]
	add word ptr [VNbrWarning2],ax
	clc 
LprocBuild4:
	pushfd 
	exit
	call [proc13]
	mov byte ptr [BVar12],0h
	call [proc14]
	cmp byte ptr [BVar11],1h
	jne LprocBuild5 
	mov edx,MyFileObj
	call [proc14]
LprocBuild5:
	popfd 
LprocBuild2:
	pop esi
	pop edi
	mov dword ptr [[BVar10]],0h
endp
end
;end start
