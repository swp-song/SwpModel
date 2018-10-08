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
 *  @brief  swp_enumerateAttributeListBlock:block:  (  )
 *
 *  @param  property    property
 *
 *  @param  block       block
 */
- (void)swp_enumerateAttributeListBlock:(objc_property_t)property block:(void (NS_NOESCAPE ^)(objc_property_attribute_t attribute, NSUInteger index, BOOL * stop))block {
    
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
- (void)swp_enumeratePropertyListBlock:(Class)aClass block:(void (NS_NOESCAPE ^)(objc_property_t property, NSUInteger index, BOOL * stop))block {
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

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
- (SwpEncodingType)swp_encodingGetType:(const char *)typeEncoding {
    return SwpEncodingGetType(typeEncoding);
}

/**
 *  @author swp_song
 *
 *  @brief  swp_classGetNSType: ( 获取 SwpEncodingNSType 类型 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpEncodingNSType
 */
- (SwpEncodingNSType)swp_classGetNSType:(Class)aClass {
    return SwpClassGetNSType(aClass);
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
- (BOOL)swp_encodingTypeIsCNumber:(SwpEncodingType)type {
    return SwpEncodingTypeIsCNumber(type);
}

#pragma mark - Private
/**
 *  @author swp_song
 *
 *  @brief  SwpEncodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
FOUNDATION_STATIC_INLINE SwpEncodingType SwpEncodingGetType(const char *typeEncoding) {
    
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
 *  @param  aClass  aClass
 *
 *  @return SwpEncodingNSType
 */
FOUNDATION_STATIC_INLINE SwpEncodingNSType SwpClassGetNSType(Class aClass) {
    if (!aClass) return SwpEncodingTypeNSUnknown;
    
    if ([aClass isSubclassOfClass:[NSMutableString class]])      return SwpEncodingTypeNSMutableString;
    if ([aClass isSubclassOfClass:[NSString class]])             return SwpEncodingTypeNSString;
    if ([aClass isSubclassOfClass:[NSDecimalNumber class]])      return SwpEncodingTypeNSDecimalNumber;
    if ([aClass isSubclassOfClass:[NSNumber class]])             return SwpEncodingTypeNSNumber;
    if ([aClass isSubclassOfClass:[NSValue class]])              return SwpEncodingTypeNSValue;
    if ([aClass isSubclassOfClass:[NSMutableData class]])        return SwpEncodingTypeNSMutableData;
    if ([aClass isSubclassOfClass:[NSData class]])               return SwpEncodingTypeNSData;
    if ([aClass isSubclassOfClass:[NSDate class]])               return SwpEncodingTypeNSDate;
    if ([aClass isSubclassOfClass:[NSURL class]])                return SwpEncodingTypeNSURL;
    if ([aClass isSubclassOfClass:[NSMutableArray class]])       return SwpEncodingTypeNSMutableArray;
    if ([aClass isSubclassOfClass:[NSArray class]])              return SwpEncodingTypeNSArray;
    if ([aClass isSubclassOfClass:[NSMutableDictionary class]])  return SwpEncodingTypeNSMutableDictionary;
    if ([aClass isSubclassOfClass:[NSDictionary class]])         return SwpEncodingTypeNSDictionary;
    if ([aClass isSubclassOfClass:[NSMutableSet class]])         return SwpEncodingTypeNSMutableSet;
    if ([aClass isSubclassOfClass:[NSSet class]])                return SwpEncodingTypeNSSet;
    
    return SwpEncodingTypeNSUnknown;
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
FOUNDATION_STATIC_INLINE BOOL SwpEncodingTypeIsCNumber(SwpEncodingType type) {
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

@end
