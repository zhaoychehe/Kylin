//
//  ViewController.h
//  struct
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import <UIKit/UIKit.h>

struct ProtocolInfo{
    char *key;
    char *value;
};

#define ProtocolRegister(_key_,_value_)\
__attribute__((used)) static struct ProtocolInfo ProtocolInfo##_key_ \
__attribute__ ((used, section ("__DATA,ProtocolInfoData"))) =\
{\
    .key = #_key_,\
    .value = #_value_,\
};


@interface ViewController : UIViewController


@end

