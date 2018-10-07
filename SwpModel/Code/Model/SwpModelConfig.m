//
//  SwpModelConfig.m
//  swp_song
//
//  Created by swp-song on 2018/3/19.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelConfig.h"

#import "SwpModelProperty.h"

@implementation SwpModelConfig

/**
 *  @author swp_song
 *
 *  @brief  swpClassConfig: ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfig
 */
+ (instancetype)swpConfig:(Class)aClass {
    return [[self.class alloc] initWithClass:aClass];
}

/**
 *  @author swp_song
 *
 *  @brief  initWithClass:  ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfig
 */
- (instancetype)initWithClass:(Class)aClass {
    if (!aClass) return nil;
    if (self = [super init]) {
        _aClass            = aClass;
        _aSuperClss        = class_getSuperclass(aClass);
        _aMeta             = class_isMetaClass(aClass);
        _aName             = NSStringFromClass(aClass);
        _aMetaClss         = !_aMeta ? objc_getMetaClass(class_getName(aClass)) : _aMetaClss;
        _aPropertys        = [self _getPropertys:aClass];
        if (_aSuperClss) {
            _aSuperConfig = [self.class swpConfig:_aSuperClss];;
        }
    }
    if (!_aPropertys) _aPropertys = @{};
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  _getPropertys:  ( 获取 propertys )
 *
 *  @param  aClass  aClass
 *
 *  @return NSDictionary
 */
- (NSDictionary<NSString *, SwpClassProperty *> *)_getPropertys:(Class)aClass {
    unsigned int propertyCount = 0;
    objc_property_t     *properties = class_copyPropertyList(aClass, &propertyCount);
    NSMutableDictionary *aPropertys = [NSMutableDictionary new];
    if (properties) {
        [self.class swp_EnumeratePropertyListBlock:aClass block:^(objc_property_t  _Nonnull property, NSUInteger index, BOOL * _Nonnull stop) {
            SwpModelProperty *aProperty = [[SwpModelProperty alloc] initWithProperty:property];
            if (aProperty.aName) {
                [aPropertys setObject:aProperty forKey:aProperty.aName];
            }
        }];
    }
    return aPropertys;
}


@end
