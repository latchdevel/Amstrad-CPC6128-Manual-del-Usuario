#!/bin/bash

# Fix markdown file links to add .md extension

# Markdown (.md) file folder
SRC_DIR="./src"

# List of .md files
MD_FILES="`ls -1 $SRC_DIR/*.md`"

# For each .md file in the list                                    
for MD_FILE in $MD_FILES; do

    # Get .md file link from file name
    MD_LINK=`echo $MD_FILE |sed -e s/.*\\\///`

    # Get link name to fix
    MD_LINK_SEARCH=`echo $MD_LINK |sed -e s/.md//`

    # For each .md file in the list 
    for FIX_FILE in $MD_FILES; do
        # Fix each link found without .md extension
        sed -ie s/$MD_LINK_SEARCH/$MD_LINK/ $FIX_FILE
    done

    # Fix double .md extension if it appears
    sed -ie s/.md.md/.md/ $MD_FILE
done

