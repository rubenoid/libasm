; **************************************************************************** #
;                                                                              #
;                                                         ::::::::             #
;    ft_strdup.s                                        :+:    :+:             #
;                                                      +:+                     #
;    By: rvan-sch <rvan-sch@student.codam.n>          +#+                      #
;                                                    +#+                       #
;    Created: 2020/11/08 18:43:47 by rvan-sch      #+#    #+#                  #
;    Updated: 2020/11/08 18:43:47 by rvan-sch      ########   odam.nl          #
;                                                                              #
; **************************************************************************** #

global	_ft_strdup			; char	*ft_strdup(const char *src_rdi)
extern	_ft_strcpy			; char	*ft_stcpy(char *dest_rdi, char *src_rsi)
extern	_ft_strlen			; int	ft_strlen(char *str_rdi);
extern	_malloc

_ft_strdup:
	call	_ft_strlen		; get string length
	inc		rax				; add one for \0 character
	push	rdi				; put rdi on stack so we can use rdi for malloc
	mov		rdi, rax		; length of string is now in rdi, first arg for malloc
	call	_malloc			; malloc string (rax)
	cmp		rax, 0			; check if failed
	je		.error			; if 0, malloc failed and jump to error
	pop		rsi				; string is now saved in rsi, 2nd arg for strcpy
	mov		rdi, rax		; set the malloced string to rdi, 1st arg for strcpy
	call	_ft_strcpy		; strcpy returns in rax
	ret

.error:
	xor		rax, rax		; set rax to 0
	ret
