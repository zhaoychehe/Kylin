//
//  main.m
//  Kylin
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

__attribute__((constructor)) void begin()
{
    printf("constructor is called.\n");
}
__attribute__((destructor)) void end()
{
    printf("destructor is called.\n");
}

int main(int argc, char * argv[]) {
    printf ("this is main function\n");
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
