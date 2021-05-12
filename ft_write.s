; **************************************************************************** #
;                                                                              #
;                                                         ::::::::             #
;    ft_write.s                                         :+:    :+:             #
;                                                      +:+                     #
;    By: rvan-sch <rvan-sch@student.codam.n>          +#+                      #
;                                                    +#+                       #
;    Created: 2020/11/08 19:06:28 by rvan-sch      #+#    #+#                  #
;    Updated: 2020/11/08 19:06:28 by rvan-sch      ########   odam.nl          #
;                                                                              #
; **************************************************************************** #

global _ft_write			; ssize_t ft_write(int fd_rdi, const void *buf_rsi, size_t nbyte_rdx)
extern ___error

_ft_write:
		mov		rax, 0x2000004	; system call for write on MacOS
		syscall					; do the system call
		jc		.error			; if an error happened, the carry flag is set
		ret
	
.error:
		push	rax				; save return value for later
		call	___error		; retrieve the error code
		mov		rdi, rax		; point rdi to errno
		pop		rax				; retrieve previous value of rax
		mov		[rdi], rax		; value is now in the mem of errno
		mov		rax, -1			; our write now returns -1 just like the original function
		ret
