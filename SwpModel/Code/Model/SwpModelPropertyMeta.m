//
//  SwpModelPropertyMeta.m
//  swp_song
//
//  Created by swp-song on 2018/3/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelPropertyMeta.h"


/* ---------------------- Model      ---------------------- */
#import "SwpModelConfig.h"
#import "SwpModelProperty.h"
/* ---------------------- Model      ---------------------- */

@implementation SwpModelPropertyMeta

/**
 *  @author swp_song
 *
 *  @brief  initPropertyMeta:aProperty: ( 初始化 )
 *
 *  @param  aConfig     aConfig
 *
 *  @param  aProperty   aProperty
 *
 *  @return SwpModelPropertyMeta
 */
- (instancetype)initPropertyMeta:(SwpModelConfig *)aConfig aProperty:(SwpModelProperty *)aProperty {

    if (self = [super init]) {
        _aProperty = aProperty;
        _aName  = _aProperty.aName;
        _aType  = _aProperty.aType;
        _aClass = _aProperty.aClass;
        
        if ((_aType & SwpEncodingTypeMask) == SwpEncodingTypeObject) {
            _aNSType    = [self swp_classGetNSType:_aClass];
        } else {
            _aCNumber   = [self swp_encodingTypeIsCNumber:_aType];
        }
        
        if ((_aType & SwpEncodingTypeMask) == SwpEncodingTypeStruct) {
            /*
             It seems that NSKeyedUnarchiver cannot decode NSValue except these structs:
             */
            static NSSet *types = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                NSMutableSet *set = [NSMutableSet new];
                // 32 bit
                [set addObject:@"{CGSize=ff}"];
                [set addObject:@"{CGPoint=ff}"];
                [set addObject:@"{CGRect={CGPoint=ff}{CGSize=ff}}"];
                [set addObject:@"{CGAffineTransform=ffffff}"];
                [set addObject:@"{UIEdgeInsets=ffff}"];
                [set addObject:@"{UIOffset=ff}"];
                // 64 bit
                [set addObject:@"{CGSize=dd}"];
                [set addObject:@"{CGPoint=dd}"];
                [set addObject:@"{CGRect={CGPoint=dd}{CGSize=dd}}"];
                [set addObject:@"{CGAffineTransform=dddddd}"];
                [set addObject:@"{UIEdgeInsets=dddd}"];
                [set addObject:@"{UIOffset=dd}"];
                types = set;
            });
            if ([types containsObject:aProperty.aTypeEncoding]) {
                _aStrucKeyedManner = YES;
            }
        }
        
        if (aProperty.aGetter) {
            if ([aConfig.aClass instancesRespondToSelector:aProperty.aGetter]) {
                _aGetter = aProperty.aGetter;
            }
        }
        
        if (aProperty.aSetter) {
            if ([aConfig.aClass instancesRespondToSelector:aProperty.aSetter]) {
                _aSetter = aProperty.aSetter;
            }
        }
        
        if (_aGetter && _aSetter) {
            switch (_aType & SwpEncodingTypeMask) {
                case SwpEncodingTypeBool:
                case SwpEncodingTypeInt8:
                case SwpEncodingTypeUInt8:
                case SwpEncodingTypeInt16:
                case SwpEncodingTypeUInt16:
                case SwpEncodingTypeInt32:
                case SwpEncodingTypeUInt32:
                case SwpEncodingTypeInt64:
                case SwpEncodingTypeUInt64:
                case SwpEncodingTypeFloat:
                case SwpEncodingTypeDouble:
                case SwpEncodingTypeObject:
                case SwpEncodingTypeClass:
                case SwpEncodingTypeBlock:
                case SwpEncodingTypeStruct:
                case SwpEncodingTypeUnion: {
                    _aKVCCompatible = YES;
                } break;
                default: break;
            }
        }
    }
    return self;
}

@end
