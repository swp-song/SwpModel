//
//  SwpModelBase.m
//  swp_song
//
//  Created by swp-song on 2018/3/19.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelBase.h"

@implementation SwpModelBase

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
+ (SwpEncodingType)swpEncodingGetType:(const char *)typeEncoding {
    return SwpEncodingGetType(typeEncoding);
}

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
SwpEncodingType SwpEncodingGetType(const char *typeEncoding) {

    char *type = (char *)typeEncoding;
    if (!type) return SwpEncodingTypeUnknown;
    size_t len = strlen(type);
    if (len == 0) return SwpEncodingTypeUnknown;
    
    len = strlen(type);
    
    SwpEncodingType qualifier = 0;
    
    if (len == 0) return SwpEncodingTypeUnknown | qualifier;
    
    switch (*type) {
        case 'v': return SwpEncodingTypeVoid        | qualifier;
        case 'B': return SwpEncodingTypeBool        | qualifier;
        case 'c': return SwpEncodingTypeInt8        | qualifier;
        case 'C': return SwpEncodingTypeUInt8       | qualifier;
        case 's': return SwpEncodingTypeInt16       | qualifier;
        case 'S': return SwpEncodingTypeUInt16      | qualifier;
        case 'i': return SwpEncodingTypeInt32       | qualifier;
        case 'I': return SwpEncodingTypeUInt32      | qualifier;
        case 'l': return SwpEncodingTypeInt32       | qualifier;
        case 'L': return SwpEncodingTypeUInt32      | qualifier;
        case 'q': return SwpEncodingTypeInt64       | qualifier;
        case 'Q': return SwpEncodingTypeUInt64      | qualifier;
        case 'f': return SwpEncodingTypeFloat       | qualifier;
        case 'd': return SwpEncodingTypeDouble      | qualifier;
        case 'D': return SwpEncodingTypeLongDouble  | qualifier;
        case '#': return SwpEncodingTypeClass       | qualifier;
        case ':': return SwpEncodingTypeSEL         | qualifier;
        case '*': return SwpEncodingTypeCString     | qualifier;
        case '^': return SwpEncodingTypePointer     | qualifier;
        case '[': return SwpEncodingTypeCArray      | qualifier;
        case '(': return SwpEncodingTypeUnion       | qualifier;
        case '{': return SwpEncodingTypeStruct      | qualifier;
        case '@': {
            if (len == 2 && *(type + 1) == '?')
                return SwpEncodingTypeBlock     | qualifier;
            else
                return SwpEncodingTypeObject    | qualifier;
        }
        default: return SwpEncodingTypeUnknown  | qualifier;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpClassGetNSType:  ( 获取 SwpEncodingNSType 类型 )
 *
 *  @param  aClss   aClss
 *
 *  @return SwpEncodingNSType
 */
+ (SwpEncodingNSType)swpClassGetNSType:(Class)aClss {
    return SwpClassGetNSType(aClss);
}

/**
 *  @author swp_song
 *
 *  @brief  swpClassGetNSType:  ( 获取 SwpEncodingNSType 类型 )
 *
 *  @param  aClss   aClss
 *
 *  @return SwpEncodingNSType
 */
SwpEncodingNSType SwpClassGetNSType(Class aClss) {
    if (!aClss) return SwpEncodingTypeNSUnknown;
    
    if ([aClss isSubclassOfClass:[NSMutableString class]])      return SwpEncodingTypeNSMutableString;
    if ([aClss isSubclassOfClass:[NSString class]])             return SwpEncodingTypeNSString;
    if ([aClss isSubclassOfClass:[NSDecimalNumber class]])      return SwpEncodingTypeNSDecimalNumber;
    if ([aClss isSubclassOfClass:[NSNumber class]])             return SwpEncodingTypeNSNumber;
    if ([aClss isSubclassOfClass:[NSValue class]])              return SwpEncodingTypeNSValue;
    if ([aClss isSubclassOfClass:[NSMutableData class]])        return SwpEncodingTypeNSMutableData;
    if ([aClss isSubclassOfClass:[NSData class]])               return SwpEncodingTypeNSData;
    if ([aClss isSubclassOfClass:[NSDate class]])               return SwpEncodingTypeNSDate;
    if ([aClss isSubclassOfClass:[NSURL class]])                return SwpEncodingTypeNSURL;
    if ([aClss isSubclassOfClass:[NSMutableArray class]])       return SwpEncodingTypeNSMutableArray;
    if ([aClss isSubclassOfClass:[NSArray class]])              return SwpEncodingTypeNSArray;
    if ([aClss isSubclassOfClass:[NSMutableDictionary class]])  return SwpEncodingTypeNSMutableDictionary;
    if ([aClss isSubclassOfClass:[NSDictionary class]])         return SwpEncodingTypeNSDictionary;
    if ([aClss isSubclassOfClass:[NSMutableSet class]])         return SwpEncodingTypeNSMutableSet;
    if ([aClss isSubclassOfClass:[NSSet class]])                return SwpEncodingTypeNSSet;
    
    return SwpEncodingTypeNSUnknown;
}

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingTypeIsCNumber:   ( 验证是否是 C 数据结构 )
 *
 *  @param  type    type
 *
 *  @return BOOL
 */
+ (BOOL)swpEncodingTypeIsCNumber:(SwpEncodingType)type {
    return SwpEncodingTypeIsCNumber(type);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpEncodingTypeIsCNumber:   ( 验证是否是 C 数据结构 )
 *
 *  @param  type    type
 *
 *  @return BOOL
 */
BOOL SwpEncodingTypeIsCNumber(SwpEncodingType type) {
    switch (type & SwpEncodingTypeMask) {
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
        case SwpEncodingTypeLongDouble: return YES;
        default: return NO;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swp_EnumerateAttributeListBlock:block:  (  )
 *
 *  @param  property    property
 *
 *  @param  block       block
 */
+ (void)swp_EnumerateAttributeListBlock:(objc_property_t)property block:(void (NS_NOESCAPE ^)(objc_property_attribute_t attribute, NSUInteger index, BOOL * stop))block {
    
    BOOL stop = NO;
    unsigned int attributeCount = 0;
    objc_property_attribute_t *attributes = property_copyAttributeList(property, &attributeCount);
    for (unsigned int i = 0; i<attributeCount; i++) {
        objc_property_attribute_t attribute = attributes[i];
        block(attribute, i, &stop);
        if (stop) break;
    }
    if (attributes) {
        free(attributes);
        attributes = NULL;
    }
}


/**
 *  @author swp_song
 *
 *  @brief  swp_EnumeratePropertyListBlock:block:  (  )
 *
 *  @param  aClass  aClass
 *
 *  @param  block   block
 */
+ (void)swp_EnumeratePropertyListBlock:(Class)aClass block:(void (NS_NOESCAPE ^)(objc_property_t property, NSUInteger index, BOOL * stop))block {
    BOOL stop = NO;
    unsigned int propertyCount = 0;
    objc_property_t * propertys = class_copyPropertyList(aClass, &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++) {
        objc_property_t property = propertys[i];
        block(property, i, &stop);
        if (stop) break;
    }
    
    if (propertys) {
        free(propertys);
        propertys = NULL;
    }
}





@end
