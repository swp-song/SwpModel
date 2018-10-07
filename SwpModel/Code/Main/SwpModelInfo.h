//
//  SwpModelInfo.h
//  swp_song
//
//  Created by swp-song on 2018/4/8.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpModelInfo : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpModelInfo    ( 获取 SwpModel 版本信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpModelInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpModelVersion ( 获取 SwpModel 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpModelVersion;

@end
NS_ASSUME_NONNULL_END
