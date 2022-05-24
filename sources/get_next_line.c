/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lunovill <lunovill@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/26 12:55:09 by lunovill          #+#    #+#             */
/*   Updated: 2022/05/24 03:03:01 by lunovill         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_line(char **line, char *s, int i)
{
	size_t	size;

	*line = ft_strsub(s, 0, i);
	i++;
	size = ft_strlen(s + i) + 1;
	ft_memmove(s, s + i, size);
	return (1);
}

static ssize_t	ft_next_line(char **line, ssize_t rd, char *buff, char **rest)
{
	ssize_t	i;

	while (rd > 0)
	{
		buff[rd] = '\0';
		if (!(*rest))
			*rest = ft_strdup(buff);
		else
			*rest = ft_strjoinf(*rest, buff, 1);
		i = ft_strichr(*rest, '\n');
		if (i != -1)
			return (ft_line(line, *rest, i));
	}
	if (*rest)
	{
		*line = ft_strdup(*rest);
		free(*rest);
		*rest = NULL;
		return (rd);
	}
	*line = ft_strdup("");
	return (rd);
}

int	get_next_line(int fd, char **line)
{
	ssize_t		i;
	ssize_t		rd;
	char		buff[BUFFER_SIZE + 1];
	static char	*rest;

	if (!line || BUFFER_SIZE < 1 || read(fd, 0, 0) == -1)
		return (-1);
	if (rest)
		i = ft_strichr(rest, '\n');
	if (rest && i != -1)
		return (ft_line(line, rest, i));
	rd = read(fd, buff, BUFFER_SIZE);
	return (ft_next_line(line, rd, buff, &rest));
}
