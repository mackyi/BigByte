//
//  Episode.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Episode : NSObject
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *network;
@property (nonatomic, copy) NSString *season;
@property (nonatomic, copy) NSDate *original_release_date;
@property (nonatomic, copy) NSString *episode_url;
@property (nonatomic, copy) NSString *episode_artwork_url;
@property (nonatomic, copy) NSNumber *sd_price;

@end
