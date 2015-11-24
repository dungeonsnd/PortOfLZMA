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

- (IBAction)btnCompress:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCompress:(UIButton *)sender {
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"compress_test.log" ofType:nil];
    NSString *tmpDir = NSTemporaryDirectory();
    NSString *outFile =[NSString stringWithFormat:@"%@/compress_test.log.7z", tmpDir];
    [LzmaCompress compress:file outputFile:outFile];
}

@end
