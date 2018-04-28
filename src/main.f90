! Created by ajopek on 21.04.18.

program main
    use gaussian_elimination
    use equations_generator
    use setup

    integer (kind = 4) :: N
    real (kind = iPRECISION), allocatable :: coef_matrix(:, :), val_matrix(:)

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

end program main