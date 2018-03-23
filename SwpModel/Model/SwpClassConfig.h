//
//  SwpClassConfig.h
//  swp_song
//
//  Created by swp_song on 2018/3/19.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpClassBase.h"

@class SwpClassProperty;

NS_ASSUME_NONNULL_BEGIN

@interface SwpClassConfig : SwpClassBase


/** class's class */
@property (nonatomic, assign, readonly) Class    aClss;
/** class's aName */
@property (nonatomic, strong, readonly) NSString *aName;
/** class's is meta class */
@property (nonatomic, assign, readonly) BOOL     aIsMeta;
/** class's super class object */
@property (nonatomic, assign, readonly, nullable) Class aSuperClss;
/** class's super class object */
@property (nonatomic, assign, readonly, nullable) Class aMetaClss;
/** class's super class property */
@property (nonatomic, strong, readonly) SwpClassConfig *aSuperClassConfig;
/** class's class properties */
@property (nonatomic, strong, readonly, nullable) NSDictionary<NSString *, SwpClassProperty *> *aPropertys;

/**
 *  @author swp_song
 *
 *  @brief  swpClassConfig: ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfig
 */
+ (instancetype)swpClassConfig:(Class)aClass;

/**
 *  @author swp_song
 *
 *  @brief  initWithClass:  ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfig
 */
- (instancetype)initWithClass:(Class)aClass;

@end
NS_ASSUME_NONNULL_END
