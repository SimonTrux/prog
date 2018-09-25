#!/bin/sh
echo "\nWelcome to PhotoSort 0.1 by Simon.\n" 
echo "This program will handle the renaming of the photos for you."
echo "\nPlease drag and drop the photo folder you want to sort and press enter :"

read localpath 

echo "You have selected : $localpath"
cd $localpath
if [ -d "$FILEPATH"  ]
	echo "test"
fi
ls -l

#echo "Now creating directories : cr2 and jpeg."
#mkdir cr2
#mkdir jpg

#echo "Now renaming photos and sorting them in the appropriate folder"

echo "Program completed sucessfully. Have a good day TXO !"
