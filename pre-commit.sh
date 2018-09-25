#!/bin/sh
  
IS_ERROR=0

CHECK_FILES=(.idea package-lock.json hook_sample.txt)

staged_file=(`git diff --cached --name-status | cut -c3-`)

for FILE in $staged_file
do
    if [ $FILE == *".idea"* ]
    then
       echo "Error: Can't commit. ${FILE} exists in the commiting files***"
       IS_ERROR=1
    elif [ $FILE == *"package-lock.json"* ]
    then
       echo "Error: Can't commit. ${FILE} exists in the commiting files***"
       IS_ERROR=1
    # additional statements
    #elif [ $FILE == *"hook"* ]
    #then
    #   echo "Error: Can't commit. ${FILE} exists in the commiting files***"
    #   IS_ERROR=1
    fi
done
exit $IS_ERROR