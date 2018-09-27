#!/bin/sh

			


			#OPENING MESSAGE

sv="0.1" #sleep value for program speed
echo; sleep $sv
echo "Welcome to ExportPro v0.1.1 by Simon."; sleep $sv
echo; sleep $sv
echo "ExportPro is a simple tool that will handle automaticly the renaming of photos."; sleep $sv
echo "It will : ";  sleep $sv
echo "	- detect file type based on extension,";  sleep $sv
echo "	- create appropriate directories;";  sleep $sv
echo "	- rename and move the files.";  sleep $sv
echo; sleep $sv
echo "At any moment you may write "exit" to exit this program.";  sleep $sv
echo; sleep $sv
			#GETTING DIRECTORY TO WORK FROM

echo "Please drag and drop the folder you want to sort from and press enter :"

################### OLD LOOP #
#read localpath 

#while [ ! -d "$localpath" ]
#do
#echo "It is not a directory, please try again with a directory.\n"
#read localpath
#done

#echo "\nYou have selected : $localpath\n"
#cd $localpath
###################
#read localpath
while [ -z "$localpath" ] || [ ! -d "$localpath" ] && [ ! -f "$localpath" ] 
	do 
	read localpath
	if [ -z "$localpath" ];
		then
		echo "You didn't drop any file or folder, please try again."
	fi
	if [ "$localpath" = "exit" ] || [ "$localpath" = "quit" ];
		then echo "\nGood Bye, see you later !\n"
		exit
	fi
	if [ ! -d "$localpath" ] && [ ! -f "$localpath" ] && [ ! -z "$localpath" ];
		then
		echo "I don't need you to write, please drop a file / folder."
	fi
done

if [ -f "$localpath" ];
	then tempath=`echo $localpath | rev | cut -d / -f2- | rev`
	localpath=$tempath
fi

echo "\nSelected directory : "$localpath"\n"
cd "$localpath"
sleep 1


			#GETTING THE DATE FOR DIR

#old different syntax		filedate="$(stat -f "%B" ./pathtest.sh)"
#old one 			filedate=`stat -f "%B" ./pathtest.sh`
filedate=`find ./* -maxdepth 0 -type f | stat -f "%B" * | sort | head -1`
if [ -z $filedate ];
	then filedate=`date +%s`
fi

urfiledate=`date -r $filedate '+%Y%m%d'`
#echo "\nCreating directory $urfiledate\n"; sleep $sv

			#FINDING THE DIFFERENT EXTENSIONS

suffixlist=`find ./* -maxdepth 0 -not -path '*\/.*' | tr '[:upper:]' '[:lower:]' | cut -d . -f3- | sed '/^\s*$/d' | head -20 | sort -u | tr '\n' ' '`
suffixtab=($suffixlist)

for ((nb = 0; nb<${#suffixtab[@]}; nb++))
do :
done

if [ "$nb" -eq "0" ];
	then
	echo "No file type detected in this directory."; sleep $sv
	echo ;sleep $sv
	echo "------ Program now exiting ------"; sleep $sv
	echo ; sleep $sv
	exit
fi
echo "There are $nb file types : $suffixlist."; sleep $sv

			#MAKING THE DIRECTORIES

mkdir -p $urfiledate/p/o
for ((sfxnb = 0; sfxnb<${#suffixtab[@]}; sfxnb++)) do
	mkdir -p $urfiledate/p/o/${suffixtab[sfxnb]}
done
echo "Now creating appropriate directories\n"; sleep 1

			#NOW LISTING FILES AND EXTENSIONS

photos=`find ./*.* -maxdepth 0 -type f | sort | cut -d / -f2 | tr '\n' ' ' | tr '[:upper:]' '[:lower:]'`
photolist=($photos)
nbofphoto=`find ./*.* -maxdepth 0 -type f | wc -l | tr -d ' '`
echo "There are $nbofphoto files to be sorted on this directory.\n"; sleep $sv

			#GETTING DESIRED PREFIX

echo "You may now enter the chosen prefix for renaming."
echo "	(Syntax will be "prefix_1.ext")" 
read fileprefix
#[ -z "$fileprefix" ] && echo "\nDefault selected prefix : txo\n"
if [ -z "$fileprefix" ]
then
	fileprefix=txo
	echo "Default selected prefix : txo\n"; sleep 1
else
	echo "The prefix you chose is $fileprefix  \n"; sleep 1

fi

			#DEFINE VARIABLES TO 

noEXTphotos=`find ./*.* -maxdepth 0 -type f | sort | cut -d / -f2 | rev | cut -d . -f2- | rev | tr '\n' ' '`
noEXTphotolist=($noEXTphotos)
EXTENSIONS=`find ./*.* -maxdepth 0 -type f | sort | rev | cut -d . -f1 | rev | tr '[:upper:]' '[:lower:]' | tr '\n' ' '`
EXTlist=($EXTENSIONS)
iEXTENSIONS=`find ./*.* -maxdepth 0 -type f | sort | rev | cut -d . -f1 | rev | tr '\n' ' '`
iEXTlist=($iEXTENSIONS)
			#RENAMING AND MOVING

z=0 
movepath=./$urfiledate/p/o
for ((x=1; z < ${nbofphoto}; x++));
#for (( x < ${nbofphoto} ));
do
#	name=`echo $line | rev | cut -d . -f2 | rev`
#	echo $name
#	ext=`echo $line | rev | cut -d . -f1 | rev`
#	echo $ext
#	fullname=$name.$ext
	#echo $fullname
	if [ "${noEXTphotolist[z]}" = "${noEXTphotolist[z+1]}"  ]; 
	  then	
#		mv ${noEXTphotolist[z]}.${iEXTlist[z]} $movepath/${EXTlist[z]}/"$fileprefix"_$x.${EXTlist[z]}
		echo "${noEXTphotolist[z]}.${iEXTlist[z]} renamed and moved $movepath/${EXTlist[z]}/"$fileprefix"_$x.${EXTlist[z]}"
			((z++))
#		mv ${noEXTphotolist[z]}.${iEXTlist[z]} $movepath/${EXTlist[z]}/"$fileprefix"_$x.${EXTlist[z]}
		echo "${noEXTphotolist[z]}.${iEXTlist[z]} renamed and moved $movepath/${EXTlist[z]}/"$fileprefix"_$x.${EXTlist[z]}"
			((z++))	
	  else
#		mv ${noEXTphotolist[z]}.${iEXTlist[z]} $movepath/${EXTlist[z]}/"$fileprefix"_$x.${EXTlist[z]}
		echo "${noEXTphotolist[z]}.${iEXTlist[z]} renamed and moved $movepath/${EXTlist[z]}/"$fileprefix"_$x.${EXTlist[z]}"
			((z++))
	fi
sleep 0.1	
done

#var=${fileprefix}_${i}.${suffix[i]}

#BAR='####################'   # this is full bar, mine is 20 chars
#for i in {1..20}; do
#    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
#    sleep .1
#done

			#ENDING MESSAGE AND EXIT

echo "\nProgram sucessfully executed."; sleep $sv
echo "-------- Now exiting --------"; sleep $sv
echo; sleep $sv
echo "Thanks for using ExportPro v0.1 and have a good day !"; sleep $sv
echo; sleep $sv
exit
