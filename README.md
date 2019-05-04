# C-Parser

Parse C Syntex

## Dependency
 - Jlex - https://www.cs.princeton.edu/~appel/modern/java/JLex/
 - Jcup - http://www2.cs.tum.edu/projects/cup/

## Build
-  `jflex A4JF.jflex` - Build symbols.
-  `java -jar java-cup-11b.jar -interface -parser A4Parser -symbols A4Symbol A4JC.cup` - Parse sumbols
-  `javac -cp .;java-cup-11b-runtime.jar A4JF.java A4Parser.java A4Symbol.java Main.java`  - Run Main
-  `java -cp .;java-cup-11b-runtime.jar Main input.c` - Validate C file
