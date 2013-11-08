//
//  ERNewsFeedPost.m
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import "ERNewsFeedPostView.h"
#import <QuartzCore/QuartzCore.h>

#import "ERNewsFeed.h"



#define PLACEHOLDER @"Value Not Set"

@interface ERNewsFeedPostView()


@end

@implementation ERNewsFeedPostView


- (id)initWithFeed:(ERNewsFeed *)feed {
    self = [super init];
    if (self) {
        self.feed = feed;
        [self createView];
    }
    return self;
}

/* Following Methods Must Be Overriden in Subclasses */
/* Assert Failure If Called In Super Class */
- (void)finishEditing {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%@ must be overriden in a subclass -- was called in superclass ERNewsFeedPostView", NSStringFromSelector(_cmd)] userInfo:nil];
}
- (void)createView {
    self.backgroundColor = self.feed.postBackgroundColor;
    
    if ([self.layer respondsToSelector:@selector(cornerRadius)]) {
        self.layer.cornerRadius = self.feed.postCornerRadius;
        self.layer.masksToBounds = YES;
    }
}
- (int)heightInFeed:(ERNewsFeed *)feedView {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%@ must be overriden in a subclass -- was called in superclass ERNewsFeedPostView", NSStringFromSelector(_cmd)] userInfo:nil];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
