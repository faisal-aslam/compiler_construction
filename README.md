It looks like there was a formatting issue in my previous message that caused the **"Compiling the Compiler"** section to appear outside the `README.md` block. Here’s the corrected version with everything properly included inside the `README.md` file:

```markdown
# SSC Compiler - Flex and Bison

This project is created and executed on **Ubuntu 22.04.4 LTS**. It uses **Flex 2.6.4** and **GNU Bison 3.8.2**. The project should work on other operating systems and software versions, but no guarantees are provided.

The videos explaining every aspect of this project are available on [YouTube](https://youtube.com/playlist?list=PLxP0p--aBHmL5uj9eecRFLIm1Qx2T8_sx&si=LvvqhGXqyp8faGQG).

## Project Organization

The project is organized into the following folders:

- **ssc-flex-bison**: Contains code for the Simple Simple C compiler using Flex and Bison, but no LLVM intermediate code is generated.
- **ssc-flex-bison-llvm**: Contains code for the Simple Simple C compiler using Flex, Bison, and LLVM intermediate code generation.

## Requirements

- Ubuntu 22.04.4 LTS or a similar Linux distribution
- Flex 2.6.4
- GNU Bison 3.8.2
- Clang++

## Compilation and Execution

### Navigating to the Directory

Before running any commands, make sure to navigate to the appropriate directory where the `Makefile` is located. For example:

```bash
cd ssc-flex-bison
```

### Compiling the Compiler

To compile the SSC compiler, use the following command:

```bash
make
```

This will generate the executable for the SSC compiler using Flex and Bison.

### Running the Compiler

To run the compiler with a sample input file (`input.ssc`), use:

```bash
make run
```

This command will compile the SSC code and output the results.

### Cleaning Up

To remove compiled and intermediate files, run:

```bash
make clean
```

To remove all generated files, including the output executable, run:

```bash
make distclean
```

### Help

To see the available `Makefile` commands, run:

```bash
make help
```

## Files in the ssc-flex-bison Folder

- `ssc.l`: The Flex file for the lexical analyzer
- `ssc.y`: The Bison file for the syntax and semantic analyzer
- 'IR.h': The header file containing all the C/C++ code.
- `input.ssc`: A sample input file containing Simple Simple C code to test if the compiler works

## Note

Ensure that you are in the correct directory (`ssc-flex-bison` or `ssc-flex-bison-llvm`) before running any commands. Each folder has its own `Makefile` and files necessary for compilation and execution.
```

Everything should now be properly inside the `README.md` content block. Let me know if further adjustments are needed!
