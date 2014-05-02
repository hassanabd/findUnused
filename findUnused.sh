Listpics=$(find . -type f | grep -E ".+(jpg|png|gif|jpeg)")
fileToLook=$(find . -type f | grep -E ".+(txt|json|xml|html|py|cpp)")

for image in  $Listpics; do 
    imgclear=1
    for textfile in $fileToLook; do

        echo Checking $(basename $image) in $textfile
        grep -q $(basename $image) $textfile 
        if [ $? -eq 0 ]; then
            echo $image found!
            imgclear=$?
        fi
    done
    if [ $imgclear -eq 1 ]; then
        echo $image
    fi
done
