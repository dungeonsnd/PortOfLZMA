# PortOfLZMA
Port of LZMA SDK for iOS / Android and c / c++.

LZMA is the default and general compression method of 7z format in the 7-Zip program. LZMA provides a high compression ratio and very fast decompression, so it is very suitable for embedded applications. For example, it can be used for ROM (firmware) compressing.


This project is the port of lzma for iOS and Android .


The follow is a compression example, 

compress_test $ du -sk *
40964	compress_test.log
1092	compress_test.log.7z
2428	compress_test.log.gz
1172	compress_test.log.lzma
1096	compress_test.log.xz

compress_test $ du -sh *
 40M	compress_test.log
1.1M	compress_test.log.7z
2.4M	compress_test.log.gz
1.1M	compress_test.log.lzma
1.1M	compress_test.log.xz


