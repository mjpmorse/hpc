       subroutine error_check(error)
!        Adapted from Nick Maclaren at csx.cam.ac.uk 
         use mpi
         implicit none
         INTEGER :: error, length,temp
         CHARACTER(LEN = MPI_MAX_ERROR_STRING) :: message

         if (ierr .neq. MPI_SUCCESS) then
           call MPI_ERROR_STRING(error,message,length,temp)
           print *,message(1,length)
           CALL MPI_ABORT(MPI_COMMOM_WORLD,1,temp)
         end if

       end subroutine
