# PortOfLZMA
#### Port of LZMA SDK for iOS / Android.



##LZMA
LZMA is the default and general compression method of 7z format in the 7-Zip program. LZMA provides a high compression ratio and very fast decompression, so it is very suitable for embedded applications. For example, it can be used for ROM (firmware) compressing.


##Status
This project is the port of lzma for iOS , Android and Linux , Windows  platforms.

For iOS:
I have already tested on my iphone5s and the simulator 6SP.

The compressed file can be decompress on Win7 by the 7-Zip program( download from http://www.7-zip.org/a/7z1512.exe ).

For linux/OSX:
I have tested using the files in LzmaCompressUnixC.


##Usage
Add the LzmaCompressIOS folder to your project, and enable BITCODE.

```
[LzmaCompress compress:outFile
            outputFile:outFile2
           blockSucess:^(){
               [self.compressBtn setTitle:@"Decompress" forState:UIControlStateNormal];
           }
          blockFailure:^(){
              [self.compressBtn setTitle:@"Compress failed." forState:UIControlStateNormal];
          }

[LzmaCompress decompress:inFile
            outputFile:outFile
            blockSucess:^(){
                [self.compressBtn setTitle:@"Compress" forState:UIControlStateNormal];
            }
            blockFailure:^(){
                [self.compressBtn setTitle:@"Decompress failed." forState:UIControlStateNormal];
            }
```


##TODO
1 Android surpport

2 Stream compress/decompress surpport.       For now,  PortOfLZMA only surpport file compress/decompress.

3 Cocopods surpport

4 Optimize memory usage
 
5 LZMA2 support
 
6 MS-Windows surpport


##Author
jeffery

email:
dungeonsnd at gmail dot com

github addr:
https://github.com/dungeonsnd/PortOfLZMA


##License
PortOfLZMA is available under the MIT license. See the LICENSE file for more info. 

LZMA is under his own license (Please refer to http://www.7-zip.org/sdk.html ) .


##Notes
The follow is a compression example,  '.lzma' is our compression result.
40MB, compress cost 15seconds, 190MB memory. decompress cost 2secons, 20MB memory.
```
compress_test $ du -sk *
40964   compress_test.log
1092    compress_test.log.7z
2428    compress_test.log.gz

> 1172  compress_test.log.lzma

1096    compress_test.log.xz

compress_test $ du -sh *
 40M    compress_test.log
1.1M    compress_test.log.7z
2.4M    compress_test.log.gz

> 1.1M  compress_test.log.lzma

1.1M    compress_test.log.xz
```


