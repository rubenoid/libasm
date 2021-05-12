global	_ft_strlen				; int	ft_strlen(char *str_rdi)

_ft_strlen:
    xor 	rax, rax			; init return value to 0, xor is faster then mov rax,0

.compare:
	cmp		byte[rdi + rax], 0	; position is rdi + rax, dereference and look at first byte
	je		.return				; if zero, return
	inc		rax					; rax++
	jmp		.compare			; loop

.return:
	ret							; return rax
