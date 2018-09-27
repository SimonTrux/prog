#!/bin/sh
echo "\nWelcome to ExportPro v0.1 by Simon.\n" 
echo "This program will handle the renaming of the photos for you."
echo "\nPlease drag and drop the photo folder you want to sort and press enter :\n"

#read localpath 

#while [ ! -d "$localpath" ]
#do
#echo "It is not a directory, please try again with a directory.\n"
#read localpath
#done

#echo "\nYou have selected : $localpath\n"
#cd $localpath

#read the desired prefix

echo "What is going to be the prefix of the photo ?\n Syntax will be : prefix_001.ext"
read fileprefix
[ -z "$fileprefix" ] && echo "\nDefault selected prefix : txo\n"
if [ -z "$fileprefix" ]
then
	fileprefix=txo
else
	echo "The prefix is $fileprefix  \n"

fi


#old different syntax		filedate="$(stat -f "%B" ./pathtest.sh)"
#old one 			filedate=`stat -f "%B" ./pathtest.sh`
filedate=`find . -type f | stat -f "%B" * | sort | head -1`
urfiledate=`date -r $filedate '+%Y%m%d'`
#echo "\nDate is $filedate\n"
echo "\nDate is $urfiledate\n"
mkdir -p $urfiledate/p/o


#to find the suffixes of last 20 files
suffixlist=`find ./* -maxdepth 0 -not -path '*\/.*' | tr '[:upper:]' '[:lower:]' | cut -d . -f3- | sed '/^\s*$/d' | head -20 | sort -u | tr '\n' ' '`

#find . | cut -d . -f3- | sed '/^\s*$/d' | head -10 | tr '\n' ',' | sed 's/,/, /g'

#echo "Suffix are : $suffixlist\n"

suffixtab=($suffixlist)
#echo "\nIs there a suffix sh ? \n"


for ((sfxnb = 0; sfxnb<${#suffixtab[@]}; sfxnb++)) do
	mkdir -p $urfiledate/p/o/${suffixtab[sfxnb]}
#	echo "$i" "${suffixtab[i]}"
done

echo "There are $sfxnb suffixes : $suffixlist\n"


#echo "Now creating directories"

#echo "Now renaming photos and sorting them in the appropriate directories."

#for  

photos=`find ./* -maxdepth 0 -type f | sort | cut -d / -f2 | tr '\n' ' ' | tr '[:upper:]' '[:lower:]'`
photolist=($photos)
nbofphoto=`find ./* -maxdepth 0 -type f | wc -l | tr -d ' '`
echo "There are $nbofphoto photos to be sorted on that directory"

#while (( $j < $nbofphoto ]
#	do
#	echo $photolist[j]
#	j++
#done

echo ${photolist[@]}

noEXTphotos=`find ./* -maxdepth 0 -type f | sort | cut -d / -f2 | rev | cut -d . -f2- | rev | tr '\n' ' '`
noEXTphotolist=($noEXTphotos)
#TO BE FINISHED
z=0 
for line in ${photolist[@]}
do
	name=`echo $line | rev | cut -d . -f2 | rev`
#	echo $name
	ext=`echo $line | rev | cut -d . -f1 | rev`
#	echo $ext
	fullname=$name.$ext
	#echo $fullname
	if [ "${noEXTphotolist[z]}" = "${noEXTphotolist[z+1]}"  ]; 
		then 	echo "$z\n"
			echo "(($z+1)).$ext" 
		((z++))
		else
		((z++))
	fi

	#then
	#	new_name=`echo "$prefix" "$line" ".*"`
		
done

#k=0
#for ((j = 0; j<${#photolist[@]}; j++)) do
#	((k++))
#	echo ${k}
#	echo ${photolist[j]}
#done

#OLD FOR LOOP
#for ((i = 1; i<${photolist[@]}; i++))
#do
#	echo "${photolist[i]}" #"$photolist[i]/*.*/$i.*"
#done
#var=${fileprefix}_${i}.${suffix[i]}

#BAR='####################'   # this is full bar, mine is 20 chars
#for i in {1..20}; do
#    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
#    sleep .1
#done

echo "Program completed sucessfully. Have a good day TXO !"
exit

#ls -l | grep -i -o *.* | head -5 | cut -d '.' -f2-
