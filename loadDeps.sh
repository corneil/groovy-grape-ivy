#!/usr/bin/env bash
source ~/.gvm/bin/gvm-init.sh
for version in "2.0.6" "2.1.9" "2.2.1" "2.2.2" "2.3.0" "2.3.1" "2.4.3"
do
    gvm use groovy "$version"
    groovyVersion=$(groovy -version)
    if [[ $groovyVersion == *"$version"* ]]
    then
        echo "$groovyVersion"
        rm -rf grape
        mkdir grape
        ENS_OPTIONS="-Dgrape.root=./grape -Dgrape.config=./grapeConfig.xml -Dgroovy.grape.report.downloads=false -Divy.message.logger.level=4"
        for script in "ensureDependencies.groovy" "ensureDependencies2.groovy" "ensureDependencies3.groovy" "ensureDependencies4.groovy"
        do
            groovy $ENS_OPTIONS $script >> output-$version.log
            if [[ $? != 0 ]]
            then
                echo "Error in $script with version $version"
            else
                echo "Success in $script with version $version"
            fi
        done
    else
        echo "Expected $version in $groovyVersion"
    fi
 done
