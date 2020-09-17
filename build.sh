#!/bin/bash

mule=$1
cwd=$(pwd)
target=./target
currentDate=`date +"%d%b%Y"`
prefix=APDevDW${mule}
files=${target}/${prefix}_studentFiles_${currentDate}.zip
slides=${target}/${prefix}_studentSlides_${currentDate}.zip
instrSlides=${target}/${prefix}_instructorSlides_${currentDate}.zip
manual=${target}/${prefix}_studentManual_${currentDate}.pdf

if [ -d "$target" ]; then
    echo "Removing $target"
    rm -rf $target
fi

mkdir $target

# Create the student files
zip -r $files ./files

# Create the student slides
zip -r $slides ./slides/*.pdf

# Create the instructor slides
zip -r $instrSlides ./slides/*.pptx

# Create the student manual
cd ./manual
lualatex -pdf main.tex
cd ..
cp ./manual/main.pdf ${manual}
