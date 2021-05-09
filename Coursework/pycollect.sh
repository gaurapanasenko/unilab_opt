#!/bin/bash

FILES="`find . -path \"./src*\"`"

echo "\begin{multicols}{2}"
for i in $FILES
do
    echo "\noindent\cprotect\textbf{Файл \verb+$i+}"
    echo "\begin{ccode}"
    cat $i
    echo "\end{ccode}"
done
echo "\end{multicols}"

