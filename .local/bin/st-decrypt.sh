#!/bin/sh
# Usage:
# $ st_decrypt <passwd> [<encrypted_path> [<dest_path>]]
# where <encrypted_path> & <dest_path> both default to ./

if [ -z "$1" ]; then
    echo -e "You must enter a password:\n"
    echo "Usage:"
    echo "\$ st_decrypt <passwd> [<encrypted_path> [<dest_path>]]"
    echo "where <encrypted_path> & <dest_path> both default to ./"
else
    syncthing decrypt --password $1 ${2-./} --to ${3-./}
    rm -r *.syncthing-enc
fi
