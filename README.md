# Introduction
I am working on a Java project that started 13 years ago. Over the years they use different mechanism to build to artifacts from make to ant and ivy. The project has over 300 java modules and 2 million lines of code.
 
# Gradle 
When I joined I suggest moving to Gradle. The move to Gradle has been successful and we consolidated the work to Gradle and Groovy and Bash scripts. 

We started the project when Gradle was on 1.1 and kept upgrading the Gradle version to 1.11 and stayed on 1.11 for stability.

# Failure
Recently I start looking into moving the project to 2.x since I have used it successfully on other smaller projects and there are a few new features we can leverage.

However I picked some errors that took a while to track down but I have now isolated it to problem in some of our Groovy scripts that use Grape with the ivy repository of 3rdparty jars that was built up over the years.

# Reproduction
This project contains a small collection of artifacts that will make it easy to replicate the problem and illustrate that the code works with Groovy 2.0.x and 2.1.x but fails with 2.2.x or later.


| Groovy | Ivy |
|-------|------|
| 2.0.x | 2.2.0 |
| 2.1.x | 2.2.0 |
| 2.2.x | 2.3.0 |
| 2.3.x | 2.3.0 |
| 2.4.x | 2.4.0 |

  
# Requirements

installGroovyVersion.sh and loadDeps.sh uses [gvm](http://gvmtool.net) to install and switch to different versions of Groovy.

```{sh, engine='sh'}
curl -s get.gvmtool.net | bash
git clone https://github.com/corneil/groovy-grape-ivy.git groovy-grape-ivy
cd groovy-grape-ivy
./installGroovyVersion.sh
./loadDeps.sh
```
    
Each version creates a separate output file logging grape and ivy activity.    
