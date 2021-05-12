/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: rvan-sch <rvan-sch@student.codam.n>          +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/11/08 20:26:34 by rvan-sch      #+#    #+#                 */
/*   Updated: 2020/11/08 20:26:50 by rvan-sch      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef	LIBASM_H
# define	LIBASM_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

unsigned long	ft_strlen(char *str);
char			*ft_strcpy(char *dst, char *src);
int				ft_strcmp(char *s1, char *s2);
ssize_t			ft_write(int fd, char *buff, size_t count);
ssize_t			ft_read(int fd, char *buff, size_t count);
char			*ft_strdup(const char *str);

#endif
