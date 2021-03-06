!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright 2010.  Los Alamos National Security, LLC. This material was    !
! produced under U.S. Government contract DE-AC52-06NA25396 for Los Alamos !
! National Laboratory (LANL), which is operated by Los Alamos National     !
! Security, LLC for the U.S. Department of Energy. The U.S. Government has !
! rights to use, reproduce, and distribute this software.  NEITHER THE     !
! GOVERNMENT NOR LOS ALAMOS NATIONAL SECURITY, LLC MAKES ANY WARRANTY,     !
! EXPRESS OR IMPLIED, OR ASSUMES ANY LIABILITY FOR THE USE OF THIS         !
! SOFTWARE.  If software is modified to produce derivative works, such     !
! modified software should be clearly marked, so as not to confuse it      !
! with the version available from LANL.                                    !
!                                                                          !
! Additionally, this program is free software; you can redistribute it     !
! and/or modify it under the terms of the GNU General Public License as    !
! published by the Free Software Foundation; version 2.0 of the License.   !
! Accordingly, this program is distributed in the hope that it will be     !
! useful, but WITHOUT ANY WARRANTY; without even the implied warranty of   !
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General !
! Public License for more details.                                         !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SUBROUTINE AVEPRESS

  USE CONSTANTS_MOD
  USE SETUPARRAY
  USE MDARRAY
  USE VIRIALARRAY
  USE MYPRECISION

  IMPLICIT NONE

  INTEGER :: I

  CALL GETPRESSURE

  IF (NPTTYPE .EQ. "ISO") THEN
     
     DO I = 1, AVEPER - 1
        
        PHIST(I) = PHIST(I + 1)
        
     ENDDO

     PHIST(AVEPER) = PRESSURE

  ELSE

     DO I = 1, AVEPER - 1
        
        PHISTX(I) = PHISTX(I + 1)
        PHISTY(I) = PHISTY(I + 1)
        PHISTZ(I) = PHISTZ(I + 1)
        
     ENDDO

     PHISTX(AVEPER) = STRTEN(1)
     PHISTY(AVEPER) = STRTEN(2)
     PHISTZ(AVEPER) = STRTEN(3)

  ENDIF

  RETURN
  
END SUBROUTINE AVEPRESS
