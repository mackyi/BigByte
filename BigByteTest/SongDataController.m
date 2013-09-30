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
//    Song *song;
//    for(int i=0; i<1; i++){
//        song = [[Song alloc] initWithSongName:@"Wake Me Up" artist_name:@"Avicii"];
//        song.album_artwork_url = @"http://upload.wikimedia.org/wikipedia/en/d/da/Avicii_Wake_Me_Up_Official_Single_Cover.png";
//        [self addSong: song];
//      //  [self loadImageForSong:song];
//    }
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

//- (void) search:(NSString *)searchTerm{
//    NSLog(@"%@", @"Searching");
//    NSString *url = @"http://10.190.39.143:8888/top-songs";
//    _searchResult = [[SearchResult alloc] initFromURLWithString:url
//                                                 completion:^(JSONModel *model, JSONModelError *err) {
//                                                     
//                                                     //json fetched
//                                                     NSLog(@"response: %@", _searchResult.response);
//                                                     _masterSongList = (NSMutableArray *)_searchResult.response;
//                                                     [self.collectionView reloadData];
//                                                 }];
//}

- (void)loadImageForSong:(Song *)song
{
   // NSUInteger count = 20;
    //NSString *url = @"http://10.190.39.143:8888/top-songs";
//    NSString *url = @"http://www.horntip.com/html/songs_sorted_by_name/with_music/r/the_rugby_song/the_rugby_song.png";
//    NSLog(@"%@", url);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        NSError *error = nil;
//        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]
//                                                  options:0
//                                                    error:&error];
//        UIImage *image = [UIImage imageWithData:imageData];
//        NSLog(@"%@", image);
//        song.image = image;
//    });
}

@end
