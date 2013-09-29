//
//  Song.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol Song @end

@interface Song : JSONModel

@property (nonatomic) NSNumber<Optional> *rank;
@property (nonatomic, copy) NSString *song_name;
@property (nonatomic, copy) NSString<Optional> *album_name;
@property (nonatomic, copy) NSString *artist_name;
@property (nonatomic, copy) NSString<Optional> *genre_name;
@property (nonatomic, copy) NSString<Optional> *itunes_page_url;
@property (nonatomic, copy) NSString<Optional> *artist_url;
@property (nonatomic, copy) NSString<Optional> *album_artwork_url;
@property (nonatomic, copy) NSString<Optional> *song_preview_url;
@property (nonatomic) NSNumber<Optional> *song_price;
@property (nonatomic) NSNumber<Optional> *album_price;
@property (nonatomic) NSNumber<Optional> *track_length;
@property (nonatomic) NSDate<Optional> *original_release_date;
@property (nonatomic, strong) NSString<Optional> *url;
@property (nonatomic, copy) NSString<Optional> *content_rating;
@property (nonatomic, strong) UIImage<Ignore> *image;

-(id)initWithSongName:(NSString *)song_name
           artist_name:(NSString *)artist_name;



@end
