#!/usr/bin/env bash
set -e # Stop if any errors
#set -x # Uncomment to debug

if [ -z "$(which xelatex)" ]; then
  (curl --version > /dev/null) || ( (brew --version > /dev/null) && (brew install curl > /dev/null) )
  (curl --version > /dev/null) || ( (apt-get --version > /dev/null) && (apt-get install curl -y > /dev/null) )
  if [ ! -f /tmp/BasicTeX.pkg ]; then
    curl -L --silent "https://mirror.ctan.org/systems/mac/mactex/MacTeX.pkg" > /tmp/BasicTeX.pkg
  fi
  sudo installer -pkg /tmp/BasicTeX.pkg -target /
  sudo /Library/TeX/texbin/tlmgr update --self
  sudo /Library/TeX/texbin/tlmgr install marvosym preprint supertabular titlesec
  echo 'export PATH="${PATH}:/usr/local/texlive/2016basic/bin/universal-darwin"' >> ~/.bash_profile
  echo "Installation successful, please make sure to run 'source ~/.bash_profile' to ensure xelatex is in your path"
  rm /tmp/BasicTeX.pkg
fi
