//
//  SwpModelConfig.h
//  swp_song
//
//  Created by swp-song on 2018/3/19.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelBase.h"

@class SwpModelProperty;

NS_ASSUME_NONNULL_BEGIN

@interface SwpModelConfig : SwpModelBase

/** class's class */
@property (nonatomic, assign, readonly) Class    aClass;
/** class's aName */
@property (nonatomic, strong, readonly) NSString *aName;
/** class's is meta class */
@property (nonatomic, assign, readonly, getter = isMeta) BOOL aMeta;
/** class's super class object */
@property (nonatomic, assign, readonly, nullable) Class aSuperClss;
/** class's super class object */
@property (nonatomic, assign, readonly, nullable) Class aMetaClss;
/** class's super class property */
@property (nonatomic, strong, readonly) SwpModelConfig *aSuperConfig;
/** class's class properties */
@property (nonatomic, strong, readonly, nullable) NSDictionary<NSString *, SwpModelProperty *> *aPropertys;

/**
 *  @author swp_song
 *
 *  @brief  swpConfig:  ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpModelConfig
 */
+ (instancetype)swpConfig:(Class)aClass;

/**
 *  @author swp_song
 *
 *  @brief  initWithClass:  ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpModelConfig
 */
- (instancetype)initWithClass:(Class)aClass;

@end
NS_ASSUME_NONNULL_END
