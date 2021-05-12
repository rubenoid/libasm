; **************************************************************************** #
;                                                                              #
;                                                         ::::::::             #
;    ft_read.s                                          :+:    :+:             #
;                                                      +:+                     #
;    By: rvan-sch <rvan-sch@student.codam.n>          +#+                      #
;                                                    +#+                       #
;    Created: 2020/11/08 19:06:50 by rvan-sch      #+#    #+#                  #
;    Updated: 2020/11/08 19:06:50 by rvan-sch      ########   odam.nl          #
;                                                                              #
; **************************************************************************** #

global _ft_read			; ssize_t ft_read(int fd_rdi, const void *buf_rsi, size_t nbyte_rdx)
extern ___error

_ft_read:
		mov		rax, 0x2000003		; syscall for read on MacOS
		syscall
		jc		.return
		ret

.return:
		push	rax				; save return value for later
		call	___error		; retrieve the error code
		mov		rdi, rax		; point rdi to errno
		pop		rax				; retrieve previous value of rax
		mov		[rdi], rax		; value is now in the mem of errno
		mov		rax, -1			; our read now returns -1 just like the original function
		ret
