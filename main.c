/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: rvan-sch <rvan-sch@student.codam.n>          +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/11/08 20:26:18 by rvan-sch      #+#    #+#                 */
/*   Updated: 2020/11/08 20:28:34 by rvan-sch      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include "libasm.h"

int	main(int ac, char **av)
{
	puts("********* ft_strlen ***********");
	printf("ft: %lu, expected: %lu\n", ft_strlen(""), strlen(""));
	printf("ft: %lu, expected: %lu\n", ft_strlen("abc"), strlen("abc"));
	printf("ft: %lu, expected: %lu\n", ft_strlen("abc\0awef"), strlen("abc\0awef"));
	printf("ft: %lu, expected: %lu\n", ft_strlen("awwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"), strlen("awwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"));

	puts("********* ft_cpy ***********");
	char	a[] = "hallo hallo";
	char	b[100];
	char	z[100];
	printf("ft: |%s|, expected: |%s|\n", ft_strcpy(b,a), strcpy(z,a));
	printf("ft_strlen: %lu, expected: %lu|\n", ft_strlen(b), strlen(z));
	printf("ft: |%s|, expected: |%s|\n", ft_strcpy(b, ""), strcpy(z, ""));
	printf("ft_strlen: %lu, expected: %lu|\n", ft_strlen(b), strlen(z));

	puts("********* ft_stdup ***********");
	char	c[] = "this is a sentence";
	char	*d;
	char	*e;
	d = ft_strdup(c);
	e = strdup(c);
	printf("ft_strdup: |%s|, expected: |%s|\n", d, e);
	printf("ft_strlen: %lu, expected: %lu|\n", ft_strlen(d), strlen(e));
	d = ft_strdup("");
	e = strdup("");
	printf("ft_strdup: |%s|, expected: |%s|\n", d, e);
	printf("ft_strlen: %lu, expected: %lu|\n", ft_strlen(d), strlen(e));

	puts("********* ft_strcmp ***********");
	printf("ft_strcmp: %d, expected neg ('h' < 't')\n", ft_strcmp(a, c));
	printf("ft_strcmp: %d, expected pos ('t' > 'h')\n", ft_strcmp(c, a));
	printf("ft_strcmp: %d, expected equal\n", ft_strcmp(a, a));


	puts("********* ft_write ***********");
	char buf[1001];
	int		fd = open("test.txt", O_CREAT | O_RDWR);
	ssize_t write = ft_write(fd, "hallo", 3);
	printf("ft_write(fd, \"hallo\", 3) outputs: %zu\n", write);
	close(fd);

	puts("********* ft_read ***********");
	fd = open("main.c", O_RDONLY);
	ft_read(fd, buf, 1000);
	printf("ft_read:\n%s\n", buf);
	printf("length: %lu\n", ft_strlen(buf));
	close(fd);


	return 0;
}
	
