//
//  SearchResult.h
//  BigByteTest
//
//  Created by Intern on 9/29/13.
//  Copyright (c) 2013 Mack Yi. All rights reserved.
//

#import "JSONModel+networking.h"
#import "Song.h"

@interface SearchResult : JSONModel
@property(nonatomic, strong) NSArray<Song>* response;
@end
