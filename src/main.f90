! Created by ajopek on 21.04.18.

program main
    use gaussian_elimination
    use equations_generator
    use setup

    integer (kind = 4) :: N
    real (kind = iPRECISION), allocatable :: coef_matrix(:, :), val_matrix(:)
    real(kind = 16), allocatable, dimension(:) :: Ideal, Error
    integer :: i

    read(*, *) N

    allocate(coef_matrix(1:N - 1, 1:N - 1))
    allocate(val_matrix(1:N - 1))
    allocate(Ideal(1:N-1))
    allocate(Error(1:N-1))

    call generate_coeffitients(N, coef_matrix)
    call generate_values(N, val_matrix)

    call apply_elimination(coef_matrix, val_matrix, N - 1)

    ! Calculate errors
    ! Sollution to this equation is function f(x) = x
    Ideal(1) = real(0, kind = 16)

    do i = 2, N-2
        Ideal(i) = (real(1, kind=16) / real(N - 1, kind=16)) * i
    end do

    Ideal(N - 1) = real(1, kind = 16)

    Error = val_matrix - Ideal

    print *, iPrecision
    print *, (SUM(ABS(Error)) / size(Error))


    deallocate(coef_matrix)
    deallocate(val_matrix)

end program main