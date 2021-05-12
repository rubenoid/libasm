# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rvan-sch <rvan-sch@student.codam.n>          +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/08 20:09:16 by rvan-sch      #+#    #+#                  #
#    Updated: 2020/11/08 20:32:45 by rvan-sch      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s ft_strcmp.s ft_read.s ft_strdup.s ft_write.s ft_strcpy.s
CC = gcc
CFLAGS = -I. -Wall -Werror -Wextra
NAME = libasm.a

OBJ := $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)

%.o: %.s
	nasm -f macho64 $< -o $@

clean:
	-rm -f $(OBJ)

fclean: clean
	-rm -f $(NAME)
	-rm -f a.out test.txt
	-rm -rf a.out.dSYM

re: fclean all

test: $(NAME)
	make re
	$(CC) -g -L. -lasm main.c
	./a.out

.PHONY: clean fclean re all test
