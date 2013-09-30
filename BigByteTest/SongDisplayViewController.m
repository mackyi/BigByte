//
//  SongDisplayViewController.m
//  BigByteTest
//
//  Created by Intern on 9/29/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import "SongDisplayViewController.h"
#import "Song.h"
@interface SongDisplayViewController ()
- (void)configureView;
@end

@implementation SongDisplayViewController
- (void)setSong:(Song *) newSong
{
    if (_song!= newSong) {
        _song = newSong;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    NSLog(@"%@", @"Configuring View");
    // Update the user interface for the detail item.
    Song *theSong = self.song;
    NSLog(@"%@", theSong);
    if (theSong) {
        NSLog(@"Yes song");
        _songNameLabel.text = theSong.song_name;
        _artistNameLabel.text = theSong.artist_name;
        _albumNameLabel.text = theSong.album_name;
        _albumPriceLabel.text = [theSong.album_price stringValue];
        _songPriceLabel.text = [theSong.song_price stringValue];
        _genreNameLabel.text = theSong.genre_name;
        _image.image = theSong.image;
//        NSURL *url = [NSURL URLWithString: @"http://a499.phobos.apple.com/us/r1000/026/Music6/v4/ee/1c/8e/ee1c8eea-cbfc-2984-db5e-5c4f2cf7c8c0/mzaf_3865492851037958779.plus.aac.p.m4a"];
        NSURL *url = [NSURL URLWithString:theSong.song_preview_url];
        NSError *error =  nil;
        self.player = [[AVPlayer alloc] initWithURL:url];
        if(!self.player){
            NSLog(@"Error creating Player: %@", error);
        }
        self.songName.text = theSong.song_name;
  //      [self.sliderOutlet setMaximumValue:self.player.currentItem.duration.value];
        [self.sliderOutlet setMaximumValue:140];
        
        [self configurePlayer];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}

- (IBAction)dismissView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) playSong: (id) sender
{
    if(self.togglePlayPause.selected) {
        [self.player pause];
        [self.togglePlayPause setSelected:NO];
    } else {
        [self.player play];
        [self.togglePlayPause setSelected:YES];
    }
 //   NSURL *url = [NSURL URLWithString:_song.song_preview_url];
}

-(void) configurePlayer {
    //7
    __block SongDisplayViewController * weakSelf = self;
    //8
    [self.player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1)
                                                   queue:NULL
                                              usingBlock:^(CMTime time) {
                                                  if(!time.value) {
                                                      return;
                                                  }
                                                  
                                                  int currentTime = (int)((weakSelf.player.currentTime.value)/weakSelf.player.currentTime.timescale);
                                                  int currentMins = (int)(currentTime/60);
                                                  int currentSec  = (int)(currentTime%60);
                                                  
                                                  NSString * durationLabel =
                                                  [NSString stringWithFormat:@"%02d:%02d",currentMins,currentSec];
                                                  weakSelf.durationOutlet.text = durationLabel;
                                                  weakSelf.sliderOutlet.value = currentTime;
                                              }];
    
}

@end
