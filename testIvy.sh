#!/usr/bin/env bash
IVY_PREFIX=/opt/apache-ivy
for version in "2.2.0" "2.3.0"  "2.4.0"
do
    rm -rf grapeIvy
    java -jar ${IVY_PREFIX}-$version/ivy-$version.jar -version
    java -jar ${IVY_PREFIX}-$version/ivy-$version.jar -settings ./grapeConfig.xml -cache grapeIvy -dependency 3rdparty tools default > ivy-$version.log
    if [[ $? != 0 ]]
    then
        echo "Error #1 with version $version"
    else
        echo "Success #1 with version $version"
    fi
    java -jar ${IVY_PREFIX}-$version/ivy-$version.jar -settings ./grapeConfig.xml -cache grapeIvy -dependency 3rdparty corba.jacorb 2.3.1 >> ivy-$version.log
    if [[ $? != 0 ]]
    then
        echo "Error #2 with version $version"
    else
        echo "Success #2 with version $version"
    fi
done
