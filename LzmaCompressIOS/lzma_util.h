
#ifndef _HEADER_FILE_LZMA_UTIL_H_
#define _HEADER_FILE_LZMA_UTIL_H_

#ifdef __cplusplus
extern "C" {
#endif

////
////  Add by Jeffery , 2015-11-23
////
int Compress(const char * inputFile, const char * outputFile, char errMsg[800]);

////
////  Add by Jeffery , 2015-11-23
////
int Decompress(const char * inputFile, const char * outputFile, char errMsg[800]);

#ifdef __cplusplus
}
#endif

#endif // _HEADER_FILE_LZMA_UTIL_H_
