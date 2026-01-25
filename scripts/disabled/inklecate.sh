#!/bin/bash

curl -sLo /tmp/inklecate.zip "https://github.com/inkle/ink/releases/latest/download/inklecate_linux.zip"
unzip -q /tmp/inklecate.zip -d /tmp/inklecate
mv /tmp/inklecate $HOME/apps
rm -f /tmp/inklecate.zip
ln -s $HOME/apps/inklecate/inklecate $HOME/.local/bin/inklecate


