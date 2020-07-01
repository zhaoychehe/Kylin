//
//  ViewController.m
//  struct
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import "ViewController.h"
#include <dlfcn.h>
#include <mach-o/getsect.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self readDataFromMachO];
}

- (void)readDataFromMachO {
    //1.根据符号找到所在的mach-o文件信息
        Dl_info info;
        dladdr((__bridge void *)[self class], &info);
    
    //2.读取__DATA中自定义的ProtocolInfoDataz数据
    #ifndef __LP64__
        const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
        unsigned long schemeSize = 0;
        uint32_t *schemeMemory = (uint32_t*)getsectiondata(mhp, "__DATA", "ProtocolInfoData", &schemeSize);
    #else /* defined(__LP64__) */
        const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
        unsigned long schemeSize = 0;
        uint64_t *schemeMemory = (uint64_t*)getsectiondata(mhp, "__DATA", "ProtocolInfoData", &schemeSize);
     
    #endif /* defined(__LP64__) */
    
    //3.遍历ProtocolInfoData中的协议数据
    unsigned long schemeCounter = schemeSize/sizeof(struct ProtocolInfo);
    struct ProtocolInfo *items = (struct ProtocolInfo*)schemeMemory;
    for(int idx = 0; idx < schemeCounter; ++idx){
        NSString * key = [NSString stringWithUTF8String:items[idx].key];
        NSString * value = [NSString stringWithUTF8String:items[idx].value];;
        NSLog(@"-------------key:%@ , value:%@",key,value);
    
    }
}

@end
