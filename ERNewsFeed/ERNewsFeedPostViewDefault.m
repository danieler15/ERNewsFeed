//
//  ERNewsFeedPostViewDefault.m
//  ERNewsFeedDemo
//
//  Created by Daniel Ernst on 11/8/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import "ERNewsFeedPostViewDefault.h"
#import "ERNewsFeed.h"

@implementation ERNewsFeedPostViewDefault

- (int)heightInFeed:(ERNewsFeed *)feedView {
    int totalHeight = 3.8*feedView.postEdgeMargin + feedView.postThumbnailDimension + self.bottomAccessoryView.bounds.size.height;
    
    
    
    CGSize maxSummarySize = CGSizeMake(feedView.postViewWidth - (2*feedView.postEdgeMargin), 500);
    CGSize calcSummarySize = [self.summaryLabel.text sizeWithFont:[UIFont fontWithName:feedView.defaultFontName size:14.0] constrainedToSize:maxSummarySize lineBreakMode:NSLineBreakByWordWrapping];
    
    totalHeight += calcSummarySize.height;
    
    CGSize maxBodySize = CGSizeMake(feedView.postViewWidth - (2*feedView.postEdgeMargin), 500);
    CGSize calcBodySize = [self.bodyLabel.text sizeWithFont:[UIFont fontWithName:feedView.defaultFontName size:14.0] constrainedToSize:maxBodySize lineBreakMode:NSLineBreakByWordWrapping];
    
    totalHeight += calcBodySize.height;
    
    return totalHeight;
}

- (void)createView {
    
    [super createView];
    
    int thumbnailLength = self.feed.postThumbnailDimension;
    int edgeMargin = self.feed.postEdgeMargin;
    int innerMargin = self.feed.postInnerMargin;
    int summaryHeight = 0;//self.feed.postSummaryHeight;
    
    self.summaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeMargin, edgeMargin, self.feed.postViewWidth - (2*edgeMargin), summaryHeight)];
    self.summaryLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold", self.feed.defaultFontName] size:14.0];
    self.summaryLabel.backgroundColor = [UIColor clearColor];
    self.summaryLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.summaryLabel.numberOfLines = 0;
    
    CGRect userImRect = CGRectMake(edgeMargin, edgeMargin+summaryHeight+innerMargin, thumbnailLength, thumbnailLength);
    self.thumbnailImageView = [[UIImageView alloc] initWithFrame:userImRect];
    
    self.bigSubtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeMargin+thumbnailLength+innerMargin, edgeMargin+summaryHeight+innerMargin+2, self.feed.postViewWidth - (2*edgeMargin) - thumbnailLength - innerMargin, 20)];
    self.bigSubtitleLabel.font = [UIFont fontWithName:self.feed.defaultFontName size:14.0];
    self.bigSubtitleLabel.backgroundColor = [UIColor clearColor];
    
    
    self.smallSubtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeMargin+thumbnailLength+innerMargin, edgeMargin+summaryHeight+innerMargin+(thumbnailLength/2)+4, self.feed.postViewWidth - (2*edgeMargin) - thumbnailLength - innerMargin, 10)];
    
    
    self.smallSubtitleLabel.font = [UIFont fontWithName:self.feed.defaultFontName size:11.0];
    self.smallSubtitleLabel.backgroundColor = [UIColor clearColor];
    
    
    
    self.bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(edgeMargin, 2*edgeMargin +thumbnailLength+summaryHeight+2, self.feed.postViewWidth-2*edgeMargin, 0)];
    self.bodyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.bodyLabel.numberOfLines = 0;
    self.bodyLabel.font = [UIFont fontWithName:self.feed.defaultFontName size:14.0];
    self.bodyLabel.backgroundColor = [UIColor clearColor];
    
    
    
    
    
    
    /*
     if (self.post.imageUrl) {
     self.itemImageView = [[AsyncImageView alloc] initWithFrame:CGRectMake(edgeMargin, self.messageLabel.frame.origin.y + self.messageLabel.bounds.size.height + innerMargin, self.messageLabel.bounds.size.width, self.messageLabel.bounds.size.width)];
     self.itemImageView.imageURL = [NSURL URLWithString:self.post.imageUrl];
     [self addSubview:self.itemImageView];
     }*/
    
    
    [self addSubview:self.summaryLabel];
    [self addSubview:self.bigSubtitleLabel];
    [self addSubview:self.smallSubtitleLabel];
    [self addSubview:self.bodyLabel];
    [self addSubview:self.thumbnailImageView];
    
    
}

- (void)finishEditing {
    CGSize maxBodySize = CGSizeMake(self.feed.postViewWidth-2*self.feed.postEdgeMargin, 500);
    CGSize calcBodySize = [self.bodyLabel.text sizeWithFont:self.bodyLabel.font constrainedToSize:maxBodySize lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect newBodyFrame = self.bodyLabel.frame;
    newBodyFrame.size.height = calcBodySize.height;
    self.bodyLabel.frame = newBodyFrame;
    
    
    CGSize maxSummarySize = CGSizeMake(self.feed.postViewWidth - (2*self.feed.postEdgeMargin), 500);
    CGSize calcSummarySize = [self.summaryLabel.text sizeWithFont:self.summaryLabel.font constrainedToSize:maxSummarySize lineBreakMode:NSLineBreakByWordWrapping];
    
    int summaryHeight = calcSummarySize.height;
    
    CGRect newSumFrame = self.summaryLabel.frame;
    newSumFrame.size.height = summaryHeight;
    self.summaryLabel.frame = newSumFrame;
    
    CGRect newBigSub = self.bigSubtitleLabel.frame;
    newBigSub.origin.y += summaryHeight;
    self.bigSubtitleLabel.frame = newBigSub;
    
    CGRect newSmallSub = self.smallSubtitleLabel.frame;
    newSmallSub.origin.y += summaryHeight;
    self.smallSubtitleLabel.frame = newSmallSub;
    
    CGRect newThumb = self.thumbnailImageView.frame;
    newThumb.origin.y += summaryHeight;
    self.thumbnailImageView.frame = newThumb;
    
    newBodyFrame.origin.y += summaryHeight;
    self.bodyLabel.frame = newBodyFrame;
    
    if (!self.bottomAccessoryView) {
        
    }
    else if (self.bottomAccessoryView.bounds.size.width != self.feed.postViewWidth) {
        NSLog(@"Bottom Accessory View Must Be Same Width As Post Width (ERNewsFeed.postViewWidth) --- Accessory Width: %f, Feed Width: %d", self.bottomAccessoryView.bounds.size.width, self.feed.postViewWidth);
    }
    else {
        int yOrigin = [self heightInFeed:self.feed] - self.bottomAccessoryView.bounds.size.height;
        self.bottomAccessoryView.frame = CGRectMake(0, yOrigin, self.feed.postViewWidth, self.bottomAccessoryView.bounds.size.height);
        [self addSubview:self.bottomAccessoryView];
    }
    
    
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
