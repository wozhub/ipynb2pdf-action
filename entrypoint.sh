#!/bin/bash

ls -lR /github/workspace

output_files=""
for notebook in "$@"; do
    notebook="/github/workspace/${notebook}"   # Prepend path

    if sudo jupyter-nbconvert --to pdf "${notebook}"; then
        output_files+="${notebook/.ipynb/.pdf} "
    else    
        echo "${notebook} convertion fail"
    fi

done

echo "::set-output name=output_files::${output_files%?}"
