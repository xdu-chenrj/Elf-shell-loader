;AT&T语法
;%macro pushx 1-*
; %rep %0
;   push %1
;   %rotate 1
; %endrep
;%endmacro

;%macro popx 1-*
;  %rep %0
;    %rotate -1
;    pop %1
;  %endrep
;%endmacro

;section .text
.text

;global	entry_loader:function
;global	loader_size:data
;global	infos_size:data

global	entry_loader
global	loader_size
global	infos_size

;loader_size	dq	end - entry_loader
;infos_size	dq	end - info_start

loader_size
infos_size

entry_loader:
	;;pushfq
	;;pushx	rax, rdi, rsi, rsp, rdx, rcx

    ;write(1, message, 13)
    ;mov $1, %rax # system call 1 is write
    ;mov $1, %rdi # file handle 1 is stdout
    ;mov $message, %rsi # address of string to output
    ;mov $13, %rdx # number of bytes
    ;syscall

    ;printf
	;;mov	rdi, 1
	;lea Load Effective Address，
	;装入有效地址的意思，操作数就是地址；
    ;常见的几种用法：
    ;lea eax，[addr]

	;;lea	rsi, [rel msg]
	;;mov	rdx, msg_len
	;;mov	rax, rdi
	;;syscall

	;printf

	;;jmp	start_unpacking

;;msg	db	"[Unpacking...]", 10, 0
;;msg_len	equ	$ - msg

;;start_unpacking:
    ;RAX、RBX、RCX、RDX 通用寄存器
	;;mov	rax, [rel info_addr]
	;;mov	rcx, [rel info_size]
	;;mov	rdx, [rel info_key]
	;;add	rcx, rax

;循环
;dl
;;.loop	xor	byte [rax], dl
	;key
	;;ror	rdx, 8
	;rax + 1
	;;inc	rax
	;rax - rcx
	;;cmp	rax, rcx
	;;jnz	.loop
	;;popx	rax, rdi, rsi, rsp, rdx, rcx
	;;popfq
	;;jmp	0xFFFFFFFF

;info_start: dd 0x99999999
info_start

;dq 字节
;info_key:	dq	0x9999999999999990
;info_addr:	dq	0xAAAAAAAAAAAAAABB
;info_size:	dq	0xBBBBBBBBBBBBBBCC

info_key
info_addr
info_size

;end: dd 0x99999999
end