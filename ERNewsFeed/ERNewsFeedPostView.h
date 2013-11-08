//
//  ERNewsFeedPost.h
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ERNewsFeed;

@interface ERNewsFeedPostView : UIView

@property (nonatomic, retain) ERNewsFeed *feed;




- (id)initWithFeed:(ERNewsFeed *)feed;

- (int)heightInFeed:(ERNewsFeed *)feedView;
- (void)finishEditing;
- (void)createView;


@end
