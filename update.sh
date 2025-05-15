#!/bin/bash
set -e


# Check if Formula/zhobo.rb exists
if [ ! -f "Formula/zhobo.rb" ]; then
  echo "Error: Formula/zhobo.rb does not exist."
  exit 1
fi

# Check if a version/tag is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <tag>"
    exit 1
fi

TAG="$1"

# make a tmp directory and check this directory is empty.
mkdir -p tmp/
if [ -n "$(ls -A tmp/)" ]; then
    echo "please delete the files, first"
    exit 1
fi

# download
gh release download "$TAG" -R kyoto7250/zhobo --pattern "*.tar.gz" -D tmp/
curl https://github.com/kyoto7250/zhobo/archive/refs/tags/$TAG.tar.gz -o tmp/$TAG.tar.gz

# update
python3 update.py

# Lastly, check the value on my eyes...
sha256 tmp/*