#include "stdio.h"

#define max(x,y) ({\
	    typeof(x) _x = (x);\
	    typeof(y) _y = (y);\ 
	    (void) (&_x == &_y);\
	    _x > _y ? _x : _y; })
					
/* 如果有运算式，防止出现运算2次的情况 */
/* 通过typeof获得x和y的数据类型，然后定义两个临时变量，并把x和y的值分别赋给这两个临时变量，最后进行比较。*/
/* 类型不一致时，让编译器主动报编译错误提醒 。*/
/* 如果_x和_y的类型不一样，其指针类型也会不一样，2个不一样的指针类型进行比较操作，会抛出一个编译警告 */

#define max_1(x,y)   x>y?x:y
#define max_2(x,y)  ( (x)>(y)?(x):(y) )
#define max_3(x,y) ({\
	    typeof(x) _x = (x);\
	    typeof(y) _y = (y);\ 
	    _x > _y ? _x : _y; })


int main(void)
{
	int a = 0;
	int b = 0;
	float c = 0.5;
	int result = 0;

/************** max_1 **************************/
	result = 4*max_1(2,3);
	printf("4*max_1(2,3) = %d\n", result ); /* 4*2>3?2:3 -> 8>3?2:3  */

	result = 4*max(2,3);		
	printf("4*max(2,3) = %d\n", result );   

/************** max_2 **************************/
	a = 3;
	b = 3;
	result = max_2(++a, ++b);
	printf("max_2(++a, ++b)= %d\na=%d, b=%d\n", result, a, b );/* 5,4,5 */
	
	a = 3;
	b = 3;
	result = max(++a, ++b);
	printf("max(++a,++b) = %d\na=%d, b=%d\n", result, a, b ); /* 4,4,4 */
	
/************** max_3 **************************/
	max_3(a,c);/* 编译时不检测a,c的类型 */
	max(a,c);  /* 编译时检测a,c的类型 */

	return 0;
}
