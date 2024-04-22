.global _start
_start:
  ldr x0,=5 // n
  mov x1,#0 // i
  mov x2,#0 // sum
  b loop
  mov x3,x2 // x3=sum
  b end
  
loop:
  cmp x1,x0
  bgt exit
  adds x2,x2,x1 // sum+=i
  adds x1,x1,#1 // i++
  b loop  
exit:

end:

//def i = 0;
//def sum = 0;
//def n = 5;

//for(i=0; i<n;i++):
	//sum += i;
