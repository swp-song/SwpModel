//
//  SwpModelConfigMeta.m
//  swp_song
//
//  Created by swp-song on 2018/3/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelConfigMeta.h"

/* ---------------------- Model      ---------------------- */
#import "SwpModelConfig.h"
#import "SwpModelProperty.h"
#import "SwpModelPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation SwpModelConfigMeta

/**
 *  @author swp_song
 *
 *  @brief  initConfigMeta: ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfigMeta
 */
- (instancetype)initConfigMeta:(Class)aClass {
    if (self = [super init]) {
        SwpModelConfig *config  = [[SwpModelConfig alloc] initWithClass:aClass];
        _aNSType        = SwpClassGetNSType(aClass);
        _aConfig        = config;
        _aPropertyMetas = [self getAllPropertys:config];
        if (_aPropertyMetas.count) _aAllPropertys = _aPropertyMetas.allValues.copy;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  getAllPropertys:    ( 获取，_aPropertyMetas 数据 )
 *
 *  @param  aConfig  aConfig
 *
 *  @return NSDictionary
 */
- (NSDictionary *)getAllPropertys:(SwpModelConfig *)aConfig {

    NSMutableDictionary *propertyMetas = NSMutableDictionary.new;
    SwpModelConfig *config = aConfig;
    while (config && config.aSuperClss != nil) {
        for (SwpModelProperty *obj in config.aPropertys.allValues) {
            if (!obj.aName) continue;
            SwpModelPropertyMeta *meta = [[SwpModelPropertyMeta alloc] initPropertyMeta:config aProperty:obj];
            if (!meta || !meta.aName)                       continue;
            if (!meta.aGetter || !meta.aSetter)             continue;
            if ([propertyMetas objectForKey:meta.aName])    continue;
            [propertyMetas setObject:meta forKey:meta.aName];
        }
        config = config.aSuperConfig;
    }
    return propertyMetas.copy;
}

@end
