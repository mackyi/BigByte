//
//  BigByteTestMasterViewController.h
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongDataController.h"
@class BigByteTestDetailViewController;

@interface BigByteTestMasterViewController : UITableViewController

@property (strong, nonatomic) BigByteTestDetailViewController *detailViewController;
@property (strong, nonatomic) SongDataController *dataController;

@end
