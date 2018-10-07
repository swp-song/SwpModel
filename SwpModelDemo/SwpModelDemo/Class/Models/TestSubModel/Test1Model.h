//
//  Test1Model.h
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "TestModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface Test1Model : TestModel

@property (nonatomic, copy) NSString *test1NSString;

/**
 *  @author swp_song
 *
 *  @brief  test1Init   ( 快速初始化 )
 *
 *  @return TestModel
 */
+ (instancetype)test1Init;

/**
 *  @author swp_song
 *
 *  @brief  defaultValue ( 设置默认值 )
 */
- (void)defaultValue;

@end
NS_ASSUME_NONNULL_END
