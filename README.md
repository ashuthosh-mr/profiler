# PARISCV profiler
Instruction profiler that suggests extensions, sub-instructions.

# Getting Started

Welcome to our project! This guide will help you get started quickly.

## Dependencies

Before running the project, make sure you have the following dependencies installed:

- Python3>= 3.9.5
- matplotlib
- [riscv toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain/)

After installing the dependencies, next install the profiler.


## Installing PARISCV

To install PARISCV, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/ashuthosh-mr/profiler.git
    ```

2. Navigate to the project directory:

    ```bash
    cd pariscv
    ```

3. Unzip the necesary library files:

    ```bash
    unxz internal_folder.tar.xz
    tar -xvf internal_folder.tar
    ```

4. To profile the region of interest in the application, place this line before the kernel:

    ```bash
    unsigned long cycles_start,cycles_end;
    asm volatile ("rdcycle %0" : "=r" (cycles_start));
    ```

5. Similarly, place thhis line after the kernel.

   ```bash
   asm volatile ("rdcycle %0" : "=r" (cycles_end));
   printf("Total cycles:%d\n",cycles_end-cycles_start);
   ```
## Profiling

To profile any given application, just run:

   ```bash
   ./pariscv.sh
   ```
Default ISA, MABI, source names are used as shown in pariscv.sh. But one can further specify the ISA flags suppported, mabi and path to the source file through the following flags:

   ```bash
   ./pariscv.sh ISA=rv64gcv_zba_zbb_zbc MABI=lp64d SOURCE=../../main.c
   ```
The output shows the total cycles, commonly used extensions and commonly used instructions within each extension.

You can find detailed documentation and usage examples on the [project's web page](https://ashuthosh.de/pariscv-site/).
