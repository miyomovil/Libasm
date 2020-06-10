# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: antomart <antomart@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/10 08:35:38 by antomart          #+#    #+#              #
#    Updated: 2020/06/10 08:40:32 by antomart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


BITS 64

global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

section .text
ft_strdup:
    push rdi            ; the first argument goes to the stack
    call ft_strlen      ; we call to the function previously made
    inc rax             ; rax has now ft_strlen +1 for \O
    mov rdi, rax        ; rdi has now ft_strlen value
    call malloc         ; we call for malloc to allocate memory
    pop rdi             ; first argument is now string (the top of the stack value that was stored previoysly)
    mov rsi, rdi        ; second argument is the same string as the first
    mov rdi, rax        ; the first argument is a pointer where begin the allocate string
    call ft_strcpy      ; copy rdi in new allocated string
    ret