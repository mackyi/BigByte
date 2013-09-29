//
//  BigByteTestDetailViewController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Song;

@interface BigByteTestDetailViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) Song *song;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@end
