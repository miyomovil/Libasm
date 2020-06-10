# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: antomart <antomart@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/10 08:35:18 by antomart          #+#    #+#              #
#    Updated: 2020/06/10 08:40:37 by antomart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64

section .text
	global ft_strcmp

ft_strcmp:
    mov rax, 0
retry:
    mov cl, byte[rsi + rax]     ; store de chars on 8 bits registers
    mov dl, byte[rdi + rax]     ; chars are usually encoded on 8 bits registers
    cmp byte[rsi + rax], 0      ; if bh value is 0
    je end_loop                 ; jump to end_loop condition
    cmp byte[rdi + rax], 0      ; if ch value is 0
    je end_loop                 ; jump to end_loop condition
    cmp cl, dl                  ; if s1[i] != s2[i] establish diferences between ch and bl
    jne end_loop                ; if the conidtion is met we jump to end loop
    jl up                       ; will jump to finish if the result is diferent above 0
    jg down                     ; will jump to finish if the result is below 0
    inc rax                     ; increment value of rax by 1
    jmp retry                   ; start over again
end_loop:
    movzx rax, cl               ;store cl on a wider registry
    movzx rdx, dl               ;store dl on a wider registry 
    cmp rax,rdx                 ;compare both registry
    je same                     ; will jump to same if the diference is 0
    jl up                       ; will jump to finish if the result is diferent above 0
    jg down                     ; will jump to finish if the result is below 0
same:
	mov rax, 0
	ret
up:
	mov rax, 1
	ret

down:
	mov rax, -1
	ret