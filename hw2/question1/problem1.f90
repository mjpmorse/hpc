program helloworld
   use mpi
   use errorMod
   implicit none
   integer ierr,rank,numprocs

   call MPI_INIT(ierr)
   call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD,MPI_ERRORS_RETURN,ierr) 
   call ERROR_CHECK(ierr)
   call MPI_COMM_RANK(MPI_COMM_WORLD,rank,ierr)
   call ERROR_CHECK(ierr)
   call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
   call ERROR_CHECK(ierr)

   write(*,*) 'Hello world myid, and numprocs',rank,numprocs

   call MPI_FINALIZE(ierr)
   call ERROR_CHECK(ierr)

 end program
