#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>

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

void generateString(char* s, unsigned long n) {
    for (unsigned long i = 0; i < n; ++i) {
        s[i] = rand() % 127 + 1;
    }
}

int main(int argc, char** argv) {
    unsigned long n;
    static char str[100000000];
    unsigned long res;
    if(argc <= 1){
        return 1;
    }
    if(strcmp(argv[1], "-r") == 0) {
        srand(time(0));
        n = rand() % 100000001;
        generateString(str, n);
        clock_t time = clock();
        res = countNums(str, n);
        time = clock() - time;
        printf("%lu\n", res);
        printf("Execution time:%lf\n", (double)time / CLOCKS_PER_SEC);
    }
    else if(strcmp(argv[1], "-c") == 0) {
        n = fread(str, 1, 100000000, stdin);
        clock_t time = clock();
        res = countNums(str, n);
        time = clock() - time;
        printf("%lu\n", res);
        printf("Execution time:%lf\n", (double)time / CLOCKS_PER_SEC);

    }
    else {
        FILE* readf = fopen(argv[1], "r");
        if(readf == NULL){
            printf("No such file\n");
            return 1;
        }
        n = fread(str, 1, 100000000, readf);
        printf("%d", n);
        fclose(readf);
        FILE* writef = fopen(argv[2], "w");
        clock_t time = clock();
        res = countNums(str, n);
        time = clock() - time;
        printf("Execution time:%lf\n", (double)time / CLOCKS_PER_SEC);
        fprintf(writef, "%lu", res);
        fclose(writef);
    }
    return 0;
}