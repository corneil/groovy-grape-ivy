#!/usr/bin/env groovy
import groovy.grape.Grape
try {
    println 'Ensure loading of dependencies'
    Grape.grab(group: '3rdparty', module: 'tools', version: 'default')
    println 'Dependencies loaded'
} catch (Throwable x) {
    x.printStackTrace(System.out)
    System.err.println(x.getMessage())
    System.exit(1)
}