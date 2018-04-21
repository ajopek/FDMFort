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
                end if
            end do
        end do

    end subroutine apply_elimination
end module gaussian_elimination

program test
    use gaussian_elimination
    implicit none

    integer (kind = 4) :: N, i, j
    real (kind = 4), allocatable :: coef_matrix(:, :), val_matrix(:)

    read(*, *) N

    allocate(coef_matrix(N, N))
    allocate(val_matrix(N))

    do i = 1, N
        do j = 1, N
            read(*, *) coef_matrix(j, i)
        end do
    end do

    do i = 1, N
        read(*, *) val_matrix(i)
    end do

    write(*, *) coef_matrix
    write(*, *) val_matrix

    call apply_elimination(coef_matrix, val_matrix, N)

    write(*, *) coef_matrix
    write(*, *) val_matrix

end program test