//
//  ERNewsFeedView.m
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import "ERNewsFeed.h"
#import "ERNewsFeedPostView.h"
#import "ERNewsFeedPostViewDefault.h"

#define DEFAULT_POST_EDGE_MARGIN 10
#define DEFAULT_POST_INNER_MARGIN 5
#define DEFAULT_SIDE_MARGIN 10
#define DEFAULT_POST_VERTICAL_MARGIN 20
#define DEFAULT_POST_THUMBNAIL_DIMENSION 40
#define DEFAULT_POST_CORNER_RADIUS 3.0


@implementation ERNewsFeed
@synthesize delegate = _delegate;
@synthesize backgroundColor = _backgroundColor;
@synthesize sideMargin = _sideMargin;
@synthesize postViewWidth = _postViewWidth;

- (id)initWithViewFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self initHelper];
    }
    return self;
}

- (id)initWithViewFrame:(CGRect)frame delegate:(id<ERNewsFeedDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self initHelper];
        [self setDelegate:delegate];
        
    }
    return self;
}

- (id)initWithDelegate:(id<ERNewsFeedDelegate>)delegate
{
    self = [super init];
    if (self) {
        [self initHelper];
        [self setDelegate:delegate];
    }
    return self;
}

- (void)initHelper {
    [self initializeDefaults];

}

- (id<ERNewsFeedDelegate>)delegate {
    return _delegate;
}

- (void)setDelegate:(id<ERNewsFeedDelegate>)delegate {
    _delegate = delegate;
    
    
    /* Reload data */
    //[self make];
}

- (void)make {
    [self makeFeedPosts];
    [self createView];
    [self.scrollView setNeedsDisplay];
}

- (void)makeFeedPosts {
    
    int postCount = [self.delegate numberOfPostsInFeed:self];
    self.feedPostViews = [[NSMutableArray alloc] initWithCapacity:postCount];
    
    for (int i = 0; i < postCount; i++) {
        ERNewsFeedPostView *postView = [self.delegate feedPostForFeed:self itemNumber:i];
        [postView finishEditing];
        
        [self.feedPostViews addObject:postView];
        
    }
}

- (void)createView {
    
    int yOrigin = self.verticalMargin;
    
    if (self.scrollView.contentSize.width > 0.0) {
        [self coverView];
    }
    
    for (int i = 0; i < self.feedPostViews.count; i++) {
        ERNewsFeedPostView *postView = [self.feedPostViews objectAtIndex:i];
        
        int postHeight = [postView heightInFeed:self];
        [postView setFrame:CGRectMake(self.sideMargin, yOrigin, self.postViewWidth, postHeight)];

        
        [self.scrollView addSubview:postView];
        
        int yIncrease = postHeight + self.verticalMargin;
        yOrigin += yIncrease;
    }
    
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, yOrigin);
}

- (void)coverView {
    CGRect coverFrame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
    
    UIView *cover = [[UIView alloc] initWithFrame:coverFrame];
    cover.backgroundColor = self.scrollView.backgroundColor;
    [self.scrollView addSubview:cover];
}

- (void)initializeDefaults {
    self.defaultFontName = @"HelveticaNeue";
    self.sideMargin = DEFAULT_SIDE_MARGIN;
    self.verticalMargin = DEFAULT_POST_VERTICAL_MARGIN;
    self.postBackgroundColor = [UIColor lightGrayColor];
    self.postViewWidth = self.scrollView.bounds.size.width - (2*DEFAULT_SIDE_MARGIN);
    self.postEdgeMargin = DEFAULT_POST_EDGE_MARGIN;
    self.postInnerMargin = DEFAULT_POST_INNER_MARGIN;
    self.postThumbnailDimension = DEFAULT_POST_THUMBNAIL_DIMENSION;
    self.postCornerRadius = DEFAULT_POST_CORNER_RADIUS;
    
}

- (int)sideMargin {
    return _sideMargin;
}

- (void)setSideMargin:(int)sideMargin {
    _sideMargin = sideMargin;
    _postViewWidth = self.scrollView.bounds.size.width - (2*sideMargin);
}

- (int)postViewWidth {
    return _postViewWidth;
}

- (void)setPostViewWidth:(int)postViewWidth {
    _postViewWidth = postViewWidth;
    _sideMargin = (self.scrollView.bounds.size.width - postViewWidth) / 2;
}

- (UIColor *)backgroundColor {
    return _backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    self.scrollView.backgroundColor = backgroundColor;
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
