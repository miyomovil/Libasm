# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: antomart <antomart@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/10 08:35:59 by antomart          #+#    #+#              #
#    Updated: 2020/06/10 08:40:24 by antomart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #



BITS 64

extern __errno_location
section .text
global ft_write

ft_write:
    mov rax, 1  ; calling write function
        syscall ; calling for print
    cmp rax, 0  ; comparing the value of rax with 0
    jl  _error  ; if condition is met (less than 0) we jump to _error
        ret
 
_error:
    neg rax                 ; turn to absolute value of rax
    mov rdi,rax             ; rdi now has rax value
    call __errno_location   ; errno location will be stored on rdi (source of next statement) and it will the memory adress of the errno variable
    mov [rax], rdi          ; rdi will store the errno_location value in the memory location thtat rax points
    mov rax, -1             ; return value of -1 to return the same value as c write function
    ret