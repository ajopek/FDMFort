#!/bin/bash

make clean
make
printf 'n   error \n' > result4.data

for i in {3..1000};
do
	printf "%s" "$i" >> result4.data
	out/gmain4 <<<"$i" >> result4.data  
done

printf 'n   error \n' > result8.data

for i in {3..1000};
do
        printf "%s" "$i" >> result8.data
        out/gmain8 <<<"$i" >> result8.data  
done

printf 'n   error \n' > result16.data

for i in {3..1000};
do
        printf "%s" "$i" >> result16.data
        out/gmain16 <<<"$i" >> result16.data  
done

