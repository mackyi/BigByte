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

#import "SongDataController.h"

#import "SearchResult.h"

@interface BigByteTestDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation BigByteTestDetailViewController

#pragma mark - Managing the detail item

- (void)awakeFromNib
{
    NSLog(@"detail view awake from nib");
    self.clearsSelectionOnViewWillAppear = YES;
    [super awakeFromNib];
    self.dataController = [[SongDataController alloc] init];
    self.dataController.collectionViewController = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    return [self.dataController countOfList];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"SearchResultCell";
    SearchResultCell *cell = [cv dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Song *songAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    cell.song = songAtIndex;
    cell.artist_name.text = songAtIndex.artist_name;
    cell.song_name.text = songAtIndex.song_name;
    
    NSString *url = songAtIndex.album_artwork_url;
    NSError *error = nil;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]
                                              options:0
                                                error:&error];
    songAtIndex.image= [UIImage imageWithData:imageData];
    cell.image.image = songAtIndex.image;
    return cell;
}

- (void) search:(NSString *)searchTerm
          genre:(NSString *)genre
   danceability:(double)danceability
          energy:(double)energy
             ip: (NSString *) ip{
    [self.spinner startAnimating];
    NSLog(@"%@", @"Searching");
    NSString *ipAddress=@"10.190.54.255:8888/";
    int count=20;
    NSString *url = [[NSString alloc] initWithFormat:@"http://%@songs?dance=%0.2f&energy=%0.2f&genre=%@&count=%d&searchTerm=%@", ip, danceability, energy, genre, count, searchTerm];
    if(danceability < 0){
        url = [[NSString alloc] initWithFormat:@"http://%@songs?genre=%@&count=%d&searchTerm=%@", ipAddress, genre, count, searchTerm];
    }
    NSLog(@"%@", url);
    self.dataController.searchResult = [[SearchResult alloc] initFromURLWithString:url
                                                     completion:^(JSONModel *model, JSONModelError *err) {
                                                         
                                                         //json fetched
                                                         //NSLog(@"response: %@", self.dataController.searchResult.response);
                                                         self.dataController.masterSongList = (NSMutableArray *)self.dataController.searchResult.response;
                                                         [self.collectionView reloadData];
                                                         [self.spinner stopAnimating];
                                                     }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Preparing Segue");
  //  [self.collectionView reloadData];
    if ([[segue identifier] isEqualToString:@"ShowSongModal"]) {
        SongDisplayViewController *modalViewController = [segue destinationViewController];
        
        modalViewController.song = ((SearchResultCell *) sender).song;
        //[self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

@end
