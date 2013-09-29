//
//  SongDataController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Song;

@interface SongDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterSongList;

- (NSUInteger)countOfList;
- (Song *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addSong:(Song *)song;

- (void)search: (NSString *)searchTerm;

@end
