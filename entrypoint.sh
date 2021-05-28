#!/bin/bash

cd /github/workspace || exit 1

output_files=""
for notebook in "$@"; do

    if jupyter-nbconvert --to pdf "${notebook}"; then
        output_files+="${notebook/.ipynb/.pdf} "
    else    
        echo "${notebook} convertion fail"
    fi

done

echo "::set-output name=output_files::${output_files%?}"
