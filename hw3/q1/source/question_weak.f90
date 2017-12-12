       program question3b
         use mpi
         implicit none
         integer, parameter :: dp = selected_real_kind(15,307)
! define the box we are working in
         real(kind=dp) :: xleft,xright,ybottom,ytop
         real(kind=dp) :: area,totalarea
         logical :: inset
! defines the grid
         integer :: gridsize,xstep,ystep
         real(kind=dp) :: deltax,deltay,x,y,dxdy
         real(kind=dp),dimension(2) :: point
         real(kind=dp) :: xgiven,ygiven
         integer :: incount,allcount
         integer :: iteration,recieve
         character(len = 32) :: datafile,stringrank
         character(len = 3)  :: proc
! set up the steps
         integer :: error, rank, size
         integer ::status(MPI_STATUS_SIZE)
         integer :: REQUEST, REPLY,sender,i,mpirequest
         logical :: workdone
         real(kind = dp) :: stime,etime,time
         parameter  (REQUEST = 1)
         parameter  (REPLY = 2)
         
! Initiate MPI
         call MPI_INIT(error)
         call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD, &
                                      MPI_ERRORS_RETURN,error)
         call MPI_COMM_RANK(MPI_COMM_WORLD,rank,error)
         call ERROR_CHECK(error)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,size,error)
         call ERROR_CHECK(error)

!         call GET_COMMAND_ARGUMENT(1,datafile)
         call GET_COMMAND_ARGUMENT(1,proc)
         xright = 2d0
         xleft = -2d0
         ytop = 1d0
         ybottom = -1d0

         deltax = (xright - xleft)/(real(gridsize,dp))
         deltay = (ytop - ybottom)/(real(gridsize,dp))
         dxdy = deltax*deltay
! set up rank 0 as the central hub
!         write(stringrank,*) rank
!         stringrank = adjustl(stringrank)
         totalarea = 0d0
         gridsize = 1000*int((real(size,dp))**(1./real(2,dp)))
         recieve = 0
         workdone = .false.
        

!         open(unit = 1, file = trim(datafile)//trim(stringrank)//'.dat')
         if(rank.eq.0) then
           
!           open(unit = 50, file = 'time.txt')
           stime = MPI_WTIME()
           do xstep = 1,gridsize,1
             x = xleft+real((xstep-1),dp)*deltax
             do ystep = 1,gridsize,1
               y = ybottom + real((ystep-1),dp)*deltay
               point(2) = y
               point(1) = x
               call  MPI_RECV(recieve,1,MPI_INT,MPI_ANY_SOURCE,& 
                              REQUEST,MPI_COMM_WORLD, &
                              status,error)
               call error_check(error)
               sender = status(MPI_SOURCE)

               call MPI_SEND(point,2,MPI_DOUBLE_PRECISION &
                             ,sender,REPLY &
                             ,MPI_COMM_WORLD,error)
               call ERROR_CHECK(error)
             end do
           end do
           call error_check(error)
! make sure no slaves are stuck waiting for a command           
           do i = 1,size-1  
!               call  MPI_IRECV(recieve,1,MPI_INT,MPI_ANY_SOURCE,& 
!                              REQUEST,MPI_COMM_WORLD, &
!                              mpirequest,error)
!               call error_check(error)
!               sender = status(MPI_SOURCE)
               point(:) = 1d2
               call MPI_ISEND(point,2,MPI_DOUBLE_PRECISION &
                             ,i,REPLY &
                             ,MPI_COMM_WORLD,mpirequest,error)
               call ERROR_CHECK(error)
           end do
           goto 30
         end if
         

         if(rank.ne.0) then
20        call MPI_ISEND(REQUEST,1,MPI_INT,0,REQUEST,MPI_COMM_WORLD &
                          ,mpirequest,error)
           call error_check(error)
           call MPI_RECV(point,2,MPI_DOUBLE_PRECISION,0,&
                           REPLY, MPI_COMM_WORLD,&
                         status,error)
           call ERROR_CHECK(error)
           if((point(1).eq.1d2).and.(point(2).eq.1d2)) then
              goto 30
           end if
           ygiven = point(2)
           xgiven = point(1)
           call in_set(xgiven,ygiven,inset)
           if(inset) then
             area = area+dxdy
!             write(1,*) xgiven,"," ,ygiven
           end if
           goto 20
         end if

30       call MPI_REDUCE(area,totalarea,1,MPI_DOUBLE_PRECISION,&
         MPI_SUM,0,MPI_COMM_WORLD,error)
         call error_check(error)
         if(rank.eq.0) then
           etime = MPI_WTIME()
           time = etime - stime
!           write(50,*) time
           write(*,"(A2,A1,F10.6)") proc,",",time
         end if
         call MPI_FINALIZE(error)
       end program
