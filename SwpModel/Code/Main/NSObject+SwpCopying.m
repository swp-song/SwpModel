//
//  NSObject+SwpCopying.m
//  SwpModelDemo
//
//  Created by swp-song on 2018/10/6.
//  Copyright © 2018 swp_song. All rights reserved.
//

#import "NSObject+SwpCopying.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpModelUtils.h"
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpModelConfigMeta.h"
#import "SwpModelPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation NSObject (SwpCopying)

/**
 *  @author swp_song
 *
 *  @brief  swp_copy ( copy model )
 *
 *  @return id
 */
- (id)swpCopy {
    if (self == (id)kCFNull) return self;
    SwpModelConfigMeta *configMeta = [[SwpModelConfigMeta alloc] initConfigMeta:self.class];
    if (configMeta.aNSType) return [self copy];
    NSObject *model = self.class.new;
    for (SwpModelPropertyMeta *meta in configMeta.aAllPropertys) {
        if (!meta.aGetter || !meta.aSetter) continue;
        [SwpModelUtils swpCopyModel:self model:model meta:meta];
    }
    return model;
}

@end
