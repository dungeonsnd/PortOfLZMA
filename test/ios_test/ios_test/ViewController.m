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
    
    
    static BOOL bCompress =NO;
    if (bCompress) {
        [LzmaCompress compress:outFile outputFile:outFile2];
        [self.compressBtn setTitle:@"Decompress" forState:UIControlStateNormal];
        bCompress =NO;
    } else {
        [LzmaCompress decompress:inFile outputFile:outFile];
        [self.compressBtn setTitle:@"Compress" forState:UIControlStateNormal];
        bCompress =YES;
    }
    
}

@end
