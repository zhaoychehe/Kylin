//
//  ViewController.m
//  String
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
    
    NSArray <NSString *>*list = BHReadConfiguration(PHWebPlugins);
    NSLog(@"%@", list);
}


static NSArray<NSString *>* BHReadConfiguration(char *section) {
    NSMutableArray *configs = [NSMutableArray array];
    
    Dl_info info;
    dladdr(BHReadConfiguration, &info);
    
#ifndef __LP64__
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    unsigned long size = 0;
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, "__DATA", section, & size);
#else /* defined(__LP64__) */
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    unsigned long size = 0;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, "__DATA", section, & size);
#endif /* defined(__LP64__) */
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        char *string = (char*)memory[idx];
        
        NSString *str = [NSString stringWithUTF8String:string];
        if(!str)continue;
#ifdef DEBUG
        NSLog(@"config = %@", str);
#endif
        if(str) [configs addObject:str];
    }
    
    return configs;
}

@end
