//
//  SwpModelProperty.m
//  swp_song
//
//  Created by swp-song on 2018/3/19.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelProperty.h"

@implementation SwpModelProperty

/**
 *  @author swp_song
 *
 *  @brief  initWithProperty:   ( 初始化 )
 *
 *  @param  aProperty   aProperty
 *
*   @return SwpClassProperty
 */
- (instancetype)initWithProperty:(objc_property_t)aProperty {
    if (!aProperty) return nil;
    if (self = [super init]) {
        _aProperty       = aProperty;
        const char *name = property_getName(aProperty);
        if (name) _aName = [NSString stringWithUTF8String:name];
        __block Class aClass            = nil;
        __block SwpEncodingType type    = 0;
        __block NSString *aIvarName     = nil;
        __block NSString *aTypeEncoding = nil;
        __block SEL aGetter             = nil;
        __block SEL aSetter             = nil;
        [self.class swp_EnumerateAttributeListBlock:aProperty block:^(objc_property_attribute_t attribute, NSUInteger index, BOOL * _Nonnull stop) {
            switch (attribute.name[0]) {
                case 'T': {
                    // Type encoding
                    if (attribute.value) {
                        aTypeEncoding = [NSString stringWithUTF8String:attribute.value];
                        type = SwpEncodingGetType(attribute.value);
                        if ((type & SwpEncodingTypeMask) == SwpEncodingTypeObject && aTypeEncoding.length) {
                            NSScanner *scanner = [NSScanner scannerWithString:aTypeEncoding];
                            if (![scanner scanString:@"@\"" intoString:NULL]) break;
                            NSString *clssName = nil;
                            if ([scanner scanUpToCharactersFromSet: [NSCharacterSet characterSetWithCharactersInString:@"\"<"] intoString:&clssName]) {
                                if (clssName.length) aClass = objc_getClass(clssName.UTF8String);
                            }
                        }
                    }
                } break;
                case 'V': {
                    if (attribute.value) {
                        aIvarName = [NSString stringWithUTF8String:attribute.value];
                    }
                } break;
                case 'R': {
                    type |= SwpEncodingTypePropertyReadonly;
                } break;
                case 'C': {
                    type |= SwpEncodingTypePropertyCopy;
                } break;
                case '&': {
                    type |= SwpEncodingTypePropertyRetain;
                } break;
                case 'N': {
                    type |= SwpEncodingTypePropertyNonatomic;
                } break;
                case 'D': {
                    type |= SwpEncodingTypePropertyDynamic;
                } break;
                case 'W': {
                    type |= SwpEncodingTypePropertyWeak;
                } break;
                case 'G': {
                    type |= SwpEncodingTypePropertyCustomGetter;
                    if (attribute.value) {
                        aGetter = NSSelectorFromString([NSString stringWithUTF8String:attribute.value]);
                    }
                } break;
                case 'S': {
                    type |= SwpEncodingTypePropertyCustomSetter;
                    if (attribute.value) {
                        aSetter = NSSelectorFromString([NSString stringWithUTF8String:attribute.value]);
                    }
                }
                default: break;
            }
        }];
        _aClass        = aClass;
        _aType         = type;
        _aIvarName     = aIvarName;
        _aTypeEncoding = aTypeEncoding;
        _aGetter       = aGetter;
        _aSetter       = aSetter;
        if (_aName.length) {
            _aGetter = _aGetter ? _aGetter : NSSelectorFromString(_aName);
            _aSetter = _aSetter ? _aSetter : NSSelectorFromString([NSString stringWithFormat:@"set%@%@:", [_aName substringToIndex:1].uppercaseString, [_aName substringFromIndex:1]]);
        }
    }
    return self;
}


@end
