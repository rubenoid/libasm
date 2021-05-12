; **************************************************************************** #
;                                                                              #
;                                                         ::::::::             #
;    ft_strcpy.s                                        :+:    :+:             #
;                                                      +:+                     #
;    By: rvan-sch <rvan-sch@student.codam.n>          +#+                      #
;                                                    +#+                       #
;    Created: 2020/11/08 15:38:16 by rvan-sch      #+#    #+#                  #
;    Updated: 2020/11/08 15:38:17 by rvan-sch      ########   odam.nl          #
;                                                                              #
; **************************************************************************** #

global _ft_strcpy				; char *ft_strcpy(char *dest_rdi, char *src_rsi)

_ft_strcpy:
	cmp		rdi, 0				; check for empty string
	je		.error
	cmp		rsi, 0
	je		.error
	xor     rax, rax         	; set rax to 0
	xor		rcx, rcx			; set counter to 0

.copy:
	mov		dl, byte[rsi + rcx] ; can't do mov byte[rdi+rcx], byte[rsi+rcx], first store in a 8bit reg
	mov		byte[rdi + rcx], dl	; copy to dest
	cmp		dl, 0				; check for end;
	je		.return
	inc		rcx
	jmp		.copy

.error:
	xor     rax, rax         	; set rax to 0
	ret

.return:
    mov     rax, rdi            ; set the return pointer to the dest pointer
	ret							; return rax
