//
//  SwpModelConfigMeta.h
//  swp_song
//
//  Created by swp-song on 2018/3/21.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpModelBase.h"

@class SwpModelConfig, SwpModelPropertyMeta;

NS_ASSUME_NONNULL_BEGIN
@interface SwpModelConfigMeta : SwpModelBase

/** config meta's aNSType */
@property (nonatomic, assign, readonly) SwpEncodingNSType aNSType;
/** config meta's classConfig */
@property (nonatomic, strong, readonly) SwpModelConfig  *aConfig;
/** config meta's all propertys */
@property (nonatomic, copy, readonly) NSArray<SwpModelPropertyMeta *> *aAllPropertys;
/** config meta's all propertys */
@property (nonatomic, copy, readonly) NSDictionary<NSString *, SwpModelPropertyMeta *> *aPropertyMetas;

/**
 *  @author swp_song
 *
 *  @brief  initConfigMeta: ( 初始化 )
 *
 *  @param  aClass  aClass
 *
 *  @return SwpClassConfigMeta
 */
- (instancetype)initConfigMeta:(Class)aClass;

@end
NS_ASSUME_NONNULL_END
