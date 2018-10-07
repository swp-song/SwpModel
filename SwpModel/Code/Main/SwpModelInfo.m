//
//  SwpModelInfo.m
//  swp_song
//
//  Created by swp_song on 2018/4/8.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpModelInfo.h"

@implementation SwpModelInfo

/**
 *  @author swp_song
 *
 *  @brief  swpModelInfo    ( 获取 SwpModel 版本信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpModelInfo {
    return  [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpModel.bundle/SwpModel" ofType:@"plist"]];
}


/**
 *  @author swp_song
 *
 *  @brief  swpModelVersion ( 获取 SwpModel 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpModelVersion {
    return [self.class swpModelInfo][@"Version"];
}


@end
