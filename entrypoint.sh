#!/bin/bash

output_files=""
for notebook in $@; do
    notebook="/github/workspace/${notebook}"   # Prepend path

    echo "${notebook}: Converting"
    if sudo /opt/conda/bin/jupyter-nbconvert --to=pdf "${notebook}"; then
        echo "${notebook}: Convertion OK"
        output_files+="${notebook/.ipynb/.pdf} "
    else    
        echo "${notebook}: Convertion FAILED"
    fi

done

echo "::set-output name=output_files::${output_files%?}"
