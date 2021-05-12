; **************************************************************************** #
;                                                                              #
;                                                         ::::::::             #
;    ft_strcmp.s                                        :+:    :+:             #
;                                                      +:+                     #
;    By: rvan-sch <rvan-sch@student.codam.n>          +#+                      #
;                                                    +#+                       #
;    Created: 2020/11/08 18:43:15 by rvan-sch      #+#    #+#                  #
;    Updated: 2020/11/08 18:43:15 by rvan-sch      ########   odam.nl          #
;                                                                              #
; **************************************************************************** #

global	_ft_strcmp				; int	ft_strcmp(const char *s1_rdi, const char *s2_rsi)

_ft_strcmp:
		xor		rax, rax
		mov		rcx, -1					; -1 so that the compare loop can start with incr. 

.compare:
		inc		rcx
		mov		dl, byte[rdi + rcx]
		cmp		dl, 0					; check for end string
		je		.return_value
		cmp		byte[rsi + rcx], 0		; check for end string
		je		.return_value
		cmp		dl, byte[rsi + rcx]		; compare chars
		je		.compare

.return_value:
		cmp		dl, byte[rsi + rcx]		; compare chars
		ja		.return_pos				; *s1 > *s2
		jb		.return_neg				; *s1 < *s2
		mov		rax, 0
		ret

.return_pos:
		mov		rax, 1
		ret

.return_neg:
		mov		rax, -1
		ret
