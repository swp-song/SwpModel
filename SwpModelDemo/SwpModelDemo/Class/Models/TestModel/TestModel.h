//
//  TestModel.h
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;


NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject <NSCoding, NSCopying, NSMutableCopying>

typedef NS_ENUM(NSInteger, TestModelTeype) {
    TestModelTeype1 = 0,
    TestModelTeype2,
    TestModelTeype3,
    TestModelTeype4,
};

@property (nonatomic, assign) int           testInt;
@property (nonatomic, assign) long long     testLongLong;
@property (nonatomic, assign) float         testFloat;
@property (nonatomic, assign) double        testDouble;
@property (nonatomic, assign) long double   testLongDouble;
@property (nonatomic, copy  ) NSString      *testNSString;
@property (nonatomic, assign) NSInteger     testInteger;
@property (nonatomic, assign) CGFloat       testCGFloat;
@property (nonatomic, assign) CGSize        testCGSize;
@property (nonatomic, assign) CGRect        testCGRect;
@property (nonatomic, copy  ) NSNumber      *testNSNumber;
@property (nonatomic, copy  ) NSIndexPath   *testNSIndexPath;
@property (nonatomic, assign, getter = isTestBool) BOOL testBool;
@property (nonatomic, assign) TestModelTeype      testModelTeype;
@property (nonatomic, copy  ) NSArray             *testNSArray;
@property (nonatomic, strong) NSMutableArray      *testNSMutableArray;
@property (nonatomic, copy  ) NSDictionary        *testNSDictionary;
@property (nonatomic, strong) NSMutableDictionary *testNSMutableDictionary;
@property (nonatomic, strong, setter=setTest:, getter=testModel) TestModel *testModel;

/**
 *  @author swp_song
 *
 *  @brief  testInit    ( 快速初始化 )
 *
 *  @return TestModel
 */
+ (instancetype)testInit;

/**
 *  @author swp_song
 *
 *  @brief  defaultValue ( 设置默认值 )
 */
- (void)defaultValue;

@end
NS_ASSUME_NONNULL_END
