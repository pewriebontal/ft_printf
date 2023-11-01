# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mkhaing <0x@bontal.net>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/21 21:05:35 by mkhaing           #+#    #+#              #
#    Updated: 2023/11/01 17:02:08 by mkhaing          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS	= ft_printf.c ft_printf_utils.c ft_printf_utils_1.c
OBJS	= ${SRCS:.c=.o}

LIBFT_PATH		=	./libft
LIBFT			=	$(LIBFT_PATH)/libft.a

NAME	=  libftprintf.a

CC		= gcc
CFLAGS	= -Wall -Wextra -Werror

RM		= rm -f

all: $(NAME)

$(LIBFT):
	make -C $(LIBFT_PATH) all

$(NAME): $(LIBFT) $(OBJS)
	cp	$(LIBFT) $(NAME)
	ar rc ${NAME} ${OBJS}

clean:
	${RM} ${OBJS}
	make -C $(LIBFT_PATH) clean

fclean: clean
	${RM} ${NAME}
	${RM} libft.a
	make -C $(LIBFT_PATH) fclean

re: fclean all

.PHONY: all clean fclean re
