//
//  BigByteTestMasterViewController.m
//  BigByteTest
//
//  Created by Intern on 9/28/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import "BigByteTestMasterViewController.h"

#import "BigByteTestDetailViewController.h"
#import "SongDataController.h"
#import "Song.h"
/*
@interface BigByteTestMasterViewController () {
    NSMutableArray *_objects;
}
@end
*/
@implementation BigByteTestMasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
    self.dataController = [[SongDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.genres = @[@"All",
                    @"Alternative",
                    @"Blues",
                    @"Children's music",
                    @"Christian & Gospel",
                    @"Classical",
                    @"Comedy",
                    @"Dance",
                    @"Electronic",
                    @"Hip-hop / Rap",
                    @"Jazz",
                    @"Latino",
                    @"Metal",
                    @"Pop",
                    @"R&B / Soul",
                    @"Reggae",
                    @"Rock",
                    @"Soundtrack",
                    @"World"];
    
    self.genreCodes = @[@"All",
                        @"Alternative",
                        @"Blues",
                        @"Children",
                        @"CG",
                        @"Classical",
                        @"Comedy",
                        @"Dance",
                        @"Electronic",
                        @"HR",
                        @"Jazz",
                        @"Latino",
                        @"Metal",
                        @"Pop",
                        @"RBS",
                        @"Reggae",
                        @"Rock",
                        @"Soundtrack",
                        @"World"];
    _genreTerm = [_genreCodes objectAtIndex:0];
    _danceability = -1;
    _energy = -1;
    _searchTerm = @"";
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (BigByteTestDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    [self.danceEnergyGrid addGestureRecognizer:singleFingerTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MasterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Song *songAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:songAtIndex.song_name];
    [[cell detailTextLabel] setText: songAtIndex.album_name];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Song *song = [self.dataController objectInListAtIndex:indexPath.row];
//    self.detailViewController.song = song;
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
//        BigByteTestDetailViewController *detailViewController = [segue destinationViewController];
//        
//        detailViewController.song = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
//    }
//}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _ip = _ipaddress.text;
    [searchBar resignFirstResponder];
    _searchTerm = [searchBar text];
    NSLog(@"%@", _searchTerm);
    [self.detailViewController search:_searchTerm
                                genre:_genreTerm
                         danceability:_danceability
                               energy:_energy
                                   ip:_ip];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.genres count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 44.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 320.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.genres objectAtIndex: row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _ip = _ipaddress.text;
    _genreTerm = [self.genreCodes objectAtIndex: row];
    [self.detailViewController search:_searchTerm
                                genre:_genreTerm
                         danceability:_danceability
                               energy:_energy
                                   ip:_ip];
}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    NSLog(@"%@", @"Got Tap");
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint location = [sender locationInView:self.danceEnergyGrid];
        int danceHeight = self.danceEnergyGrid.frame.size.height;
        int energyWidth = self.danceEnergyGrid.frame.size.width;
        self.energy = location.x / energyWidth;
        self.danceability = (danceHeight - location.y)/ danceHeight;
        NSLog(@"%0.2f %0.2f", _energy, _danceability);
        _ip = _ipaddress.text;
        [self.detailViewController search:_searchTerm
                                    genre:_genreTerm
                             danceability:_danceability
                                   energy:_energy
                                       ip:_ip];
    }
}

@end
