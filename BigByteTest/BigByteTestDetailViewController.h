//
//  BigByteTestDetailViewController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Song;
@class SongDisplayViewController;
@interface BigByteTestDetailViewController : UICollectionViewController <UISplitViewControllerDelegate>
@property (strong, nonatomic) SongDisplayViewController *modalViewController;

@end
