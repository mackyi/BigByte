//
//  BigByteTestDetailViewController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Song;
@class SongDataController;

@interface BigByteTestDetailViewController : UICollectionViewController <UISplitViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) SongDataController *dataController;

- (void)search: (NSString *)searchTerm;

@end
