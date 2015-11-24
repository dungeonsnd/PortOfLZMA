//
//  LzmaCompress.m
//  ios_test
//
//  Created by mxw on 15/11/24.
//  Copyright © 2015年 mtzijin. All rights reserved.
//

#import "LzmaCompress.h"
#import "lzma_util.h"

@implementation LzmaCompress

+ (NSInteger)compress:(NSString *)inputFile
           outputFile:(NSString *)outputFile
          blockSucess:(void(^)(void))cbSucess
         blockFailure:(void(^)(void))cbFailure{
    return [LzmaCompress doJob:YES inputFile:inputFile outputFile:outputFile blockSucess:cbSucess blockFailure:cbFailure];
}


+ (NSInteger)decompress:(NSString *)inputFile
             outputFile:(NSString *)outputFile
            blockSucess:(void(^)(void))cbSucess
           blockFailure:(void(^)(void))cbFailure{
    return [LzmaCompress doJob:NO inputFile:inputFile outputFile:outputFile blockSucess:cbSucess blockFailure:cbFailure];
}

+ (NSInteger)doJob:(BOOL) isCompressJob
         inputFile:(NSString *)inputFile
        outputFile:(NSString *)outputFile
       blockSucess:(void(^)(void))cbSucess
      blockFailure:(void(^)(void))cbFailure{
    NSInteger rs =-1;
    do {
        if (!inputFile || !outputFile) {
            // TODO: Write WARN log.
            break;
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            char errMsg[800];
            int rt =isCompressJob?
            Compress([inputFile cStringUsingEncoding:NSASCIIStringEncoding], [outputFile cStringUsingEncoding:NSASCIIStringEncoding], errMsg):
            Decompress([inputFile cStringUsingEncoding:NSASCIIStringEncoding], [outputFile cStringUsingEncoding:NSASCIIStringEncoding], errMsg);
            
            if (0!=rt) {
                // TODO: Write WARN log.
                if (cbFailure) {
                    dispatch_async(dispatch_get_main_queue(), cbFailure);
                }
            }
            else {
                if (cbSucess) {
                    dispatch_async(dispatch_get_main_queue(), cbSucess);
                }
            }
            
        });
        
        rs =0;
    }while (0);
    return rs;
}

@end
