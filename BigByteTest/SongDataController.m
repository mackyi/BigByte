//
//  SongDataController.m
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import "SongDataController.h"
#import "Song.h"

@interface SongDataController ()
- (void)initializeDefaultDataList;
@end

@implementation SongDataController

- (void)initializeDefaultDataList {
    NSMutableArray *songList = [[NSMutableArray alloc] init];
    self.masterSongList = songList;
    Song *song;
    song = [[Song alloc] initWithSongName:@"Wrecking Ball" album_name:@"Something"];
    [self addSong:song];
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)setMasterSongList:(NSMutableArray *)newList {
    if (_masterSongList != newList) {
        _masterSongList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList {
    return [self.masterSongList count];
}

- (Song *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterSongList objectAtIndex:theIndex];
}

- (void)addSong:(Song *)song {
    [self.masterSongList addObject:song];
}

- (void) search:(NSString *)searchTerm{
    NSLog(@"%@", @"Searching");
    
}


@end
