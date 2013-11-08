//
//  ERNewsFeedViewDelegate.h
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ERNewsFeedPostView.h"
@class ERNewsFeed;

@protocol ERNewsFeedDelegate <NSObject>

- (int)numberOfPostsInFeed:(ERNewsFeed *)feedView;
- (ERNewsFeedPostView *)feedPostForFeed:(ERNewsFeed *)feedView itemNumber:(int)itemNumber;


@end
