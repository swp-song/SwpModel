//
//  SwpClassConfigMeta.m
//  swp_song
//
//  Created by swp_song on 2018/3/21.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpClassConfigMeta.h"

/* ---------------------- Model      ---------------------- */
#import "SwpClassConfig.h"
#import "SwpClassProperty.h"
#import "SwpClassPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation SwpClassConfigMeta

/**
 *  @author swp_song
 *
 *  @brief  initClassConfigMeta:    ( 初始化 )
 *
 *  @param  aClss   aClss
 *
 *  @return SwpClassConfigMeta
 */
- (instancetype)initClassConfigMeta:(Class)aClss {
    
    if (self = [super init]) {
        SwpClassConfig *tempClass = [[SwpClassConfig alloc] initWithClass:aClss];
        _aNSType        = SwpClassGetNSType(aClss);
        _aClassConfig   = tempClass;
        _aPropertyMetas = [self getAllPropertys:tempClass];
        if (_aPropertyMetas.count) _aAllPropertys = _aPropertyMetas.allValues.copy;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  getAllPropertys:    ( 获取，_aPropertyMetas 数据 )
 *
 *  @param  classConfig classConfig
 *
 *  @return NSDictionary
 */
- (NSDictionary *)getAllPropertys:(SwpClassConfig *)classConfig {
    
    NSMutableDictionary *propertyMetas = NSMutableDictionary.new;
    SwpClassConfig      *tempClass     = classConfig;
    while (tempClass && tempClass.aSuperClss != nil) {
        
        for (SwpClassProperty *obj in tempClass.aPropertys.allValues) {
            if (!obj.aName) continue;
            SwpClassPropertyMeta *meta = [[SwpClassPropertyMeta alloc] initClassPropertyMeta:tempClass aProperty:obj];
            if (!meta || !meta.aName)                       continue;
            if (!meta.aGetter || !meta.aSetter)             continue;
            if ([propertyMetas objectForKey:meta.aName])    continue;
            [propertyMetas setObject:meta forKey:meta.aName];
        }
        tempClass = tempClass.aSuperClassConfig;
    }
    return propertyMetas.copy;
}

@end
