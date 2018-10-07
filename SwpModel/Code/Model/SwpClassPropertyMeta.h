//
//  SwpClassPropertyMeta.h
//  swp_song
//
//  Created by swp_song on 2018/3/21.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpClassBase.h"

@class SwpClassProperty, SwpClassConfig;

NS_ASSUME_NONNULL_BEGIN
@interface SwpClassPropertyMeta : SwpClassBase

/** class property's name */
@property(nonatomic, copy, readonly) NSString *aName;
/** class property's class */
@property(nonatomic, assign, readonly)  Class aClass;
/** class property's type */
@property(nonatomic, assign, readonly) SwpEncodingType aType;
/** class property's  Foundation type */
@property(nonatomic, assign, readonly) SwpEncodingNSType aNSType;
/** class property's  is c number type */
@property(nonatomic, assign, readonly, getter=isACNumber) BOOL aCNumber;
/** class property's  getter */
@property (nonatomic, assign, readonly) SEL aGetter;
/** class property's  setter */
@property (nonatomic, assign, readonly) SEL aSetter;
/** class property's  YES if the struct can encoded with keyed archiver/unarchiver */
@property (nonatomic, assign, readonly, getter=isAStrucKeyedManner) BOOL aStrucKeyedManner;
/** class property's  YES if it can access with key-value coding */
@property (nonatomic, assign, readonly, getter=isAKVCCompatible) BOOL aKVCCompatible;
/** class property's  property */
@property (nonatomic, strong, readonly) SwpClassProperty *aProperty;

/**
 *  @author swp_song
 *
 *  @brief  initClassPropertyMeta:aProperty:    ( 初始化 )
 *
 *  @param  classConfig classConfig
 *
 *  @param  aProperty   aProperty
 *
 *  @return SwpClassPropertyMeta
 */
- (instancetype)initClassPropertyMeta:(SwpClassConfig *)classConfig aProperty:(SwpClassProperty *)aProperty;

@end
NS_ASSUME_NONNULL_END
