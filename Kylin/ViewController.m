//
//  ViewController.m
//  Kylin
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import "ViewController.h"
#import "RAMExport.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test {
    [RAMExport.sharedInstance executeArrayForKey:@"A"];

    [RAMExport.sharedInstance executeBlockForKey:@"A"];

    NSString *str = [RAMExport.sharedInstance valueForKey:@"S"];
    NSLog(@"%@", str);
    
    if ([RAMExport.sharedInstance hasPlacedAtSection:@"__ram.data"]) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
}

@end
