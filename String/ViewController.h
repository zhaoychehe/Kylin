//
//  ViewController.h
//  String
//
//  Created by Ryan on 2020/7/1.
//  Copyright © 2020 Axonomy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PHWebPlugins "PHWebPlugins"

#define PHWebPluginDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))
#define PHRegisterWhiteList(name) \
class PHJavaScriptBridge; char * k##name##_mod PHWebPluginDATA(PHWebPlugins) = ""#name"";


@interface ViewController : UIViewController


@end

