# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: antomart <antomart@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/10 08:35:49 by antomart          #+#    #+#              #
#    Updated: 2020/06/10 08:40:30 by antomart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BITS 64

section .text
global ft_strlen

ft_strlen:
	mov rax, 0				; rax has value 0
count:
	cmp byte[rdi + rax], 0	; if s[i] == 0 this way u move a long the stack comparing values to zero
	je finish               ; perform a jump to finish if the cmp is 0
	inc rax					; increment the value of rax by 1
	jmp count               ; jump to count satatement
finish:
	ret						; return rax value