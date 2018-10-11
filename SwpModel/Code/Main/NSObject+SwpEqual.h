//
//  NSObject+SwpEqual.h
//  swp_song
//
//  Created by swp-song on 2018/10/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSObject (SwpEqual)

/**
 *  @author swp_song
 *
 *  @brief  swpEqual ( equal )
 *
 *  @return id
 */
- (BOOL)swpEqual:(NSObject *)model;

@end
NS_ASSUME_NONNULL_END
