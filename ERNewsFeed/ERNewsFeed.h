//
//  ERNewsFeedView.h
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ERNewsFeedDelegate.h"

@interface ERNewsFeed : NSObject

- (id)initWithViewFrame:(CGRect)frame;
- (id)initWithViewFrame:(CGRect)frame delegate:(id<ERNewsFeedDelegate>)delegate;
- (id)initWithDelegate:(id<ERNewsFeedDelegate>)delegate;
- (void)make;

@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) NSMutableArray *feedPostViews;
@property id<ERNewsFeedDelegate> delegate;

@property (nonatomic, retain) UIColor *backgroundColor;
@property int sideMargin;
@property int verticalMargin;
@property int postViewWidth;
@property int postEdgeMargin;
@property int postInnerMargin;
@property int postThumbnailDimension;
@property int postCornerRadius;

@property (nonatomic, retain) NSString *defaultFontName;
@property (nonatomic, retain) UIColor *postBackgroundColor;


@end
