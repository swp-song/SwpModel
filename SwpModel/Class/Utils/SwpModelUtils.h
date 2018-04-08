//
//  SwpModelUtils.h
//  swp_song
//
//  Created by swp_song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SwpClassPropertyMeta;


NS_ASSUME_NONNULL_BEGIN
@interface SwpModelUtils : NSObject

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
+ (NSNumber *)swpModelUtilsGetNumberToProperty:(id)model meta:(SwpClassPropertyMeta *)meta;

/**
 *  @author swp_song
 *
 *  @brief  SwpModelSetNumberToProperty:    ( 数据 Set Number 值 )
 *
 *  @param  model   model
 *
 *  @param  number  number
 *
 *  @param  meta    meta
 */
+ (void)swpModelUtilsSetNumberToProperty:(id)model number:(NSNumber *)number mete:(SwpClassPropertyMeta *)meta;


@end
NS_ASSUME_NONNULL_END
