#!/bin/bash

# Default values
ISA="rv64gcv_zba_zbb_zbc"
MABI="lp64d"
SOURCE="main.c"

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        ISA=*)
            ISA="${1#*=}"
            ;;
        MABI=*)
            MABI="${1#*=}"
            ;;
        SOURCE=*)
            SOURCE="${1#*=}"
            ;;
        *)
            echo "Invalid argument: $1"
            exit 1
            ;;
    esac
    shift
done

# Usage example: riscv64-unknown-elf-gcc -mabi=lp64 main.c
echo "ISA: $ISA, MABI: $MABI, SOURCE: $SOURCE"


riscv64-unknown-elf-gcc -O3 -march="$ISA" -mabi="$MABI" "$SOURCE"
spike -l --isa=rv64gcv_zicntr_zihpm_zicsr_zifencei_zba_zbb_zbc ../riscv-pk/build/pk a.out 2> spike.txt
#python3 ext1.py
./ext1

