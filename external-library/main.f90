
program main

    use mpi
    use communications

    implicit none

    integer :: ierr
    integer :: nprocs, myrank

    call MPI_Init(ierr)
    if (ierr /= MPI_SUCCESS) stop 1

    call get_size(nprocs, myrank, ierr)
    if (ierr /= MPI_SUCCESS) call abort_comm_world(ierr)

    call communicate(nprocs, myrank, ierr)
    if (ierr /= MPI_SUCCESS) call abort_comm_world(ierr)

    call MPI_Finalize(ierr)
    if (ierr /= MPI_SUCCESS) stop 1

contains

    subroutine get_size(nprocs, myrank, ierr)
        integer,intent(out) :: nprocs, myrank, ierr

        call MPI_COMM_Size(MPI_COMM_WORLD, nprocs, ierr)
        if (ierr /= MPI_SUCCESS) return

        call MPI_COMM_Rank(MPI_COMM_WORLD, myrank, ierr)
        if (ierr /= MPI_SUCCESS) return

    end subroutine get_size

    subroutine abort_comm_world(ierr)
        integer,intent(in) :: ierr
        integer :: ignored
        call MPI_Abort(MPI_COMM_WORLD, ierr, ignored)
    end subroutine abort_comm_world

end program main
