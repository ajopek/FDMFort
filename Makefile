.PHONY: all

KIND=4
IFORTFLAGS=-funroll-all-loops -WB -std08 -module . -implicitnone -fpp -warn all -pedantic -fpp -Iout/ -DDEF_KIND=$(KIND) -g
GFORTFLAGS=-O3 -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic -fbounds-check -cpp

all: out/gmain

out/gmain:
	mkdir -p out
	gfortran src/setup.f90 src/gaussian_elimination.f90 src/equations_generator.f90 src/main.f90 -o $@ $(GFORTFLAGS)

clean:
	rm -rf out
	mkdir out
