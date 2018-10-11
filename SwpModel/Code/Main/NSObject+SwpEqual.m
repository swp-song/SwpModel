//
//  NSObject+SwpEqual.m
//  swp_song
//
//  Created by Dream on 2018/10/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "NSObject+SwpEqual.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpModelUtils.h"
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpModelConfigMeta.h"
#import "SwpModelPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation NSObject (SwpEqual)

/**
 *  @author swp_song
 *
 *  @brief  swpEqual ( equal )
 *
 *  @return id
 */
- (BOOL)swpEqual:(NSObject *)model {
    
    if (self == model) return YES;
    if (![model isMemberOfClass:self.class]) return NO;
    SwpModelConfigMeta *configMeta = [[SwpModelConfigMeta alloc] initConfigMeta:self.class];
    if (configMeta.aNSType) return [self isEqual:model];
    if ([self hash] != [model hash]) return NO;
    for (SwpModelPropertyMeta *meta in configMeta.aAllPropertys) {
        if (!meta.isKVCCompatible) continue;
        id aSelfValue  = [self valueForKey:NSStringFromSelector(meta.aGetter)];
        id aModelVlaue = [model valueForKey:NSStringFromSelector(meta.aGetter)];
        if (aSelfValue == aModelVlaue) continue;
        if (!aSelfValue || !aModelVlaue) return NO;
        if (![aSelfValue isEqual:aModelVlaue]) return NO;
    }
    return YES;
}

@end
