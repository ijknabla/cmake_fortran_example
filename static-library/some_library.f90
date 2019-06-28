
module some_library

    implicit none

    private
    public :: sub1, sub2

contains

    subroutine sub1
        print *, "sub1 called"
    end subroutine sub1

    subroutine sub2
        print *, "sub2 called"
    end subroutine sub2

end module some_library
