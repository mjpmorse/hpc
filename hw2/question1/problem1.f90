      program helloworld
       use mpi
!       use errormod
       implicit none
       integer error,rank,numprocs
       call MPI_INIT(error)
       call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD,MPI_ERRORS_RETURN,error)
       call MPI_COMM_RANK(MPI_COMM_WORLD,rank,error)
       call ERROR_CHECK(error)
       call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,error)
       call ERROR_CHECK(error)

       write(*,*) 'Hello world myid, and numprocs',rank,numprocs

       call MPI_FINALIZE(error)
       call ERROR_CHECK(error)

      end program
