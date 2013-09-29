//
//  SongDataController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Song;
@class BigByteTestDetailViewController;
@class SearchResult;

@interface SongDataController : NSObject

@property (nonatomic, strong) SearchResult *searchResult;
@property (nonatomic, copy) NSMutableArray *masterSongList;
@property (nonatomic, weak) BigByteTestDetailViewController *collectionViewController;

- (NSUInteger)countOfList;
- (Song *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addSong:(Song *)song;

- (void)search: (NSString *)searchTerm;
- (void)loadImageForSong: (Song *)song;

@end
