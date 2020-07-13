//
//  ViewController.m
//  Kylin
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import "ViewController.h"
#import "RAMExport.h"
#import <sys/sysctl.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimeInterval t = [self.class processStartTime];
    NSLog(@"%f", t);
    
    [self test];
}

#pragma mark - 获取进程时间
+ (NSTimeInterval)processStartTime
{   // 单位是毫秒
    struct kinfo_proc kProcInfo;
    if ([self processInfoForPID:[[NSProcessInfo processInfo] processIdentifier] procInfo:&kProcInfo]) {
        return kProcInfo.kp_proc.p_un.__p_starttime.tv_sec * 1000.0 + kProcInfo.kp_proc.p_un.__p_starttime.tv_usec / 1000.0;
    } else {
        NSAssert(NO, @"无法取得进程的信息");
        return 0;
    }
}
+ (BOOL)processInfoForPID:(int)pid procInfo:(struct kinfo_proc*)procInfo
{
    int cmd[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PID, pid};
    size_t size = sizeof(*procInfo);
    return sysctl(cmd, sizeof(cmd)/sizeof(*cmd), procInfo, &size, NULL, 0) == 0;
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
