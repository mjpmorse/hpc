!      module errormod
!      use mpi
!      implicit none

!     include

       subroutine error_check(error)
       use mpi
       implicit none
!        Adapted from Nick Maclaren at csx.cam.ac.uk
         INTEGER  error,length,temp
         CHARACTER(LEN = MPI_MAX_ERROR_STRING)  message
         if (error .ne. MPI_SUCCESS) then
           call MPI_ERROR_STRING(error,message,length,temp)
           write(*,*) "ERROR: ", message
           CALL MPI_ABORT(MPI_COMM_WORLD,1,temp)
         end if
       end subroutine


       subroutine ez_error(error)
       use mpi
       implicit none
       integer error
 
       if(error > 0) then
         call MPI_ABORT(MPI_COMM_WORLD,1,error)
       end if 
       end subroutine

!       end module
