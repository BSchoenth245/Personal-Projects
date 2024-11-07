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


filetransfer () {
    if ! test -d $2; then
        mkdir $2
    fi

    #loops through files in class directory
    for strFile in "$1"/*; do

        strFileName=$(basename "$strFile")

        #tests to see if any files/directories in the class directory
        #already exist in class directory
        if ! test -e "$2/$strFileName"; then
            cp -r "$strFile" "$2"

        #Gives option to overwrite existing version of file
        else
            echo Would you like to overwrite the \"$strFileName\" file/directory? y/n
            read choice

            if [ "$choice" = 'y' ]; then
                cp -r "$strFile" $2
            elif [ "$choice" = 'n' ]; then
                echo skipping \"$strFileName\"
            else
                echo "Invalid Input"
                exit 1
            fi
        fi

    done
}


#Tests to see if the folder to hold the year's classes exists
if ! test -d $strSchoolYearDir; then
    mkdir $strSchoolYearDir
fi

filetransfer ${strClass1} ${strClass1Dir}

filetransfer ${strClass2} ${strClass2Dir}

filetransfer ${strClass3} ${strClass3Dir}
