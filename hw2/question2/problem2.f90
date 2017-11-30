!Ping-Pong: |.   | --> |    .|  --> |.    | 
       subroutine pingpong(vector,length)
         use mpi
         implicit none
         integer :: length
         integer(kind = 8), dimension(length) :: vector
         integer :: error,rank
         integer ::status(MPI_STATUS_SIZE)
           CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank,error)
           CALL ERROR_CHECK(error)
! Rank 0 commands         
           if(rank.eq.0) then                 
! Sends vector with TAG = 1             
              CALL MPI_SEND(vector,length,MPI_INTEGER, &
                             1,1,MPI_COMM_WORLD ,error)
              CALL ERROR_CHECK(error)               
! Recieve vector with TAG = 0
              CALL MPI_RECV(vector,length,MPI_INTEGER, &
                            1,0,MPI_COMM_WORLD,status,error)
              CALL ERROR_CHECK(error)
           end if
! rank 1 command
           if(rank.eq.1) then
! Recieves vector with TAG = 1
              CALL MPI_RECV(vector,length,MPI_INTEGER,0,1, &
                            MPI_COMM_WORLD,status,error)
              CALL ERROR_CHECK(error)
! Sends vector with TAG = 0
              CALL MPI_SEND(vector,length,MPI_INTEGER,0,0, &
                            MPI_COMM_WORLD,error)
              CALL ERROR_CHECK(error)
            end if

       end subroutine



       program ping_pong
         use mpi
         implicit none
         integer, parameter :: qp = selected_real_kind(33,4931)
         integer, parameter :: dp = selected_real_kind(15,307)
         integer :: error, rank, numprocs
         integer :: maxlength,length,i
         integer :: status(MPI_STATUS_SIZE)
         integer ,dimension(:),allocatable :: vector
         real(kind = dp) :: starttime, endtime, time
         real(kind = qp) :: quadone,quadsmallloop
         integer :: smallloop
         character(len = 32) :: datafile


! Initiate MPI
         call MPI_INIT(error)
         call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD, & 
                                      MPI_ERRORS_RETURN,error)
         call MPI_COMM_RANK(MPI_COMM_WORLD,rank,error)
         call ERROR_CHECK(error)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,error)
         call ERROR_CHECK(error)
          
         maxlength = 1000000
         quadone = 1
!set up data file
         if(rank .eq. 0) then
           call GET_COMMAND_ARGUMENT(1,datafile)
           open(unit = 1, file = datafile)
           write(1,*) 'vector size (bytes) ,','time (s)'
         end if

         do length = 1, maxlength+1, 100
           allocate(vector(length))
           vector(:)= 0
           if(rank.eq.0) then 
              vector(:) = 3
              starttime = MPI_WTIME()
           end if
           if(length .lt. 100000) then 
              do smallloop = 1,10000 
                  call pingpong(vector,length)
                  if(rank.eq.1) then
                    vector(:) = 0
                  end if
              end do
              if(rank .eq.0) then
                 endtime =  MPI_WTIME()
                 time = (endtime - starttime)/real(10000,dp)
                 write(1,*) length,',',time
               end if
           else 
               call pingpong(vector,length)
               if(rank.eq.0) then
                  endtime =  MPI_WTIME()
                  time = (endtime - starttime)
                  write(1,*) length,',',time
               end if
           end if
           deallocate(vector)
         end do
         close(1)
       end program

