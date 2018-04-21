! Created by ajopek on 21.04.18.

module equations_generator
    implicit none
contains
    subroutine generate_coeffitients(n, coef_matrix)
        implicit none
        integer, intent(in) :: n
        real (kind = 4), dimension(n - 1, 3), intent(out) :: coef_matrix
        real (kind = 4) :: h
        integer :: i, j
        real (kind = 4) :: c1, c2, c3

        ! Calculate points distance
        h =  1. / n;

        ! Calculate coefficients
        c1 = 1. / (h**2)
        c2 = -2. / (h**2)
        c3 = c1

        write (*, *) c1
        write (*, *) c2
        write (*, *) c3

        coef_matrix(:, :) = 0

        coef_matrix(1, 2) = c1
        coef_matrix(1, 1) = c2

        do i = 2, (n - 2)
            coef_matrix(i, 1) = c3
            coef_matrix(i, 2) = c2
            coef_matrix(i, 3) = c1
        end do

        coef_matrix(n - 1, 2) = c2
        coef_matrix(n - 1, 1) = c3


    end subroutine generate_coeffitients

    subroutine generate_values(n, val_matrix)
        integer, intent(in) :: n
        real (kind = 4), dimension(n - 1), intent(out) :: val_matrix

        val_matrix(:) = 0
        val_matrix(n-1) = -1. / (1. / n)**2

        write (*, *) val_matrix(n-1)

    end subroutine generate_values
end module equations_generator

module gaussian_elimination
    implicit none

contains
    subroutine apply_elimination(coef_matrix, val_matrix, matrix_dim)
        implicit none
        integer, intent(in) :: matrix_dim
        real (kind = 4), dimension(matrix_dim, matrix_dim) :: coef_matrix
        real (kind = 4), dimension(matrix_dim) :: val_matrix

        integer :: i, j
        real :: multiplier
        do i = 1, matrix_dim
            do j = 1, matrix_dim
                if (i .NE. j) then
                    multiplier = coef_matrix(i, j) / coef_matrix(i, i)
                    coef_matrix(:, j) = coef_matrix(:, j) - multiplier * coef_matrix(:, i)
                    val_matrix(j) = val_matrix(j) - multiplier * val_matrix(i)
                    val_matrix(i) = val_matrix(i) / coef_matrix(i, i)
                end if
            end do
        end do

    end subroutine apply_elimination
end module gaussian_elimination

program test
    use gaussian_elimination
    use equations_generator
    implicit none

    integer (kind = 4) :: N
    real (kind = 4), allocatable :: coef_matrix(:, :), val_matrix(:)

    read(*, *) N

    allocate(coef_matrix(N - 1, 3))
    allocate(val_matrix(N - 1))

    call generate_coeffitients(N, coef_matrix)
    call generate_values(N, val_matrix)

    call apply_elimination(coef_matrix, val_matrix, N - 1)

    write(*, *) val_matrix

end program test