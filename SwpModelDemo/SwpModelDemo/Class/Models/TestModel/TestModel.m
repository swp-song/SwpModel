//
//  TestModel.m
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "TestModel.h"

#import <SwpModel/SwpModelHeader.h>

@implementation TestModel {
    TestModel *_testModel;
}

/**
 *  @author swp_song
 *
 *  @brief  testInit    ( 快速初始化 )
 *
 *  @return TestModel
 */
+ (instancetype)testInit {
    
    TestModel *test = [TestModel new];
    [test defaultValue];
    return test;
}

/**
 *  @author swp_song
 *
 *  @brief  defaultValue ( 设置默认值 )
 */
- (void)defaultValue {
    _testInt            = INT32_MAX;
    _testLongLong       = INT64_MAX;
    _testFloat          = FLT_MAX;
    _testDouble         = DBL_MAX;
    _testLongDouble     = LDBL_MAX;
    _testNSString       = [NSString stringWithFormat:@"%@", NSStringFromClass(self.class)];
    _testInteger        = -UINT16_MAX;
    _testCGFloat        = FLT_MIN;
    _testCGSize         = CGSizeMake(300, 400);
    _testCGRect         = CGRectMake(100, 200, 300, 400);
    _testNSNumber       = @(UINT8_MAX);
    _testNSIndexPath    = [NSIndexPath indexPathForRow:INT8_MAX inSection:UINT8_MAX];
    _testBool           = YES;
    _testModelTeype     = TestModelTeype4;
    _testNSArray        = @[@(1), @(2), @(3), @(4)];
    _testNSMutableArray = [NSMutableArray arrayWithObjects:@"123", _testNSArray, _testModel, nil];
    _testNSDictionary   = @{@"key1" : @"value1", @"key2" : @"value2", @"key3" : @"value3", @"key4" : @"value5"};
    _testModel          = self;
    _testNSMutableDictionary = [self getDictonaryDatas:_testModel array:_testNSArray];
}

- (void)setTest:(TestModel *)model {
    _testModel = model;
}

- (TestModel *)testModel {
    return _testModel;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self swpEncodeCoder:aCoder];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self swpDecoderCoder:aDecoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self swpCopy];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [self swpCopy];
}

- (BOOL)isEqual:(id)object {
    return [self swpEqual:object];
}

- (NSUInteger)hash {
    return [self swpHash];
}

- (NSMutableDictionary *)getDictonaryDatas:(TestModel *)test array:(NSArray *)array {
    NSMutableDictionary *dictonary = @{}.mutableCopy;
    [dictonary setObject:@"value1" forKey:@"key1"];
    [dictonary setObject:@(12345) forKey:@"key2"];
    [dictonary setObject:test forKey:@"key3"];
    [dictonary setObject:array forKey:@"key3"];
    return dictonary;
}


@end
