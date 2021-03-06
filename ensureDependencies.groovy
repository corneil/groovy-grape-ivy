#!/usr/bin/env groovy
import groovy.grape.Grape
try {
    println 'Ensure loading of dependencies'
    Grape.grab(group: '3rdparty', module: 'corba.jacorb', version: '2.3.1')
    Grape.grab(group: '3rdparty', module: 'logging.slf4j', version: '1.7.5')
    println 'Dependencies loaded'
} catch (Throwable x) {
    x.printStackTrace(System.out)
    System.err.println(x.getMessage())
    System.exit(1)
}