      program helloworld
         implicit none
         use mpi
         integer ierr.myid,numprocs

         call MPI_INIT(ierr)
         call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)

         write(*,*) 'Hello world myid, and numprocs',myid,numprocs

         call MPI_FINALIZE(ierr)

       end program
