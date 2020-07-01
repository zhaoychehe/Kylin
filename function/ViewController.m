//
//  ViewController.m
//  function
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import "ViewController.h"
#import "DTLauchItemManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

DT_FUNCTION_EXPORT(StgA,WEIBO)(){
    NSLog(@"初始化微博");
}


DT_FUNCTION_EXPORT(StgB,WriteCookie)(){
    NSLog(@"写入cookie");
}

@end
