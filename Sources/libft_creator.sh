#!/bin/sh

gcc -c ft_*.c && (echo "gcc OK"; exit 0) || (c=$?; echo "gcc not OK"; (exit $c))
ar -rc libft.a *.o && (echo "ar OK"; exit 0) || (c=$?; echo "ar not OK"; (exit $c))

rm *.o
#ranlib libft.a && (echo "ranlib OK"; exit 0) || (c=$?; echo "ranlib not OK"; (exit $c))

if ranlib libft.a ; then
	echo "ranlib workeds"
else
	echo "ranlib NOT WORKING"
fi

#echo "library compilation finished"
