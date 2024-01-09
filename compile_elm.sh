#!/bin/bash

for dir in */; do
    # Get the folder name
    folder=$(basename "$dir")
    
    # Navigate into the folder
    cd "$dir" || exit
    
    # Compile Elm file in the current directory to HTML
    elm make src/Main.elm --output="../dest/$folder.html"
    
    # Return to the main 'architecture' directory
    cd ../ || exit
done
