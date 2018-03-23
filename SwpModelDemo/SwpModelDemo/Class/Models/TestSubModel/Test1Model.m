
//
//  Test1Model.m
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "Test1Model.h"

@implementation Test1Model

/**
 *  @author swp_song
 *
 *  @brief  test1Init   ( 快速初始化 )
 *
 *  @return TestModel
 */
+ (instancetype)test1Init {
    Test1Model *test1 = [Test1Model new];
    [test1 defaultValue];
    return test1;
}

/**
 *  @author swp_song
 *
 *  @brief  defaultValue ( 设置默认值 )
 */
- (void)defaultValue {
    [super defaultValue];
    self.testNSString   = [NSString stringWithFormat:@"%@", NSStringFromClass(self.superclass)];
    _test1NSString      = [NSString stringWithFormat:@"%@", NSStringFromClass(self.class)];
}

@end
