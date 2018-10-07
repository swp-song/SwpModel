//
//  NSObject+SwpCoding.h
//  swp_song
//
//  Created by swp-song on 2018/3/23.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSObject (SwpCoding)

/**
 *  @author swp_song
 *
 *  @brief  swpEncodeCoder: ( Encode Code )
 *
 *  @param  aCoder  aCoder
 */
- (void)swpEncodeCoder:(NSCoder *)aCoder;

/**
 *  @author swp_song
 *
 *  @brief  swpDecoderCoder:    ( Decoder Code )
 *
 *  @param  aDecoder    aDecoder
 *
 *  @return id
 */
- (id)swpDecoderCoder:(NSCoder *)aDecoder;

/**
 *  @author swp_song
 *
 *  @brief  swpUnArchive    ( SwpCoding 归档 / 解当 )
 *
 *  @return id
 */
- (id)swpUnArchive;

@end
NS_ASSUME_NONNULL_END
