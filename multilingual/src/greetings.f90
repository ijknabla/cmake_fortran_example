
module greetings

    use iso_c_binding

    implicit none

    private
    public :: say_hello

    interface
        subroutine c_say_hello(name) bind(C, name="sayHello")
            import c_ptr
            type(c_ptr),value :: name
        end subroutine c_say_hello
    end interface

contains

    subroutine say_hello(name)
        character(*,c_char),intent(in) :: name
        call impl(name//C_NULL_CHAR)
    contains
        subroutine impl(terminated)
            character(*,c_char),target,intent(in) :: terminated
            call c_say_hello(c_loc(terminated))
        end subroutine impl
    end subroutine say_hello

end module greetings
