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

int main(void) {
    FILE* readf = fopen("./tests/in.txt", "r"); // Считываем из in.txt
    static char str[100000000];
    unsigned long n = fread(str, 1, 100000000, readf);
    fclose(readf);
    FILE* writef = fopen("./tests/out.txt", "w");
    fprintf(writef, "%lu", countNums(str, n));
    fclose(writef);
    return 0;
}