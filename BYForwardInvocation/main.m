//
//  main.m
//  ForwardInvocation
//
//  Created by xiebangyao on 2018/8/4.
//  Copyright © 2018年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MethodResolution.h"
#import "LostMethodClass_FastFowarding.h"
#import "LostMethodClass_NormalFowarding.h"
#import "DoesNotRecognizeSelector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        //方法一：动态方法解析
        MethodResolution *mr = [MethodResolution new];
        [mr performSelector:@selector(nonExistentMethod) withObject:nil];
        
        //方法二：重定向
        LostMethodClass_FastFowarding *lf = [LostMethodClass_FastFowarding new];
        [lf performSelector:@selector(nonExistentMethod) withObject:nil];
        
        //方法三：消息转发
        LostMethodClass_NormalFowarding *ln = [LostMethodClass_NormalFowarding new];
        [ln performSelector:@selector(nonExistentMethod) withObject:nil];
        
        //奔溃前做点事情
//        DoesNotRecognizeSelector *dn = [DoesNotRecognizeSelector new];
//        [dn performSelector:@selector(nonExistentMethod) withObject:nil];
        
#pragma clang diagnostic pop
    }
    
    return 0;
}
