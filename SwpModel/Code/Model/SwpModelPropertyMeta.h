//
//  SwpClassPropertyMeta.h
//  swp_song
//
//  Created by swp-song on 2018/3/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelBase.h"

@class SwpModelProperty, SwpModelConfig;

NS_ASSUME_NONNULL_BEGIN
@interface SwpModelPropertyMeta : SwpModelBase

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
@property (nonatomic, assign, readonly, getter = isStrucKeyedManner) BOOL aStrucKeyedManner;
/** class property's  YES if it can access with key-value coding */
@property (nonatomic, assign, readonly, getter = isKVCCompatible) BOOL aKVCCompatible;
/** class property's  property */
@property (nonatomic, strong, readonly) SwpModelProperty *aProperty;

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
- (instancetype)initPropertyMeta:(SwpModelConfig *)aConfig aProperty:(SwpModelProperty *)aProperty;

@end
NS_ASSUME_NONNULL_END
