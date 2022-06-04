# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lunovill <lunovill@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 22:18:12 by lunovill          #+#    #+#              #
#    Updated: 2022/05/21 05:28:26 by lunovill         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

 #=============================================================================#
#									SOURCES										#
 #=============================================================================#

PRINTF_DIR = ft_printf
SRCS_DIR = sources
SRC_FILES =  ft_abs\
		ft_atoi\
		ft_atoui\
		ft_bzero\
		ft_calloc\
		ft_count_if\
		ft_display_file\
		ft_foreach\
		ft_ftab\
		ft_isalnum\
		ft_isalpha\
		ft_isascii\
		ft_isdigit\
		ft_isprint\
		ft_isset\
		ft_itoa\
		ft_memalloc\
		ft_memccpy\
		ft_memchr\
		ft_memcmp\
		ft_memcpy\
		ft_memdel\
		ft_memmove\
		ft_memset\
		ft_putchar\
		ft_putchar_fd\
		ft_putnbr\
		ft_putnbr_fd\
		ft_putstr\
		ft_putstr_fd\
		ft_putsub\
		ft_putunbr\
		ft_putunbr_fd\
		ft_realloc\
		ft_split\
		ft_strcat\
		ft_strchr\
		ft_strclr\
		ft_strcmp\
		ft_strcpy\
		ft_strdup\
		ft_strequ\
		ft_strichr\
		ft_strirchr\
		ft_strischr\
		ft_striter\
		ft_striteri\
		ft_strjoin\
		ft_strjoinf\
		ft_strlcat\
		ft_strlcpy\
		ft_strlen\
		ft_strmap\
		ft_strmapi\
		ft_strncat\
		ft_strncmp\
		ft_strncpy\
		ft_strnequ\
		ft_strnew\
		ft_strnstr\
		ft_strrchr\
		ft_strstr\
		ft_strsub\
		ft_strtrim\
		ft_tolower\
		ft_toupper\
		ft_uitoa\
		ft_xtoa\
		get_next_line\
		$(PRINTF_DIR)/fg_check\
		$(PRINTF_DIR)/fg_fldzr\
		$(PRINTF_DIR)/fg_hyphen\
		$(PRINTF_DIR)/fg_period\
		$(PRINTF_DIR)/ft_atrkornb\
		$(PRINTF_DIR)/ft_conv\
		$(PRINTF_DIR)/ft_convc\
		$(PRINTF_DIR)/ft_convi\
		$(PRINTF_DIR)/ft_convn\
		$(PRINTF_DIR)/ft_convp\
		$(PRINTF_DIR)/ft_convs\
		$(PRINTF_DIR)/ft_field\
		$(PRINTF_DIR)/ft_zero\
		$(PRINTF_DIR)/ft_printf\

SRCS = $(addsuffix .c, $(SRC_FILES))

 #=============================================================================#
#									OBJETS										#
 #=============================================================================#

OBJS_DIR = objs
OBJS = $(SRCS:%.c=$(OBJS_DIR)/%.o)

 #=============================================================================#
#									COMPILATION									#
 #=============================================================================#

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g3
CIFLAGS = -Iincludes

 #=============================================================================#
#									MAKEFILE									#
 #=============================================================================#

NAME = libft.a

all: $(NAME)

$(NAME): $(OBJS_DIR) $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJS_DIR) :
	mkdir $(OBJS_DIR)
	mkdir $(OBJS_DIR)/$(PRINTF_DIR)

$(OBJS) : $(OBJS_DIR)/%.o : $(SRCS_DIR)/%.c
	$(CC) $(CFLAGS) $(CIFLAGS) -c $< -o $@

# %.o : %.c
#	$(CC) $(CFLAGS) $(CIFLAGS) -c $(SRCS_DIR)$< -o $(OBJS_DIR)$@

clean :
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -rf $(NAME)
re : fclean all

.PHONY: clean fclean all re
