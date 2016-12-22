//
//  ViewController.m
//  CustomerProgress
//
//  Created by Ray on 16/10/12.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "ViewController.h"
#import "DPProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    DPCustomerView *rProgressView = [[DPCustomerView alloc]initWithFrame:CGRectMake(20, 100, 250, 30)] ;
     [self.view addSubview:rProgressView];
    
    
    
     
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        rProgressView.rCusProgressView.rProgress = 1 ;
        
        [rProgressView.rCusProgressView setCurValue:1 maxValue:5 minValue:1 degree:1] ;
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
