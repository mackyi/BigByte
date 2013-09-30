//
//  SongDisplayViewController.h
//  BigByteTest
//
//  Created by Intern on 9/29/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@class Song;

@interface SongDisplayViewController : UITableViewController

@property (strong, nonatomic) Song *song;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *songPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *togglePlayPause;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *durationOutlet;
@property (weak, nonatomic) IBOutlet UISlider  *sliderOutlet;

@property (strong, nonatomic) AVPlayer *player;
@end
