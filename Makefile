NAME = libasm.a

SRCS = ft_write.s \
	   ft_read.s \
	   ft_strlen.s \
	   ft_strcmp.s \
	   ft_strcpy.s \
	   ft_strdup.s

OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): ${OBJS}
	@ar -rcs ${NAME} ${OBJS}

%.o: %.s
	nasm -f elf64 -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: all
	@clang main.c -L. -lasm -o test $(NAME) 
	@./test
	@rm test

.PHONY: all re clean fclean test
