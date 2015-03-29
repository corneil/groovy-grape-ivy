#!/usr/bin/env bash
source ~/.gvm/bin/gvm-init.sh
for version in "2.0.6" "2.1.9"  "2.2.2"  "2.3.9"  "2.4.3"
do
    gvm use groovy "$version"
    groovyVersion=$(groovy -version)
    if [[ $groovyVersion == *"$version"* ]]
    then
        echo "$groovyVersion"
        rm -rf grape
        mkdir grape
        ENS_OPTIONS="-Dgrape.root=./grape -Dgrape.config=./grapeConfig.xml -Dgroovy.grape.report.downloads=true -Divy.message.logger.level=4"
        groovy $ENS_OPTIONS ensureDependencies.groovy > output-$version.log
        if [[ $? != 0 ]]
        then
            echo "Error #1 with version $version"
        else
            echo "Success #1 with version $version"
        fi
        groovy $ENS_OPTIONS ensureDependencies2.groovy >> output-$version.log
        if [[ $? != 0 ]]
        then
            echo "Error #2 with version $version"
        else
            echo "Success #2 with version $version"
        fi
        groovy $ENS_OPTIONS ensureDependencies3.groovy >> output-$version.log
        if [[ $? != 0 ]]
        then
            echo "Error #3 with version $version"
        else
            echo "Success #3 with version $version"
        fi
        groovy $ENS_OPTIONS ensureDependencies4.groovy >> output-$version.log
        if [[ $? != 0 ]]
        then
            echo "Error #4 with version $version"
        else
            echo "Success #4 with version $version"
        fi
    else
        echo "Expected $version in $groovyVersion"
    fi
 done
