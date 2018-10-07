//
//  SwpClassModelDataTypes.h
//  SwpModelDemo
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 - SwpEncodingTypeMask:         mask of type value
 - SwpEncodingTypeUnknown:      unknown
 - SwpEncodingTypeVoid:         void
 - SwpEncodingTypeBool:         bool
 - SwpEncodingTypeInt8:         char / BOOL
 - SwpEncodingTypeUInt8:        unsigned char
 - SwpEncodingTypeInt16:        short
 - SwpEncodingTypeUInt16:       unsigned short
 - SwpEncodingTypeInt32:        int
 - SwpEncodingTypeUInt32:       unsigned int
 - SwpEncodingTypeInt64:        long long
 - SwpEncodingTypeUInt64:       unsigned long long
 - SwpEncodingTypeFloat:        float
 - SwpEncodingTypeDouble:       double
 - SwpEncodingTypeLongDouble:   long double
 - SwpEncodingTypeObject:       id
 - SwpEncodingTypeClass:        Class
 - SwpEncodingTypeSEL:          SEL
 - SwpEncodingTypeBlock:        block
 - SwpEncodingTypePointer:      void*
 - SwpEncodingTypeStruct:       struct
 - SwpEncodingTypeUnion:        union
 - SwpEncodingTypeCString:      char *
 - SwpEncodingTypeCArray:       char[10] (for example)
 -
 - SwpEncodingTypePropertyMask:         mask of property
 - SwpEncodingTypePropertyReadonly:     readonly
 - SwpEncodingTypePropertyCopy:         copy
 - SwpEncodingTypePropertyRetain:       retain
 - SwpEncodingTypePropertyNonatomic:    nonatomic
 - SwpEncodingTypePropertyWeak:         weak
 - SwpEncodingTypePropertyCustomGetter: getter
 - SwpEncodingTypePropertyCustomSetter: setter
 - SwpEncodingTypePropertyDynamic:      @dynamic
 */
typedef NS_OPTIONS(NSUInteger, SwpEncodingType) {
    SwpEncodingTypeMask       = 0xFF,
    SwpEncodingTypeUnknown    = 0,
    SwpEncodingTypeVoid       = 1,
    SwpEncodingTypeBool       = 2,
    SwpEncodingTypeInt8       = 3,
    SwpEncodingTypeUInt8      = 4,
    SwpEncodingTypeInt16      = 5,
    SwpEncodingTypeUInt16     = 6,
    SwpEncodingTypeInt32      = 7,
    SwpEncodingTypeUInt32     = 8,
    SwpEncodingTypeInt64      = 9,
    SwpEncodingTypeUInt64     = 10,
    SwpEncodingTypeFloat      = 11,
    SwpEncodingTypeDouble     = 12,
    SwpEncodingTypeLongDouble = 13,
    SwpEncodingTypeObject     = 14,
    SwpEncodingTypeClass      = 15,
    SwpEncodingTypeSEL        = 16,
    SwpEncodingTypeBlock      = 17,
    SwpEncodingTypePointer    = 18,
    SwpEncodingTypeStruct     = 19,
    SwpEncodingTypeUnion      = 20,
    SwpEncodingTypeCString    = 21,
    SwpEncodingTypeCArray     = 22,
    
    
    SwpEncodingTypePropertyMask         = 0xFF0000,
    SwpEncodingTypePropertyReadonly     = 1 << 16,
    SwpEncodingTypePropertyCopy         = 1 << 17,
    SwpEncodingTypePropertyRetain       = 1 << 18,
    SwpEncodingTypePropertyNonatomic    = 1 << 19,
    SwpEncodingTypePropertyWeak         = 1 << 20,
    SwpEncodingTypePropertyCustomGetter = 1 << 21,
    SwpEncodingTypePropertyCustomSetter = 1 << 22,
    SwpEncodingTypePropertyDynamic      = 1 << 23,
    
};

/**
 - SwpEncodingTypeNSUnknown:            NSUnknown
 - SwpEncodingTypeNSString:             NSString
 - SwpEncodingTypeNSMutableString:      NSMutableString
 - SwpEncodingTypeNSValue:              NSValue
 - SwpEncodingTypeNSNumber:             NSNumber
 - SwpEncodingTypeNSDecimalNumber:      NSDecimalNumber
 - SwpEncodingTypeNSData:               NSData
 - SwpEncodingTypeNSMutableData:        NSMutableData
 - SwpEncodingTypeNSDate:               NSDate
 - SwpEncodingTypeNSURL:                NSURL
 - SwpEncodingTypeNSArray:              NSArray
 - SwpEncodingTypeNSMutableArray:       NSMutableArray
 - SwpEncodingTypeNSDictionary:         NSDictionary
 - SwpEncodingTypeNSMutableDictionary:  NSMutableDictionary
 - SwpEncodingTypeNSSet:                NSSet
 - SwpEncodingTypeNSMutableSet:         NSMutableSet
 */
typedef NS_ENUM (NSUInteger, SwpEncodingNSType) {
    SwpEncodingTypeNSUnknown = 0,
    SwpEncodingTypeNSString,
    SwpEncodingTypeNSMutableString,
    SwpEncodingTypeNSValue,
    SwpEncodingTypeNSNumber,
    SwpEncodingTypeNSDecimalNumber,
    SwpEncodingTypeNSData,
    SwpEncodingTypeNSMutableData,
    SwpEncodingTypeNSDate,
    SwpEncodingTypeNSURL,
    SwpEncodingTypeNSArray,
    SwpEncodingTypeNSMutableArray,
    SwpEncodingTypeNSDictionary,
    SwpEncodingTypeNSMutableDictionary,
    SwpEncodingTypeNSSet,
    SwpEncodingTypeNSMutableSet,
};

NS_ASSUME_NONNULL_END
