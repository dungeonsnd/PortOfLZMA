
#include <stdio.h>
#include "lzma_util.h"

int main(int argc, char const *argv[])
{
    const char * inputFile ="../test_data/compress_test.log";
    const char * outputFile ="../test_data/compress_test.log.lzma";
    const char * outputFile2 ="../test_data/compress_test.log.decmp";
    char errMsg[800] ={0};

    int rt =Compress(inputFile, outputFile, errMsg);
    printf("Compress result code is %d \n", rt);
    if (0!=rt)
    {
        printf("Compress errMsg=%s \n", errMsg);
    }

    rt =Decompress(outputFile, outputFile2, errMsg);
    printf("Decompress result code is %d \n", rt);
    if (0!=rt)
    {
        printf("Decompress errMsg=%s \n", errMsg);
    }
    return 0;
}