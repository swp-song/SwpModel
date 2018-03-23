//
//  SwpClassConfigMeta.h
//  swp_song
//
//  Created by swp_song on 2018/3/21.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpClassBase.h"

@class SwpClassConfig, SwpClassPropertyMeta;

NS_ASSUME_NONNULL_BEGIN
@interface SwpClassConfigMeta : SwpClassBase


/** config meta's aNSType */
@property (nonatomic, assign, readonly) SwpEncodingNSType   aNSType;
/** config meta's classConfig */
@property (nonatomic, strong, readonly) SwpClassConfig  *aClassConfig;
/** config meta's all propertys */
@property (nonatomic, copy, readonly) NSArray<SwpClassPropertyMeta *> *aAllPropertys;
/** config meta's all propertys */
@property (nonatomic, copy, readonly) NSDictionary<NSString *, SwpClassPropertyMeta *> *aPropertyMetas;

/**
 *  @author swp_song
 *
 *  @brief  initClassConfigMeta:    ( 初始化 )
 *
 *  @param  aClss   aClss
 *
 *  @return SwpClassConfigMeta
 */
- (instancetype)initClassConfigMeta:(Class)aClss;

@end
NS_ASSUME_NONNULL_END
