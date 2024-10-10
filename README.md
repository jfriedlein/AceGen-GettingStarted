# AceGen-GettingStarted
Some basic examples to get started with Mathematica+AceGen to build functions, material models, element formulations for Matlab/Fortran/C++

## AceGen
<img src="https://github.com/jfriedlein/AceGen-GettingStarted/blob/main/Flying%20with%20AceGen.png" width=85% height=85%>

## How to use this
Download the entire repository and unpack it somewhere on your hard drive.
Make sure you have Mathematica and AceGen installed. Check this by opening "Step001_Basics" and evaluating the notebook "AceGen-InCalcOut.nb". If AceGen starts and no errors occur in Mathematica or AceGen, everything should be up and running.
Note that AceGen is a package for Mathematica. So before using AceGen, you should dig into Mathematica (see for instance [Using Mathematica](#using-mathematica)).
Start for instance by looking at the table of contents "TOC.nb", which summarises what the steps do and links to them (currently only a few steps are incorporated).
Start reading the comments and commands in "Step001_Basics", understand what is going on and why, start playing with the code, change values/syntax/commands, etc. Continue with the steps one-by-one or pick interesting topics.

todo add dependency graph of steps, for instance as for deal.II

## Step numbering
- "Step0xx": basics, fundamentals, command usage
    - "Step02x": Conditions
    - "Step03x": Loops
    - "Step04x": Modularisation
    - "Step06x": Integrate
    - optional: ...
- "Step1xx": usage for material modelling
    - "Step10x": elasticity
    - "Step11x": plasticity
    - optional: thermal, coupled, ...
- "Step2xx": usage for element formulations

## Using Mathematica
- 35 min video with basics: https://www.youtube.com/watch?app=desktop&v=EXZQDpKu_mQ
- Fast introduction for programmers: https://www.wolfram.com/wolfram-u/courses/programming-applications/fast-introduction-for-programmers-dev901/
- 11 page PDF: https://lea-santos.scholar.uconn.edu/wp-content/uploads/sites/3599/2023/07/Py_Lec13_CrashCourseMathematica.pdf
- 30 page PDF (in German): https://www.lrz.de/services/software/compalg/mma/mmacrashkurs.pdf
- course: https://github.com/ruddyscent/c2m2s?tab=readme-ov-file
- ... or any other source you find on the internet, in books, etc.

## Health warning
I am not an expert in Mathematica or AceGen. These are mainly examples where I try to figure things out. Please use the provided material with care. It is only meant to assist people to get started. For credible and proven AceGen code and procedures please refer to the AceGen manual and help.

## Extension, correction, bugs
If you find errors or bugs, please let met know. I am very happy to improve the material and continue to learn.

## Software versions
implemented and tested for Mathematica 12 + AceFEM_Linux_7.509_585704
