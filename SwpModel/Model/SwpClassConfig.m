//
//  SwpClassConfig.m
//  swp_song
//
//  Created by swp_song on 2018/3/19.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpClassConfig.h"

#import "SwpClassProperty.h"

@implementation SwpClassConfig

/**
 *  @author swp_song
 *
 *  @brief  swpClassConfig: ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfig
 */
+ (instancetype)swpClassConfig:(Class)aClass {
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
        
        _aClss             = aClass;
        _aSuperClss        = class_getSuperclass(aClass);
        _aIsMeta           = class_isMetaClass(aClass);
        _aName             = NSStringFromClass(aClass);
        _aMetaClss         = !_aIsMeta ? objc_getMetaClass(class_getName(aClass)) : _aMetaClss;
        _aPropertys        = [self _getPropertys:aClass];
        if (_aSuperClss) {
            _aSuperClassConfig = [self.class swpClassConfig:_aSuperClss];;
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
            SwpClassProperty *classProperty = [[SwpClassProperty alloc] initWithProperty:property];
            if (classProperty.aName) {
                [aPropertys setObject:classProperty forKey:classProperty.aName];
            }
        }];
    }
    return aPropertys;
}


@end
