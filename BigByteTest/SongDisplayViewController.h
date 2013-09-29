//
//  SongDisplayViewController.h
//  BigByteTest
//
//  Created by Intern on 9/29/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Song;

@interface SongDisplayViewController : UITableViewController

@property (strong, nonatomic) Song *song;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

@end
