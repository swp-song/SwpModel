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
 *  @brief  swp_encodingGetType: ( 获取 SwpEncodingType 类型 )
 *
 *  @param  typeEncoding    typeEncoding
 *
 *  @return SwpEncodingType
 */
- (SwpEncodingType)swp_encodingGetType:(const char *)typeEncoding;

/**
 *  @author swp_song
 *
 *  @brief  swp_classGetNSType: ( 获取 SwpEncodingNSType 类型 )
 *
 *  @param  aClass   aClass
 *
 *  @return SwpEncodingNSType
 */
- (SwpEncodingNSType)swp_classGetNSType:(Class)aClass;

/**
 *  @author swp_song
 *
 *  @brief  swp_encodingTypeIsCNumber:  ( 验证是否是 C 数据结构 )
 *
 *  @param  type    type
 *
 *  @return BOOL
 */
- (BOOL)swp_encodingTypeIsCNumber:(SwpEncodingType)type;

/**
 *  @author swp_song
 *
 *  @brief  swp_enumerateAttributeListBlock:block:  (  )
 *
 *  @param  property    property
 *
 *  @param  block       block
 */
- (void)swp_enumerateAttributeListBlock:(objc_property_t)property block:(void (NS_NOESCAPE ^)(objc_property_attribute_t attribute, NSUInteger index, BOOL * stop))block;

/**
 *  @author swp_song
 *
 *  @brief  swp_EnumeratePropertyListBlock:block:  (  )
 *
 *  @param  aClass  aClass
 *
 *  @param  block   block
 */
- (void)swp_enumeratePropertyListBlock:(Class)aClass block:(void (NS_NOESCAPE ^)(objc_property_t property, NSUInteger index, BOOL * stop))block;

@end
NS_ASSUME_NONNULL_END
