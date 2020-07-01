//
//  ViewController.m
//  MustOverrider
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import "ViewController.h"
#import "RAMMustOverrider.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)mustOverrideFunction
{
    RAM_SUBCLASS_MUST_OVERRIDE;
}


@end
