#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned long fsize(char* file) {
    FILE* f = fopen(file, "r");
    fseek(f, 0, SEEK_END);
    unsigned long len = (unsigned long)ftell(f);
    fclose(f);
    return len;
}

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
    unsigned long n = fsize("./tests/in.txt"); // Длина строки в файле, что бы было проще выделить память и считать строку
    FILE* readf = fopen("./tests/in.txt", "r"); // Считываем из in.txt
    char* str = (char*)malloc(n * sizeof(char));
    for (unsigned long i = 0; i < n; ++i) {
        fscanf(readf, "%c", str + i); // Ввод посимвольный, потому что так удобнее
    }
    fclose(readf);
    FILE* writef = fopen("./tests/out.txt", "w");
    fprintf(writef, "%ld", countNums(str, n));
    fclose(writef);
    return 0;
}