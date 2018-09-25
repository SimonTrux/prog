#!/bin/sh

gcc -c ./*.c 
ar rc ./*.o
rm ./*.o
ranlib libft
echo "library compilation finished\n"