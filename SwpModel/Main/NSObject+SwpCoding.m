//
//  NSObject+SwpCoding.m
//  swp_song
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "NSObject+SwpCoding.h"

/* ---------------------- Tool       ---------------------- */
#import <objc/message.h>
#import "SwpModelUtils.h"
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpClassConfigMeta.h"
#import "SwpClassPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation NSObject (SwpCoding)

/**
 *  @author swp_song
 *
 *  @brief  swpEncodeWithCoder: ( SwpCoding 归档 )
 *
 *  @param  aCoder  aCoder
 */
- (void)swpEncodeWithCoder:(NSCoder *)aCoder {
    
    if (!aCoder) return;
    
    if (self == (id)kCFNull) {
        [((id<NSCoding>)self)encodeWithCoder:aCoder];
        return;
    }
    
    SwpClassConfigMeta *configMeta = [[SwpClassConfigMeta alloc] initClassConfigMeta:self.class];
    
    if (configMeta.aNSType) {
        [((id<NSCoding>)self)encodeWithCoder:aCoder];
        return;
    }
    
    
    [configMeta.aAllPropertys enumerateObjectsUsingBlock:^(SwpClassPropertyMeta * _Nonnull propertyMeta, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!propertyMeta.aGetter) return;
        
        if (propertyMeta.isACNumber) {
            
            NSNumber *value = [SwpModelUtils swpModelUtilsGetNumberToProperty:self meta:propertyMeta];
            NSString *key   = propertyMeta.aName;
            if (value) [aCoder encodeObject:value forKey:key];
            
        } else {
            
            switch (propertyMeta.aType & SwpEncodingTypeMask)
            {
                    
                case SwpEncodingTypeObject:
                {
                    id value = ((id (*)(id, SEL))(void *)objc_msgSend)((id)self, propertyMeta.aGetter);
                    if (value && (propertyMeta.aNSType || [value respondsToSelector:@selector(encodeWithCoder:)])) {
                        [aCoder encodeObject:value forKey:propertyMeta.aName];
                    }
                }
                    break;
                    
                    
                case SwpEncodingTypeSEL:
                {
                    SEL value = ((SEL (*)(id, SEL))(void *)objc_msgSend)((id)self, propertyMeta.aGetter);
                    if (value) [aCoder encodeObject:NSStringFromSelector(value) forKey:propertyMeta.aName];
                    
                }
                    break;
                    
                case SwpEncodingTypeStruct:
                case SwpEncodingTypeUnion:
                {
                    if (propertyMeta.isAKVCCompatible && propertyMeta.aStrucKeyedManner)
                    {
                        @try {
                            NSValue *value = [self valueForKey:NSStringFromSelector(propertyMeta.aGetter)];
                            [aCoder encodeObject:value forKey:propertyMeta.aName];
                        } @catch (NSException *exception) {}
                    }
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
        
    }];
    
}

/**
 *  @author swp_song
 *
 *  @brief  swpInitWithCoder:   ( Swp Model 解档 )
 *
 *  @param  aDecoder    aDecoder
 *
 *  @return id
 */
- (id)swpInitWithCoder:(NSCoder *)aDecoder {
    
    if (!aDecoder) return self;
    
    if (self == (id)kCFNull) return self;
    
    
    SwpClassConfigMeta *configMeta = [[SwpClassConfigMeta alloc] initClassConfigMeta:self.class];
    
    if (configMeta.aNSType) return self;
    
    [configMeta.aAllPropertys enumerateObjectsUsingBlock:^(SwpClassPropertyMeta * _Nonnull propertyMeta, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!propertyMeta.aSetter) return;
        
        if (propertyMeta.isACNumber) {
            NSNumber *value = [aDecoder decodeObjectForKey:propertyMeta.aName];
            if ([value isKindOfClass:[NSNumber class]]) {
                [SwpModelUtils swpModelUtilsSetNumberToProperty:self number:value mete:propertyMeta];
                [value class];
            }
            
        } else {
            
            switch (propertyMeta.aType & SwpEncodingTypeMask)
            {
                    
                case SwpEncodingTypeObject:
                {
                    id value = [aDecoder decodeObjectForKey:propertyMeta.aName];
                    
                    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)self, propertyMeta.aSetter, value);
                }
                    break;
                    
                case SwpEncodingTypeSEL:
                {
                    NSString *selString = [aDecoder decodeObjectForKey:propertyMeta.aName];
                    SEL       sel       = NSSelectorFromString(selString);
                    ((void (*)(id, SEL, SEL))(void *) objc_msgSend)((id)self, propertyMeta.aSetter, sel);
                }
                    break;
                    
                case SwpEncodingTypeStruct:
                case SwpEncodingTypeUnion:
                {
                    
                    if (propertyMeta.isAKVCCompatible) {
                        @try {
                            NSValue *value = [aDecoder decodeObjectForKey:propertyMeta.aName];
                            if (value) [self setValue:value forKey:propertyMeta.aName];
                        } @catch (NSException *exception) {}
                    }
                }
                    break;
                    
                    
                default:
                    break;
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
