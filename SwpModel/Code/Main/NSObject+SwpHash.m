//
//  NSObject+SwpHash.m
//  SwpModelDemo
//
//  Created by Dream on 2018/10/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "NSObject+SwpHash.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpModelUtils.h"
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpModelConfigMeta.h"
#import "SwpModelPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation NSObject (SwpHash)

/**
 *  @author swp_song
 *
 *  @brief  swpHash ( hash )
 *
 *  @return NSInteger
 */
- (NSInteger)swpHash {
    if (self == (id)kCFNull) return [self hash];
    SwpModelConfigMeta *configMeta = [[SwpModelConfigMeta alloc] initConfigMeta:self.class];
    if (configMeta.aNSType) return [self hash];
    NSUInteger hash  = 0;
    NSUInteger count = 0;
    for (SwpModelPropertyMeta *meta in configMeta.aAllPropertys) {
        if (!meta.aNSType) continue;
        if (!meta.isKVCCompatible) continue;
        id value = [self valueForKey:NSStringFromSelector(meta.aGetter)];
        hash ^= [value hash];
        count++;
    }
    return count ? hash : (long)((__bridge void *) self);
}

@end
