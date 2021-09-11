#!/bin/sh
IFS_ORIG=$IFS #save original IFS will restore at end
set -f #Disable filename expansion (globbing).
IFS=$'\n'
for img in `find . -name "*" | egrep *\.jpe?g$`
do
  idout=`identify -verbose $img | grep -i interlace | grep -i none$`

  if [[ -z $idout ]]
  then
    echo "-------------------------"
    echo "$img is progressive"
    # echo "....making copy of original with .prog extension"
    # /bin/cp -f $img $img.prog
    echo "....converting to baseline"
    convert $img -interlace none $img
    echo "....done!"
  #else
    #echo "$img is non-progressive"
  fi
done
set +f
IFS=$IFS_ORIG
