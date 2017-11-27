program helloworld
   implicit none
   use mpi
   integer ierr.myid,numprocs

   call MPI_INIT(ierr)
   call ERROR_CHECK(ierr)
   call MPI_COMM_RANK(MPI_COMM_WORLD,rank,ierr)
   call ERROR_CHECK(ierr)
   call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
   call ERROR_CHECK(ierr)

   write(*,*) 'Hello world myid, and numprocs',rank,numprocs

   call MPI_FINALIZE(ierr)
   call ERROR_CHECK(ierr)

 end program
