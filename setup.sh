#!/usr/bin/env bash

if [ -z `which xelatex` ]; then
  (curl --version > /dev/null) || ((brew --version > /dev/null) && (brew install curl > /dev/null))
  (curl --version > /dev/null) || ((apt-get --version > /dev/null) && (apt-get install curl -y > /dev/null))
  if [ ! -f /tmp/BasicTeX.pkg ]; then
    curl -L --silent "http://tug.org/cgi-bin/mactex-download/BasicTeX.pkg" > /tmp/BasicTeX.pkg
  fi
  sudo installer -pkg /tmp/BasicTeX.pkg -target /
  sudo /Library/TeX/texbin/tlmgr update --self
  sudo /Library/TeX/texbin/tlmgr install marvosym preprint supertabular titlesec
  rm /tmp/BasicTeX.pkg
fi
