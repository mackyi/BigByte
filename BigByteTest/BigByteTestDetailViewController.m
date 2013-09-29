//
//  BigByteTestDetailViewController.m
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import "BigByteTestDetailViewController.h"

#import "Song.h"

#import "SearchResultCell.h"

#import "SongDisplayViewController.h"

@interface BigByteTestDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation BigByteTestDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self setModalViewController:[[SongDisplayViewController alloc]init]];
//   self.modalViewController = (SongDisplayViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
//    self.modalViewController = [[SongDisplayViewController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    SearchResultCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"SearchResultCell" forIndexPath:indexPath];
    
    cell.artist_name.text = @"Miley Cyrus";
    cell.song_name.text = @"Wrecking Ball";
//    // make the cell's title the actual NSIndexPath value
//    cell.label.text = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
//    
//    // load the image for this cell
//    NSString *imageToLoad = [NSString stringWithFormat:@"%d.JPG", indexPath.row];
//    cell.image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Preparing Segue");
    if ([[segue identifier] isEqualToString:@"ShowSongModal"]) {
        SongDisplayViewController *modalViewController = [segue destinationViewController];
        
        modalViewController.song = [[Song alloc] init];
        modalViewController.song.song_name = @"Royals";
        modalViewController.song.artist_name =@"Lorde";
        //[self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

@end
