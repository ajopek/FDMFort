.PHONY: all

IFORTFLAGS=-funroll-all-loops -WB -std08 -module . -implicitnone -fpp -warn all -pedantic -fpp -Iout/ -DDEF_KIND=$(KIND) -g
GFORTFLAGS=-O3 -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic -fbounds-check -cpp

all: out/gmain

out/gmain:
	mkdir -p out 
	gfortran src/setup.f90 src/gaussian_elimination.f90 src/equations_generator.f90 src/main.f90 -o $@4 $(GFORTFLAGS) -D "DEF_PRECISION=4"
	gfortran src/setup.f90 src/gaussian_elimination.f90 src/equations_generator.f90 src/main.f90 -o $@8 $(GFORTFLAGS) -D "DEF_PRECISION=8"
	gfortran src/setup.f90 src/gaussian_elimination.f90 src/equations_generator.f90 src/main.f90 -o $@16 $(GFORTFLAGS) -D "DEF_PRECISION=16"
clean:
	rm -rf out
	mkdir out
