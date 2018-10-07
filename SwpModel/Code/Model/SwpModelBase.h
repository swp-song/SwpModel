//
//  SwpModelBase.h
//  swp_song
//
//  Created by swp-song on 2018/3/19.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/message.h>
#import "SwpModelDataTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SwpModelBase : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
+ (SwpEncodingType)swpEncodingGetType:(const char *)typeEncoding;

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
SwpEncodingType SwpEncodingGetType(const char *typeEncoding);

/**
 *  @author swp_song
 *
 *  @brief  swpClassGetNSType:  ( 获取 SwpEncodingNSType 类型 )
 *
 *  @param  aClss   aClss
 *
 *  @return SwpEncodingNSType
 */
+ (SwpEncodingNSType)swpClassGetNSType:(Class)aClss;

/**
 *  @author swp_song
 *
 *  @brief  swpClassGetNSType:  ( 获取 SwpEncodingNSType 类型 )
 *
 *  @param  aClss   aClss
 *
 *  @return SwpEncodingNSType
 */
SwpEncodingNSType SwpClassGetNSType(Class aClss);

/**
 *  @author swp_song
 *
 *  @brief  swpEncodingTypeIsCNumber:   ( 验证是否是 C 数据结构 )
 *
 *  @param  type    type
 *
 *  @return BOOL
 */
+ (BOOL)swpEncodingTypeIsCNumber:(SwpEncodingType)type;

/**
 *  @author swp_song
 *
 *  @brief  SwpEncodingTypeIsCNumber:   ( 验证是否是 C 数据结构 )
 *
 *  @param  type    type
 *
 *  @return BOOL
 */
BOOL SwpEncodingTypeIsCNumber(SwpEncodingType type);


/**
 *  @author swp_song
 *
 *  @brief  swp_EnumerateAttributeListBlock:block:  (  )
 *
 *  @param  property    property
 *
 *  @param  block       block
 */
+ (void)swp_EnumerateAttributeListBlock:(objc_property_t)property block:(void (NS_NOESCAPE ^)(objc_property_attribute_t attribute, NSUInteger index, BOOL * stop))block;

/**
 *  @author swp_song
 *
 *  @brief  swp_EnumeratePropertyListBlock:block:  (  )
 *
 *  @param  aClass  aClass
 *
 *  @param  block   block
 */
+ (void)swp_EnumeratePropertyListBlock:(Class)aClass block:(void (NS_NOESCAPE ^)(objc_property_t property, NSUInteger index, BOOL * stop))block;


@end
NS_ASSUME_NONNULL_END
