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

@end
