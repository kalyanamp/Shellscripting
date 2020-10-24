
#--------------
#if condition
#--------------

    if condition
    then
#    command1 if condition is true or if exit status
#    of condition is 0 (zero)
    ...
    ...
    fi
	
	
#!/bin/sh
#
#Script to print file
#
if cat $1
then
echo -e "\n\nFile $1, found and successfully echoed"
fi


#
# Script to test rm command and exist status
#
if rm $1
then
echo "$1 file deleted"
fi

#test command or [ expr ]
--test command or [ expr ] is used to see if an expression is true, and if it is true it return zero(0), otherwise
  returns nonzero for false.
#Syntax:
test expression OR [ expression ]


#!/bin/sh
#
# Script to see whether argument is positive
#
if test $1 -gt 0
then
echo "$1 number is positive"
fi


#if...else...fi
#If given condition is true then command1 is executed otherwise command2 is executed.
Syntax:
if condition
then
	condition is zero (true - 0)
	execute all commands up to else statement
else
	if condition is not true then
	execute all commands up to fi
fi


#!/bin/sh
#
# Script to see whether argument is positive or negative
#
if [ $# -eq 0 ]
then
echo "$0 : You must give/supply one integers"
exit 1
fi
if test $1 -gt 0
then
echo "$1 number is positive"
else
echo "$1 number is negative"
fi

#Nested if-else-fi

osch=0
echo "1. Unix (Sun Os)"
echo "2. Linux (Red Hat)"
echo -n "Select your os choice [1 or 2]? "
read osch
if [ $osch -eq 1 ] ; then
	echo "You Pick up Unix (Sun Os)"
else #### nested if i.e. if within if ######
	if [ $osch -eq 2 ] ; then
		echo "You Pick up Linux (Red Hat)"
	else
		echo "What you don't like Unix/Linux OS."
	fi
fi

--------------------------
#for Loop
#Syntax:
for { variable name } in { list }
do
	execute one for each item in the list until the list is
	not finished (And repeat all statement between do and done)
done


for i in 1 2 3 4 5
do
	echo "Welcome $i times"
done


--------
#!/bin/sh
#
#Script to test for loop
#
#
if [ $# -eq 0 ]
then
echo "Error - Number missing form command line argument"
echo "Syntax : $0 number"
echo "Use to print multiplication table for given number"
exit 1
fi
n=$1
for i in 1 2 3 4 5 6 7 8 9 10
do
echo "$n * $i = `expr $i \* $n`"
done
---------------

while loop
Syntax:
while [ condition ]
do
command1
command2
command3
..
....
done

#!/bin/sh
#
#Script to test while statement
#
#
if [ $# -eq 0 ]
then
echo "Error - Number missing form command line argument"
echo "Syntax : $0 number"
echo " Use to print multiplication table for given number"
exit 1
fi
n=$1
i=1
while [ $i -le 10 ]
do
echo "$n * $i = `expr $i \* $n`"
i=`expr $i + 1`
done



#
# if no vehicle name is given
# i.e. -z $1 is defined and it is NULL
#
# if no command line arg
if [ -z $1 ]
then
rental="*** Unknown vehicle ***"
elif [ -n $1 ]
then
# otherwise make first arg as rental
rental=$1
fi
case $rental in
"car") echo "For $rental Rs.20 per k/m";;
"van") echo "For $rental Rs.10 per k/m";;
"jeep") echo "For $rental Rs.5 per k/m";;
"bicycle") echo "For $rental 20 paisa per k/m";;
*) echo "Sorry, I can not gat a $rental for you";;
esac


function:
----------


SayHello()
{
echo "Hello $LOGNAME, Have nice computing"
return
}


Shift:
-------

echo "Current command line args are: \$1=$1, \$2=$2, \$3=$3"
shift
echo "After shift command the args are: \$1=$1, \$2=$2, \$3=$3"


Cut--
-----------
sname
Sr.No Name
11 Vivek
12 Renuka
13 Prakash
14 Ashish
15 Rani
smark
Sr.No Mark
11 67
12 55
13 96
14 36
15 67

cut -f2 sname
cut -f1 sname


cut -f2 smark

cut -f2 sname > /tmp/sn.tmp.$$
cut -f2 smark > /tmp/sm.tmp.$$


paste sname smark

paste /tmp/sn.tmp.$$ /tmp/sm.tmp.$$

#cut :

 cat file.txt
unix or linux os
is unix good os
is linux good os


cut -c4 file.txt
cut -c4,6 file.txt
cut -d' ' -f2 file.txt
cut -d' ' -f2,3 file.txt
--------

'''
India's milk is good.
tea Red-Lable is good.
tea is better than the coffee 



sed '/tea/s//milk/g' teaormilk > /tmp/result.tmp.$$
cat /tmp/result.tmp.$$


#sed
>cat file.txt
unix is great os. unix is opensource. unix is free os.
learn operating system.
unixlinux which one you choose.

sed 's/unix/linux/' file.txt

# replace the first, second occurrence of a pattern in a line
sed 's/unix/linux/2' file.txt # 

#global replacement
sed 's/unix/linux/g' file.txt

#Using & as the matched string
sed 's/unix/{&}/' file.txt

sed 's/unix/{&&}/' file.txt
#you want to switch the words
sed 's/\(unix\)\(linux\)/\2\1/' file.txt

#switching the first three characters in a line

sed 's/^\(.\)\(.\)\(.\)/\3\2\1/' file.txt

#Duplicating the replaced line with /p flag

sed 's/unix/linux/p' file.txt
#Printing only the replaced lines
sed -n 's/unix/linux/p' file.txt
# Replacing string on a specific line number.
sed '3 s/unix/linux/' file.txt
# Replacing string on a range of lines
sed '1,3 s/unix/linux/' file.txt
#sed command replaces the lines with range $ indicates the last line
sed '2,$ s/unix/linux/' file.txt

#Deleting lines
sed '2 d' file.txt
sed '5,$ d' file.txt

#Sed as grep command
sed -n '/unix/ p' file.txt

>grep -v 'unix' file.txt
>sed -n '/unix/ !p' file.txt

#Add a line after a match.
sed '/unix/ a "Add a new line"' file.txt
# Add a line before a match
sed '/unix/ i "Add a new line"' file.txt
#Change a line
sed '/unix/ c "Change line"' file.txt

#Transform like tr command
sed 'y/ul/UL/' file.txt
#How to delete range of lines from a file using unix or inux command
sed 'm,nd' filename  #lines (between m and n)

#How to delete the trailer line (first line) from a file using the unix or inux command
sed '$d' unix_file.txt
sed -i '$d' unix_file.txt

#How to remove the header line (first line) 
sed '1d' linux_file.txt
sed -i '1d' linux_file.txt
#Delete blank lines with Sed command
sed '/^$/d' linux_hosting.dat



#GREP

#Running the last executed grep command
!grep

grep "^[0-9].*" file.txt

#Checking for the whole words in a file.
grep -w "world" file.txt
#Displaying the lines before the match.
grep -B 2 "Error" file.txt
#Displaying the lines after the match.
grep -A 3 "Error" file.txt
#Displaying the lines around the match
grep -C 5 "Error" file.txt
# Inverting the pattern match
grep -v "string" file.txt
#Displaying the non-empty lines
grep -v "^$" file.txt

#Displaying the count of number of matches.
grep -c "sting" file.txt
#. Display the file names that matches the pattern.
grep -l "string" file.txt
#Displaying only the matched pattern
grep -o "string" file.txt
# Displaying the position of the matched string in the line
grep -o -b "string" file.txt
#Matching the lines that start with a string
grep "^start" file.txt
# Matching the lines that end with a string
grep "end$" file.txt

#FIND
!find

#How to find for a file using name
find -name "sum.java"
#How to find for a file in the current directory only
find -maxdepth 1 -name "sum.java"
#How to find for files containing a specific word in its name
find -name "*java*"
#How to find the files whose name are not 
find -not -name "sum.java"
# print the files in the current directory and one level down to the current directory
find -maxdepth 2 -name "sum.java"
#How to print the files in the subdirectories between level 1 and 4?#
find -mindepth 2 -maxdepth 5 -name "sum.java"
#How to find the empty files in a directory
find . -maxdepth 1 -empty
#How to find the largest file in the current directory and sub directories
find . -type f -exec ls -s {} \; | sort -n -r | head -1
#How to find the smallest file in the current directory and sub directories
find . -type f -exec ls -s {} \; | sort -n -r | tail -1
#Finding directories
find . -type d
#Finding regular files
find . -type f
# Finding hidden files
find . -type f -name ".*"
#modification of a give file.
find -anewer "sum.java"
# Display the files which are changed after the modification of a give file.
find -cnewer "sum.java"
#Find the files which are modified within 1 day.
find . -mtime -1

#CONVERT LOWER CASE TO UPPER CASE
echo "apple" | tr [a-z] [A-Z]
echo "APPLE" | tr [A-Z] [a-z]
#How to find the length of the given string 
> cat length.sh
#!/bin/bash

str="Linux dedicated server"

#1. finding size of string using the wc command
len=`echo $str|wc -c`
echo "length of $str=$len"

#2.caluclating the length using the awk command
len=`echo $str|awk '{print length}'`

#3.length using the expr command
len=`expr length "$str"`
echo "length of $str=$len"

#4.length using the shell built in hash(#)
echo "length of $str=$len"
echo "length of $str=${#str}"

#HOW TO DELETE SYMBOLIC LINK - UNIX / LINUX
mkdir /var/tmp/linkdir
ln -s /var/tmp/linkdir linkname
unlink linkname
rm linkname

#Xargs 
#Xargs command in unix or linux operating system is used to pass the output of one command as an argument to another command.

ls *.log | xargs -i mv {} {}_bkp
find . -name "*.bash" | xargs grep "echo"
ls "*.tmp" | xargs rm
find . -mtime +5 -exec rm {} \;

#HOW TO REPLACE BRACES SYMBOLS IN UNIX / LINUX
> cat logfile
Error - (unix script failed)

tr -d '()' < logfile
sed 's/[()]//g' logfile

#REMOVE LAST CHARACTER IN STRING 
sed s/.$// filename
