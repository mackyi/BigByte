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

@interface BigByteTestMasterViewController : UITableViewController <UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) BigByteTestDetailViewController *detailViewController;
@property (strong, nonatomic) SongDataController *dataController;
@property (strong, nonatomic) IBOutlet UIPickerView *genre;
@property (strong, nonatomic) IBOutlet UIImageView *danceEnergyGrid;
@property (strong, nonatomic) IBOutlet UITextField *ipaddress;
@property (strong, nonatomic) NSArray *genres;
@property (strong, nonatomic) NSArray *genreCodes;

@property (strong, nonatomic) NSString *searchTerm;
@property (strong, nonatomic) NSString *genreTerm;
@property (strong, nonatomic) NSString *ip;
@property (nonatomic) double danceability;
@property (nonatomic) double energy;


- (void)handleTap:(UITapGestureRecognizer *)sender;

@end
