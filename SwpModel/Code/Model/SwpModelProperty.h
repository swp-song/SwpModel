//
//  SwpModelProperty.h
//  swp_song
//
//  Created by swp-song on 2018/3/19.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelBase.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpModelProperty : SwpModelBase

/** class property's opaque struct  */
@property (nonatomic, assign, readonly) objc_property_t aProperty;
/** class property's name */
@property (nonatomic, strong, readonly) NSString        *aName;
/** class property's type */
@property (nonatomic, assign, readonly) SwpEncodingType aType;
/** class property's encoding value */
@property (nonatomic, strong, readonly) NSString        *aTypeEncoding;
/** class property's ivar name */
@property (nonatomic, strong, readonly) NSString        *aIvarName;
/** class property's class */
@property (nonatomic, assign, readonly, nullable) Class aClass;
/** class property's getter */
@property (nonatomic, assign, readonly, nullable) SEL   aGetter;
/** class property's setter */
@property (nonatomic, assign, readonly, nullable) SEL   aSetter;

/**
 *  @author swp_song
 *
 *  @brief  initWithProperty:   ( 初始化 )
 *
 *  @param  aProperty   aProperty
 *
 *   @return SwpModelProperty
 */
- (instancetype)initWithProperty:(objc_property_t)aProperty;

@end
NS_ASSUME_NONNULL_END
