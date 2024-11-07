#!/bin/bash
#AUTHOR: Brock Schoentaler
#Date: 6 November 2024
#Description: Homemade software to back up school files to an external hard drive

strSchoolYearDir=D:/Old_School_Folders/2024_Fall
#Class 1 vars
strClass1=systems_and_networking
strClass1Dir=D:/Old_School_Folders/2024_Fall/$strClass1
#Class 2 vars
strClass2=design_of_algorithms
strClass2Dir=D:/Old_School_Folders/2024_Fall/$strClass2
#Class 3 vars
strClass3=DevOps
strClass3Dir=D:/Old_School_Folders/2024_Fall/$strClass3


#Tests to see if the folder to hold the year's classes exists
if ! test -d $strSchoolYearDir; then
    mkdir $strSchoolYearDir
fi

##### CLASS 1

#checks to see if the directory for the class exists
if ! test -d $strClass1Dir; then
    mkdir $strClass1Dir
fi

#loops through files in class directory
for strFile in "$strClass1"/*; do

    strFileName=$(basename "$strFile")

    #tests to see if any files/directories in the class directory
    #already exist in class directory
    if ! test -e "$strClass1Dir/$strFileName"; then
        cp -r "$strFile" $strClass1Dir

    #Gives option to overwrite existing version of file
    else
        echo Would you like to overwrite the \"$strFileName\" file/directory? y/n
        read choice

        if [ "$choice" = 'y' ]; then
            cp -r "$strFile" $strClass1Dir
        elif [ "$choice" = 'n' ]; then
            echo skipping \"$strFileName\"
        else
            echo "Invalid Input"
            exit 1
        fi
    fi

done

##### CLASS 2

#checks to see if the directory for the class exists
if ! test -d $strClass2Dir; then
    mkdir $strClass2Dir
fi

#loops through files in class directory
for strFile in "$strClass2"/*; do

    strFileName=$(basename "$strFile")

    #tests to see if any files/directories in the class directory
    #already exist in class directory
    if ! test -e "$strClass2Dir/$strFileName"; then
        cp -r "$strFile" $strClass2Dir

    #Gives option to overwrite existing version of file
    else
        echo Would you like to overwrite the \"$strFileName\" file/directory? y/n
        read choice

        if [ "$choice" = 'y' ]; then
            cp -r "$strFile" $strClass2Dir
        elif [ "$choice" = 'n' ]; then
            echo skipping \"$strFileName\"
        else
            echo "Invalid Input"
            exit 1
        fi
    fi

done

##### CLASS 3

#checks to see if the directory for the class exists
if ! test -d $strClass3Dir; then
    mkdir $strClass3Dir
fi

#loops through files in class directory
for strFile in "$strClass3"/*; do

    strFileName=$(basename "$strFile")

    #tests to see if any files/directories in the class directory
    #already exist in class directory
    if ! test -e "$strClass3Dir/$strFileName"; then
        cp -r "$strFile" $strClass3Dir

    #Gives option to overwrite existing version of file
    else
        echo Would you like to overwrite the \"$strFileName\" file/directory? y/n
        read choice

        if [ "$choice" = 'y' ]; then
            cp -r "$strFile" $strClass3Dir
        elif [ "$choice" = 'n' ]; then
            echo skipping \"$strFileName\"
        else
            echo "Invalid Input"
            exit 1
        fi
    fi

done