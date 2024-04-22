.global _start
_start:
  ldr x0,=3 //n
  mov x1,#1 // i
  mov x2,#1 // factorial
  b loop
  mov x3,x2 // x3 = factorial
  b end  
loop:
  cmp x1,x0
  bgt exit
  MUL x2,x2,x1 // factorial = factorial*i
  adds x1,x1,#1 // i++
  b loop

exit:


//def n = 3;
//def i = 0;
//def factorial = 1;

//for(i=1;i<=n;i++):
	//factorial = factorial*i;
//def x3 = factorial