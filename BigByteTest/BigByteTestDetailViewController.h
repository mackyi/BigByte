//
//  BigByteTestDetailViewController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigByteTestMasterViewController.h"
@class Song;
@class SongDataController;
@class BigByteTestMasterViewController;


@interface BigByteTestDetailViewController : UICollectionViewController <UISplitViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) SongDataController *dataController;
@property (weak, nonatomic) BigByteTestMasterViewController *masterController;
@property (weak, nonatomic) NSString *genreInput;

- (void)search: (NSString *)searchTerm
         genre: (NSString *)genre
  danceability: (double)danceability
        energy: (double) energy;

@end
