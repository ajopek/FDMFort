! Created by ajopek on 21.04.18.

module equations_generator
    implicit none
contains
    subroutine generate_coeffitients(n, coef_matrix)
        implicit none
        integer, intent(in) :: n
        real (kind = 8), dimension(n - 1, 3), intent(out) :: coef_matrix
        integer :: i, j
        real (kind = 8) :: c1, c2

        ! Calculate coefficients
        c1 = real(n, kind = 8) ** 2
        c2 = -2.0 * c1


        coef_matrix(:, :) = real(0, kind = 8)

        coef_matrix(1, 1) = c2
        coef_matrix(1, 2) = c1

        do i = 2, (n - 2)
            coef_matrix(i - 1, i) = c1
            coef_matrix(i , i) = c2
            coef_matrix(i + 1, i) = c1
        end do

        coef_matrix(n - 1, n - 1) = real(1, kind = 8)

    end subroutine generate_coeffitients

    subroutine generate_values(n, val_matrix)
        integer, intent(in) :: n
        real (kind = 8), dimension(n - 1), intent(out) :: val_matrix

        val_matrix(:) = 0
        val_matrix(n - 1) = 1

    end subroutine generate_values
end module equations_generator

module gaussian_elimination
    implicit none

contains
    subroutine apply_elimination(coef_matrix, val_matrix, matrix_dim)
        implicit none
        integer, intent(in) :: matrix_dim
        real (kind = 8), dimension(matrix_dim, matrix_dim) :: coef_matrix
        real (kind = 8), dimension(matrix_dim) :: val_matrix

        integer :: i, j
        real :: multiplier
        do i = 1, matrix_dim
            do j = 1, matrix_dim
                if (i .NE. j) then
                    multiplier = coef_matrix(i, j) / coef_matrix(i, i)
                    coef_matrix(:, j) = coef_matrix(:, j) - multiplier * coef_matrix(:, i)
                    val_matrix(j) = val_matrix(j) - multiplier * val_matrix(i)
                end if
                val_matrix(i) = val_matrix(i) / coef_matrix(i, i)
                coef_matrix(:, i) = coef_matrix(:, i) / coef_matrix(i, i)
            end do
        end do

    end subroutine apply_elimination
end module gaussian_elimination

program test
    use gaussian_elimination
    use equations_generator
    implicit none

    integer (kind = 4) :: N
    real (kind = 8), allocatable :: coef_matrix(:, :), val_matrix(:)

    read(*, *) N

    allocate(coef_matrix(1:N - 1, 1:N - 1))
    allocate(val_matrix(1:N - 1))

    call generate_coeffitients(N, coef_matrix)
    call generate_values(N, val_matrix)

    write(*, *) val_matrix
    write(*, *) coef_matrix

    write(*, *) "n"

    call apply_elimination(coef_matrix, val_matrix, N - 1)

    write(*, *) val_matrix

    deallocate(coef_matrix)
    deallocate(val_matrix)

end program test