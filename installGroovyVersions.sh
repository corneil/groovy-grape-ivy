#!/usr/bin/env bash
source ~/.gvm/bin/gvm-init.sh
for version in "2.0.6" "2.1.9" "2.2.1" "2.2.2" "2.3.0" "2.3.1" "2.4.3"
do
    gvm install groovy "$version"
done