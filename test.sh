#!/bin/bash

# toDO: check for files in inner folders, recursively?
for file in ./Routes/*.geojson
do
    VALID="valid!";
    # gjValidation="$(gjv "$file")";
    gjValidation="$(./node_modules/geojson-validation/bin/gjv "$file")";
    fieldValidation="$(node ./fieldValidation "${file}")";
    echo "${file}:";
    echo "geoJson validation: ${gjValidation}";
    echo "fields validation: ${fieldValidation}";
    echo "\n";

    if [ "$gjValidation" != "$VALID" ] || [ "$fieldValidation" != "$VALID" ]; then
        exit 2;
    fi
done

exit 0;