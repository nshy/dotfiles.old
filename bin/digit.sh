#!/bin/bash
# Usage: PROGRAM_NAME DIR
# Makes next conversion.
#   file0.x     -> file000.x
#   file1.x     -> file001.x
#   .....
#   file10.x    -> file010.x
#   .....
#   file100.x   -> file100.x
# Number field width is calculated automatically.

set -e
dir=$1

if [[ -z $dir ]]; then
  sed -rn "/^\$/{g;p;q};s/# (.*)/\\1/;s/PROGRAM_NAME/$(basename $0)/;2h;3,\$H" $0
fi

if [[ ! -d $dir ]]; then
  echo "Invalid directory path '$dir'"
  exit 1
fi

cd "$dir"
pos=0

# determine pos
while read file
do
  [[ $file =~ [[:digit:]]+ ]] || continue
  len=${#BASH_REMATCH}
  if [[ $len -gt $pos ]]; then
    pos=$len
  fi
done < <(ls -1)

declare -i rn=0 
# rename files
while read file
do
  [[ $file =~ ^([^[:digit:]]*)([[:digit:]]+)([^[:digit:]]*)$ ]] || continue
  pref=${BASH_REMATCH[1]}
  num=${BASH_REMATCH[2]}
  suf=${BASH_REMATCH[3]}
  [[ $num =~ ^0*(.*)$ ]]
  numd=${BASH_REMATCH[1]}
  printf -v num2 "%.${pos}i" $numd
  if [[ $num != $num2 ]]; then
    file2="${pref}${num2}${suf}"
    mv $file $file2
    rn=rn+1
  fi
done < <(ls -1)

echo "Conversion finished successfully. $rn files renamed."
