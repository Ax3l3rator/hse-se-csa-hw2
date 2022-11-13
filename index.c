#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned long countNums(char* string, unsigned long length) {
    unsigned long counter = 0;
    for (unsigned long i = 0; i < length; ++i) {
        if (string[i] >= '0' && string[i] <= '9') {
            while (string[i] >= '0' && string[i] <= '9') {
                ++i;
            }
            ++counter;
        }
    }
    return counter;
}

int main(int argc, char* argv[]) {
    if(argc <= 1){
        return 1;
    }
    FILE* readf = fopen(argv[1], "r");
    if(readf == NULL){
        return 1;
    }
    static char str[100000000];
    unsigned long n = fread(str, 1, 100000000, readf);
    fclose(readf);
    FILE* writef = fopen(argv[2], "w");
    if(writef == NULL){
        return 1;
    }
    fprintf(writef, "%lu", countNums(str, n));
    fclose(writef);
    return 0;
}