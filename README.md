# Simple Simple C (SSC) Compiler Project

This project is developed and tested on **Ubuntu 22.04.4 LTS**. It uses **Flex 2.6.4** and **GNU Bison 3.8.2**. While the code should work on other operating systems and software versions, no guarantees are provided for compatibility.

The videos explaining every aspect of this project can be found in the following YouTube playlist:  
[SSC Compiler Video Series](https://youtube.com/playlist?list=PLxP0p--aBHmL5uj9eecRFLIm1Qx2T8_sx&si=LvvqhGXqyp8faGQG)

## Project Organization

The project is organized into two main folders:

- **ssc-flex-bison**:  
  This directory contains the code for the Simple Simple C (SSC) compiler, built using **Flex** and **Bison**. This version does not generate LLVM intermediate code.

- **ssc-flex-bison-llvm**:  
  This directory contains the code for the SSC compiler, also built using **Flex** and **Bison**, with support for generating LLVM intermediate code.

## Compilation

A `Makefile` is provided in each folder for easy compilation. To compile the project, navigate to the respective directory and run:

```bash
make
