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
         integer :: iteration
         character(len = 32) :: datafile,stringrank
! set up the steps
         integer :: error, rank, size
         integer ::status(MPI_STATUS_SIZE)
! Initiate MPI
         call MPI_INIT(error)
         call MPI_COMM_SET_ERRHANDLER(MPI_COMM_WORLD, &
                                      MPI_ERRORS_RETURN,error)
         call MPI_COMM_RANK(MPI_COMM_WORLD,rank,error)
         call ERROR_CHECK(error)
         call MPI_COMM_SIZE(MPI_COMM_WORLD,size,error)
         call ERROR_CHECK(error)

         call GET_COMMAND_ARGUMENT(1,datafile)
         deltax = (xright - xleft)/(real(gridsize,dp))
         deltay = (ytop - ybottom)/(real(gridsize,dp))
         dxdy = deltax*deltay
! set up rank 0 as the central hub
         write(stringrank,*) rank
         stringrank = adjustl(stringrank)
         totalarea = 0d0
         gridsize = 1000

         open(unit = 1, file = trim(datafile)//trim(stringrank)//'.dat')
         if(rank.eq.0) then
           do xstep = 1,gridsize,1
             do ystep = 1,gridsize,1
               point(1) = x
               point(2) = y
               call MPI_SEND(point,2,MPI_DOUBLE_PRECISION &
                             ,MPI_COMM_WORLD,ystep &
                             ,MPI_COMM_WORLD,error)
               call ERROR_CHECK(error)
               y = ybottom + real((ystep-1),dp)*deltay
             end do
             x = xleft+real((xstep-1),dp)*deltax
           end do
           call MPI_BCAST(MPI_BOTTOM,0,MPI_DOUBLE_PRECISION,&
                         0,MPI_COMM_WORLD,error)
           call error_check(error)              
         end if
         
20       continue         
         if(rank.ne.0) then
           call MPI_RECV(point,2,MPI_DOUBLE_PRECISION, &
                           MPI_ANY_TAG, MPI_COMM_WORLD,&
                         status,error)
           call ERROR_CHECK(error)
           if(status(MPI_TAG) .eq. 0) then
              goto 30
           end if
           xgiven = point(1)
           ygiven = point(2)
           call in_set(xgiven,ygiven,inset)
           if(inset) then
             area = area+dxdy
             write(1,*) xgiven,"," ,ygiven
           end if
         end if
         goto 20
30       if(rank.ne.0) then
            call MPI_REDUCE(area,totalarea,1,MPI_DOUBLE_PRECISION,&
            MPI_SUM,0,MPI_COMM_WORLD,error)
            call error_check(error)
         else
           write(*,*) 'area is ',totalarea
         end if
         call MPI_FINALIZE(error)
       end program
