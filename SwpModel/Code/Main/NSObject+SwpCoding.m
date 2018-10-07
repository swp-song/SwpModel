//
//  NSObject+SwpCoding.m
//  swp_song
//
//  Created by swp-song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "NSObject+SwpCoding.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpModelUtils.h"
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpModelConfigMeta.h"
#import "SwpModelPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation NSObject (SwpCoding)

/**
 *  @author swp_song
 *
 *  @brief  swpEncodeCoder: ( Encode Code )
 *
 *  @param  aCoder  aCoder
 */
- (void)swpEncodeCoder:(NSCoder *)aCoder {
    
    if (!aCoder) return;
    if (self == (id)kCFNull) {
        [((id<NSCoding>)self)encodeWithCoder:aCoder];
        return;
    }
    SwpModelConfigMeta *configMeta = [[SwpModelConfigMeta alloc] initConfigMeta:self.class];
    if (configMeta.aNSType) {
        [((id<NSCoding>)self)encodeWithCoder:aCoder];
        return;
    }
    [configMeta.aAllPropertys enumerateObjectsUsingBlock:^(SwpModelPropertyMeta * _Nonnull meta, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!meta.aGetter) return;
        if (meta.isACNumber) {
            NSNumber *value = [SwpModelUtils swpModelUtilsGetNumberToProperty:self meta:meta];
            NSString *key   = meta.aName;
            if (value) [aCoder encodeObject:value forKey:key];
        } else {
            switch (meta.aType & SwpEncodingTypeMask) {
                case SwpEncodingTypeObject: {
                    id value = ((id (*)(id, SEL))(void *)objc_msgSend)((id)self, meta.aGetter);
                    if (value && (meta.aNSType || [value respondsToSelector:@selector(encodeWithCoder:)])) {
                        [aCoder encodeObject:value forKey:meta.aName];
                    }
                } break;
                case SwpEncodingTypeSEL: {
                    SEL value = ((SEL (*)(id, SEL))(void *)objc_msgSend)((id)self, meta.aGetter);
                    if (value) [aCoder encodeObject:NSStringFromSelector(value) forKey:meta.aName];
                } break;
                case SwpEncodingTypeStruct:
                case SwpEncodingTypeUnion: {
                    if (meta.isAKVCCompatible && meta.aStrucKeyedManner) {
                        @try {
                            NSValue *value = [self valueForKey:NSStringFromSelector(meta.aGetter)];
                            [aCoder encodeObject:value forKey:meta.aName];
                        } @catch (NSException *exception) {}
                    }
                } break;
                default: break;
            }
        }
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  swpDecoderCoder:    ( Decoder Code )
 *
 *  @param  aDecoder    aDecoder
 *
 *  @return id
 */
- (id)swpDecoderCoder:(NSCoder *)aDecoder {
    if (!aDecoder) return self;
    if (self == (id)kCFNull) return self;
    SwpModelConfigMeta *configMeta = [[SwpModelConfigMeta alloc] initConfigMeta:self.class];
    if (configMeta.aNSType) return self;
    [configMeta.aAllPropertys enumerateObjectsUsingBlock:^(SwpModelPropertyMeta * _Nonnull meta, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!meta.aSetter) return;
        if (meta.isACNumber) {
            NSNumber *value = [aDecoder decodeObjectForKey:meta.aName];
            if ([value isKindOfClass:[NSNumber class]]) {
                [SwpModelUtils swpModelUtilsSetNumberToProperty:self number:value mete:meta];
                [value class];
            }
        } else {
            switch (meta.aType & SwpEncodingTypeMask) {
                case SwpEncodingTypeObject: {
                    id value = [aDecoder decodeObjectForKey:meta.aName];
                    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)self, meta.aSetter, value);
                } break;
                case SwpEncodingTypeSEL: {
                    NSString *selString = [aDecoder decodeObjectForKey:meta.aName];
                    SEL sel = NSSelectorFromString(selString);
                    ((void (*)(id, SEL, SEL))(void *) objc_msgSend)((id)self, meta.aSetter, sel);
                } break;
                case SwpEncodingTypeStruct:
                case SwpEncodingTypeUnion: {
                    if (meta.isAKVCCompatible) {
                        @try {
                            NSString *value = [aDecoder decodeObjectForKey:meta.aName];
                            if (value) [self setValue:value forKey:meta.aName];
                        } @catch (NSException *exception) {}
                    }
                } break;
                default: break;
            }
        }
    }];
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  swpUnArchive    ( SwpCoding 归档 / 解当 )
 *
 *  @return id
 */
- (id)swpUnArchive {
    id obj = nil;
    @try {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
        obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    return obj;
}


@end
