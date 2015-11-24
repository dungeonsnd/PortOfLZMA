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


+ (NSInteger)compress:(NSString *)inputFile outputFile:(NSString *)outputFile{
    char errMsg[800];
    return Compress([inputFile cStringUsingEncoding:NSASCIIStringEncoding], [outputFile cStringUsingEncoding:NSASCIIStringEncoding], errMsg);
}

+ (NSInteger)decompress:(NSString *)inputFile outputFile:(NSString *)outputFile{
    char errMsg[800];
    return Decompress([inputFile cStringUsingEncoding:NSASCIIStringEncoding], [outputFile cStringUsingEncoding:NSASCIIStringEncoding], errMsg);
}

@end
