.global _start
_start:
  ldr x0,=10 // n'th fibonacci 
  mov x1,#1 // b
  mov x2,#0 // a
  mov x3,#2 // i
  b loop
  b exit
loop:
  cmp x3,x0
  bgt exit
  adds x5,x1,x2 // c = a + b
  mov x2,x1 // a = b
  mov x1,x5 // b = c
  adds x3,x3,#1 
  b loop
exit:
	str x9,[x5] // x9 = x5

//def a = 1;
//def b = 2;
//def i = 2;
//def n = 10;

//for(i=2;i<n;i++):
	//int c = a + b;
	//a = b;
	//b = a;
//x9 = c  but c will not disappear as a local var 
