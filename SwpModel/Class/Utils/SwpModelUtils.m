//
//  SwpModelUtils.m
//  swp_song
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpModelUtils.h"

/* ---------------------- Tool       ---------------------- */
#import <objc/message.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpClassPropertyMeta.h"
/* ---------------------- Model      ---------------------- */

@implementation SwpModelUtils

/**
 *  @author swp_song
 *
 *  @brief  swpModelUtilsGetNumberToProperty:   ( 数据 Get Number 值 )
 *
 *  @param  model   model
 *
 *  @param  meta    meta
 *
 *  @return NSNumber
 */
+ (NSNumber *)swpModelUtilsGetNumberToProperty:(id)model meta:(SwpClassPropertyMeta *)meta {
    switch (meta.aType & SwpEncodingTypeMask) {
            
        case SwpEncodingTypeBool:
            return @(((bool (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeInt8:
            return @(((int8_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeUInt8:
            return @(((uint8_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeInt16:
            return @(((int16_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeUInt16:
            return @(((uint16_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeInt32:
            return @(((int32_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeUInt32:
            return @(((uint32_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeInt64:
            return @(((int64_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeUInt64:
            return @(((uint64_t (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter));
            
        case SwpEncodingTypeFloat:
        {
            float num = ((float (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter);
            if (isnan(num) || isinf(num)) return nil;
            return @(num);
        }
            
        case SwpEncodingTypeDouble:
        {
            double num = ((double (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter);
            if (isnan(num) || isinf(num)) return nil;
            return @(num);
        }
            
        case SwpEncodingTypeLongDouble:
        {
            double num = ((long double (*)(id, SEL))(void *) objc_msgSend)((id)model, meta.aGetter);
            if (isnan(num) || isinf(num)) return nil;
            return @(num);
        }
            
        default:
            return nil;
    }
}


/**
 *  @author swp_song
 *
 *  @brief  swpModelUtilsSetNumberToProperty:   ( 数据 Set Number 值 )
 *
 *  @param  model   model
 *
 *  @param  number  number
 *
 *  @param  meta    meta
 */
+ (void)swpModelUtilsSetNumberToProperty:(id)model number:(NSNumber *)number mete:(SwpClassPropertyMeta *)meta {
    
    switch (meta.aType & SwpEncodingTypeMask) {
            
        case SwpEncodingTypeBool:
            ((void (*)(id, SEL, bool))(void *) objc_msgSend)((id)model, meta.aSetter, number.boolValue);
            break;
            
        case SwpEncodingTypeInt8:
            ((void (*)(id, SEL, int8_t))(void *) objc_msgSend)((id)model, meta.aSetter, (int8_t)number.charValue);
            break;
            
        case SwpEncodingTypeUInt8:
            ((void (*)(id, SEL, uint8_t))(void *) objc_msgSend)((id)model, meta.aSetter, (uint8_t)number.unsignedCharValue);
            break;
            
        case SwpEncodingTypeInt16:
            ((void (*)(id, SEL, int16_t))(void *) objc_msgSend)((id)model, meta.aSetter, (int16_t)number.shortValue);
            break;
            
        case SwpEncodingTypeUInt16:
            ((void (*)(id, SEL, uint16_t))(void *) objc_msgSend)((id)model, meta.aSetter, (uint16_t)number.unsignedShortValue);
            break;
            
        case SwpEncodingTypeInt32:
            ((void (*)(id, SEL, int32_t))(void *) objc_msgSend)((id)model, meta.aSetter, (int32_t)number.intValue);
            
        case SwpEncodingTypeUInt32:
            ((void (*)(id, SEL, uint32_t))(void *) objc_msgSend)((id)model, meta.aSetter, (uint32_t)number.unsignedIntValue);
            break;
            
        case SwpEncodingTypeInt64:
        {
            if ([number isKindOfClass:[NSDecimalNumber class]]) {
                ((void (*)(id, SEL, int64_t))(void *) objc_msgSend)((id)model, meta.aSetter, (int64_t)number.stringValue.longLongValue);
            } else {
                ((void (*)(id, SEL, uint64_t))(void *) objc_msgSend)((id)model, meta.aSetter, (uint64_t)number.longLongValue);
            }
        }
            break;
            
        case SwpEncodingTypeUInt64:
        {
            if ([number isKindOfClass:[NSDecimalNumber class]]) {
                ((void (*)(id, SEL, int64_t))(void *) objc_msgSend)((id)model, meta.aSetter, (int64_t)number.stringValue.longLongValue);
            } else {
                ((void (*)(id, SEL, uint64_t))(void *) objc_msgSend)((id)model, meta.aSetter, (uint64_t)number.unsignedLongLongValue);
            }
        }
            break;
            
        case SwpEncodingTypeFloat:
        {
            float aFloat = number.floatValue;
            if (isnan(aFloat) || isinf(aFloat)) aFloat = 0;
            ((void (*)(id, SEL, float))(void *) objc_msgSend)((id)model, meta.aSetter, aFloat);
        }
            break;
            
        case SwpEncodingTypeDouble:
        {
            double aDouble = number.doubleValue;
            if (isnan(aDouble) || isinf(aDouble)) aDouble = 0;
            ((void (*)(id, SEL, double))(void *) objc_msgSend)((id)model, meta.aSetter, aDouble);
        }
            break;
            
        case SwpEncodingTypeLongDouble:
        {
            long double aDouble = number.doubleValue;
            if (isnan(aDouble) || isinf(aDouble)) aDouble = 0;
            ((void (*)(id, SEL, long double))(void *) objc_msgSend)((id)model, meta.aSetter, (long double)aDouble);
        }
            break;
            
        default:
            break;
    }
}


@end
