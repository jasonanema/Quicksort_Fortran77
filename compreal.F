      INTEGER*2 FUNCTION compreal(a,b)
      REAL a, b
      if(a.lt.b)then
         compreal = -1
      elseif(a.gt.b)then
         compreal = +1
      else
         compreal = 0
      endif
      END

