C  Below is code for testing quicksort_real_F77.F
C  June 2019, Jason Allen Anema, Ph.D.
C 
      program testing_quicksort_real_F77
      INTEGER len, j, workin, c0, c1, c2, c3, t0, t1, t2, t3
      REAL seed
      PARAMETER (len = 23123123)
      REAL test(len)
C       len: length of the array to be generated and sorted
C       j: an index
C       c0,c1,c2,c3,t0,t1,t2,t3: counters
C       seed: seed for the 'random' number generator whose output is
C             a real in [0,1). seed should be a large, odd, integer.
C       test: the array to be generated and sorted
C
C
C  Patching in the compare function, compreal(*,*).
      EXTERNAL compreal
      INTEGER*2 compreal
C
      workin = 1
      seed = 4598787
      c0 = 0
      c1 = 0
      c2 = 0
      c3 = 0
      t0 = 0
      t1 = 0
      t2 = 0
      t3 = 0
C  If you'd like to have an array of 'random' entries in [0,1)
C    populate the array with this block of code, and comment out the
C    next DO loop and comment out the appropriate sections below too.
C
C      DO 16 j = 1, len
C         call random_number(seed)
C         test(j) = (seed)
C 16     CONTINUE
C
C
C Populating the array with 'random' entries of 0.0, 1.0, 2.0, and 3.0.
      DO 18 j = 1, len
         call random_number(seed)
         if(4*seed.gt.3.0)then
            test(j) = 0.0
            c0 = c0+1
         elseif(4*seed.gt.2.0)then
            test(j) = 1.0
            c1 = c1 + 1
         elseif(4*seed.gt.1.0)then
            test(j) = 2.0
            c2 = c2+1
         else
            test(j) = 3.0
            c3 = c3 + 1
         endif
 18   CONTINUE
C
      print *, 'An array of length ', len, ' has been generated.'
C
C  Sorting the array:
      call quicksort_real_F77(test, len, compreal)
C  Checking it is sorted correctly
      do 17 j = 1, len-1
          if(compreal(test(j), test(j+1)).eq.1)then
            print *, 'Sorting failure between position: ', j , 'and
     &        position', j+1
            workin = workin*0
         endif
 17    continue
C Make sure the number of entries of 0.0, ..., 3.0 have remained
C  constant.
      do 54 j = 1, len
         if(test(j).eq.0)then
            t0=t0+1
         elseif(test(j).eq.1)then
            t1=t1+1
         elseif(test(j).eq.2)then
            t2=t2+1
         elseif(test(j).eq.3)then
            t3=t3+1
         else
            print *, 'invalid entry of:', test(j), 'at position', j
         endif
 54   continue
C
      print *, 'Presorted numbers of 0,1,2,and 3s are:', c0,c1,c2,c3
      print *, 'After sorting there are:', t0,t1,t2,t3
C
      if (workin.eq.1)then
        if((c0.eq.t0).and.(c1.eq.t1).and.(c2.eq.t2).and.(c3.eq.t3))then 
          print *, 'This is sorting correctly too!'
        else
          print *, 'Though elements of the output array are not out of
     &              order, the number of 0, 1, 2, or 3s has been
     &              altered!'
        endif
      else
         print *, 'Too bad, it is not working. Then elements are out
     &              of order!'
      endif
      END program testing_quicksort_real_F77
