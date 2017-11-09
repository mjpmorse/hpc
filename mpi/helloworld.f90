       program helloworld
         use mpi
         implicit none
!         include 'mpif.h'
         integer ierr,myid,numprocs,resultlen
         character(MPI_MAX_PROCESSOR_NAME) procname

         call MPI_INIT(ierr)
         call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
         call MPI_GET_PROCESSOR_NAME(procname,resultlen,ierr)

         write(*,*) myid , ' of ' , numprocs , 'on ', procname

         call MPI_FINALIZE(ierr)

       end program
