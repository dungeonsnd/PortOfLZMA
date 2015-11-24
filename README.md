# PortOfLZMA
#### Port of LZMA SDK for iOS / Android.



##LZMA
LZMA is the default and general compression method of 7z format in the 7-Zip program. LZMA provides a high compression ratio and very fast decompression, so it is very suitable for embedded applications. For example, it can be used for ROM (firmware) compressing.


##Status
This project is the port of lzma for iOS and Android .
I have already tested on my iphone5s and the simulator 6SP.


##Usage
Add the LzmaCompressIOS folder to your project, and enable BITCODE.

```
[LzmaCompress decompress:inFile outputFile:outFile];
[LzmaCompress compress:outFile outputFile:outFile2];
```


##TODO
1 Android surpport
2 Cocopods surpport


##Author
jeffery
dungeonsnd at gmail dot com


##License
PortOfLZMA is available under the MIT license. See the LICENSE file for more info. 
LZMA is under his own license (Please refer to http://www.7-zip.org/sdk.html ) .


##Notes
The follow is a compression example, 
```
compress_test $ du -sk *
40964   compress_test.log
1092    compress_test.log.7z
2428    compress_test.log.gz
1172    compress_test.log.lzma
1096    compress_test.log.xz

compress_test $ du -sh *
 40M    compress_test.log
1.1M    compress_test.log.7z
2.4M    compress_test.log.gz
1.1M    compress_test.log.lzma
1.1M    compress_test.log.xz
```


