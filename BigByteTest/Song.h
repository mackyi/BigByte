//
//  Song.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic, copy) NSString *song_name;
@property (nonatomic, copy) NSString *album_name;
@property (nonatomic, copy) NSString *artist_name;
@property (nonatomic, copy) NSString *primary_genre_name;
@property (nonatomic, copy) NSString *song_url;
@property (nonatomic, copy) NSString *artist_url;
@property (nonatomic, copy) NSString *album_artwork_url;
@property (nonatomic, copy) NSString *song_preview_url;
@property (nonatomic) NSNumber *song_price;
@property (nonatomic) NSNumber *album_price;
@property (nonatomic) NSNumber *track_length;
@property (nonatomic) NSDate *original_release_date;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, copy) NSString *content_rating;

-(id)initWithSongName:(NSString *)song_name
           album_name:(NSString *)album_name;



@end
