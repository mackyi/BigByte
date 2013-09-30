//
//  SearchResultCell.h
//  CollectionView
//
//  Created by Intern on 9/29/13.
//
//

#import <UIKit/UIKit.h>
#import "Song.h"
@interface SearchResultCell : UICollectionViewCell

@property (strong, nonatomic) Song *song;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *song_name;
@property (strong, nonatomic) IBOutlet UILabel *artist_name;

@end
