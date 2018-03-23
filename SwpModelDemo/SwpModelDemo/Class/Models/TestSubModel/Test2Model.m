
//
//  Test2Model.m
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "Test2Model.h"

@implementation Test2Model

/**
 *  @author swp_song
 *
 *  @brief  test2Init   ( 快速初始化 )
 *
 *  @return TestModel
 */
+ (instancetype)test2Init {
    Test2Model *test1 = [Test2Model new];
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
    self.testNSString   = [NSString stringWithFormat:@"%@", NSStringFromClass(self.superclass.superclass)];
    self.test1NSString  = [NSString stringWithFormat:@"%@", NSStringFromClass(self.superclass)];
    _test2NSString      = [NSString stringWithFormat:@"%@", NSStringFromClass(self.class)];
}

@end
