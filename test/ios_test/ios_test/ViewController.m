//
//  ViewController.m
//  ios_test
//
//  Created by mxw on 15/11/24.
//  Copyright © 2015年 mtzijin. All rights reserved.
//

#import "ViewController.h"
#import "LzmaCompress.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *compressBtn;

- (IBAction)btnCompress:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.compressBtn setTitle:@"Decompress" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCompress:(UIButton *)sender {
    
    NSString *inFile = [[NSBundle mainBundle] pathForResource:@"compress_test.log.7z" ofType:nil];
    NSString *tmpDir = NSTemporaryDirectory();
    NSString *outFile =[NSString stringWithFormat:@"%@/compress_test.log", tmpDir];
    NSString *outFile2 =[NSString stringWithFormat:@"%@/compress_test.log.7z", tmpDir];
    
    
    static BOOL toCompress =NO;
    
    if (toCompress) {
        [LzmaCompress compress:outFile
                    outputFile:outFile2
                   blockSucess:^(){
                       NSLog(@"---- Compress sucess");
                       [self.compressBtn setTitle:@"Decompress" forState:UIControlStateNormal];
                   }
                  blockFailure:^(){
                      NSLog(@"#### Compress failed");
                      [self.compressBtn setTitle:@"Compress failed." forState:UIControlStateNormal];
                  }
         ];
        
        [self.compressBtn setTitle:@"Compressing ... " forState:UIControlStateNormal];
        toCompress =NO;
    } else {
        [LzmaCompress decompress:inFile
                      outputFile:outFile
                     blockSucess:^(){
                         NSLog(@"---- Decompress sucess");
                         [self.compressBtn setTitle:@"Compress" forState:UIControlStateNormal];
                     }
                    blockFailure:^(){
                        NSLog(@"#### Decompress failed");
                        [self.compressBtn setTitle:@"Decompress failed." forState:UIControlStateNormal];
                    }
         ];
        
        [self.compressBtn setTitle:@"Decompressing ... " forState:UIControlStateNormal];
        toCompress =YES;
    }
    
}

@end
