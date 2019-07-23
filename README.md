# Pyspark Java8 Image

## Why?

If you are a spark developer then you have probably noticed that there are now many issues with installing Java8 using apt-get.

Read this notice for further info: http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html

Sadly spark still requires Java8 and will not support anything else.

This image is a hacky solution that compiles Python 3.7 on top of an existing openjdk-8 docker image.

# Versions

- Java8
- Python 3.7
- Pyspark 2.4.3

These should be able to work together. 

