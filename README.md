# Quicksort_Fortran77
Implementation of an improved quicksort algorithm to replace deprecated QSORT() in Fortran 77.

This was written to assist in reviving legacy code in Fortran 77. Hopefully others will find it useful too.

Contents:

quicksort_real_F77.F
  an implementation of quicksort for arrays of real entries, read its header for details

compreal.F
  an external function for comparing real numbers

testing_quicksort_real_F77.F
  a program for testing the quicksort_real_F77.F function

Makefile
  makefile for compiling with gfortran
  
Versions:

I wrote, compiled, tested, and patched this into a larger program using:

$ gfortran --version
     GNU Fortran (GCC) 4.4.7 20120313 (Red Hat 4.4.7-23)
     Copyright (C) 2010 Free Software Foundation, Inc.

Modifications:

If you'd like to change the data types of the entries of the arrays, you'll need to modify compreal.F accordingly, and modify the data types on variables array(n), piv, and temp in quicksort_real_F77.F, and modify testing_quicksort_real_F77.F's appropriate data types too. 

You can change compreal.F to be a custom comparision function for more complicated projects too. 

See the top comments of quicksort_real_F77.F for details, references and acknowledgements. 
