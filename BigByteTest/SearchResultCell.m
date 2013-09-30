//
//  SearchResultCell.m
//  CollectionView
//
//  Created by Intern on 9/29/13.
//
//

#import "SearchResultCell.h"
#import "CustomCellBackground.h"

@implementation SearchResultCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
    }
    return self;
}

@end
