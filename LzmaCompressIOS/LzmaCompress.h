//
//  LzmaCompress.h
//  ios_test
//
//  Created by mxw on 15/11/24.
//  Copyright © 2015年 mtzijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LzmaCompress : NSObject


+ (NSInteger)compress:(NSString *)inputFile
           outputFile:(NSString *)outputFile
            blockSucess:(void(^)(void))cbSucess
            blockFailure:(void(^)(void))cbFailure;

+ (NSInteger)decompress:(NSString *)inputFile
             outputFile:(NSString *)outputFile
              blockSucess:(void(^)(void))cbSucess
              blockFailure:(void(^)(void))cbFailure;

@end
