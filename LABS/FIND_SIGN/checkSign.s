.global _start
_start:
	mov x0, #3
	cmp x0,#0
	bge positive
	mov x2,#-1
	b exit

positive:
	mov x1,#1
	b exit

exit:
	mov x8, #93
  	mov x0, #0 
  	SVC #0


//def x0 = 3
//if(x0>=0) x1=1
//else x2=-1