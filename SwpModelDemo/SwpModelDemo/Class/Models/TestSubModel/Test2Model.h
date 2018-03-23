//
//  Test2Model.h
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "Test1Model.h"

NS_ASSUME_NONNULL_BEGIN
@interface Test2Model : Test1Model

@property (nonatomic, copy) NSString *test2NSString;

/**
 *  @author swp_song
 *
 *  @brief  test2Init   ( 快速初始化 )
 *
 *  @return TestModel
 */
+ (instancetype)test2Init;

/**
 *  @author swp_song
 *
 *  @brief  defaultValue ( 设置默认值 )
 */
- (void)defaultValue;

@end
NS_ASSUME_NONNULL_END
