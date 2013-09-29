//
//  App.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *developer_name;
@property (nonatomic, copy) NSString *seller_name;
@property (nonatomic, copy) NSString *primary_genre_name;
@property (nonatomic, copy) NSString *application_url;
@property (nonatomic, copy) NSString *icon_url_large;
@property (nonatomic, copy) NSString *icon_url_small;
@property (nonatomic, copy) NSString *first_screenshot_url;
@property (nonatomic, copy) NSString *content_rating;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *supported_devices;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSDate *itunes_release_date;
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSNumber *download_size;
@property (nonatomic, copy) NSString *first_ipad_screenshot_url;

@end
