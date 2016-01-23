#include <stdio.h>

/* 判断一个数是否是2的次幂 */
void main()
{
	int i =1000;
	char *c = (i&(i-1))?"false":"true";
	printf("%d 是2的次幂吗？ %s\n", i,c);
}
