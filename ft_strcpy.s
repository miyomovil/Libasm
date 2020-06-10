# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: antomart <antomart@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/10 08:35:29 by antomart          #+#    #+#              #
#    Updated: 2020/06/10 08:40:34 by antomart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


BITS 64

section .text
global ft_strcpy

ft_strcpy:      
    mov rax, 0                  ; rdi will be dest and rsi will be src
loop:
    mov cl, byte[rsi + rax]     ; cl will store our src[i] data
    cmp cl, 0                   ; if src[i] == 0 and means that the src string ends
    je finish                   ; jump to finish condition
    mov byte[rdi + rax], cl     ; copy src[i] on dst[i] 
    inc rax                     ; i++
    jmp loop                    ; start over again
finish:
    mov byte[rdi + rax], 0      ; \0 to end the dst string
    mov rax, rdi                ; returns a pointer to destination string (dest)
    ret