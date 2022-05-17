/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isset.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lunovill <lunovill@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 16:31:55 by lunovill          #+#    #+#             */
/*   Updated: 2021/04/04 20:38:48 by lunovill         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isset(int c, const char *set)
{
	while (*set && *set != c)
		set++;
	if (*set == '\0')
		return (0);
	return (1);
}
