//
//  Song.m
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import "Song.h"

@implementation Song

-(id) initWithSongName:(NSString *)song_name album_name:(NSString *) album_name
{
    self = [super init];
    if (self) {
        _song_name = song_name;
        _album_name = album_name;
        return self;
    }
    return nil;
}
@end
