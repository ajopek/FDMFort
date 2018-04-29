# Finite Differences Method

Task for Fortran university classes

### Prerequisites

 gfortran compiler

### Running

```
 make clean
 make 
```
Output in 'out' directory is 3 executables, 
	gmain4, gmain8, gmain16 denoting the real kind used in computation.
Program expects one number from standard input,
	 N - number of points in which the function values are calculated.
Program output is mean error for all the points.

### Scripts
 test.sh - Executes all 3 (4, 8, 16 kind) versions for n (3,  1000). 
	Output is redirected to files result4.data, result8.data and result16.data 
	(NOTE: This takes a while) 
 ErrorPlots - python notebook for ploting the error data 
