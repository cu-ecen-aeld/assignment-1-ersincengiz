#!/bin/bash


writefile=$1
writestr=$2
#Are the arguments empty?
if [ ! -z $writefile ] && [ ! -z $writestr ];
then         #FILE exists.
	    if [ -e $writefile ]
		then
		 echo $writestr >> $writefile  #write to file
	    else
	    if [ ! -d $writefile ] #FILE exists and is a directory.
	    then
	    createpath=$(dirname "$writefile") #create path
	        mkdir -p $createpath
	    fi
		touch  "$writefile" 2> /dev/null #create file
		if [ $? -eq 0 ] #success ?
		then 
		 echo $writestr > $writefile
		else 
		  echo "Could not create file" >&2 
		  echo "$writefile"
		fi

	    fi
else
   exit 1
fi
