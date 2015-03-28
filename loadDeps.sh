#!/usr/bin/env bash
source ~/.gvm/bin/gvm-init.sh
for version in "2.0.6" "2.1.9"  "2.2.2"  "2.3.9"  "2.4.3"
do
    gvm install groovy "$version"
    gvm use groovy "$version"
    echo "Groovy $version"
    groovy -version
    rm -rf grape
    mkdir grape
    groovy -Dgrape.root=./grape -Dgrape.config=./grapeConfig.xml -Dgroovy.grape.report.downloads=true ensureDependencies.groovy
    if [[ $? != 0 ]]
    then
        echo "Error with version $version"
    else
        echo "Success with version $version"
    fi
 done
