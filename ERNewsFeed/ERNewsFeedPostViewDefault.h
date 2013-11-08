//
//  ERNewsFeedPostViewDefault.h
//  ERNewsFeedDemo
//
//  Created by Daniel Ernst on 11/8/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import "ERNewsFeedPostView.h"

@interface ERNewsFeedPostViewDefault : ERNewsFeedPostView

/* CHANGE VALUES DIRECTLY THROUGH LABEL/IMAGEVIEW
 @property (nonatomic, retain) NSString *summaryText;
 @property (nonatomic, retain) NSString *bigSubtitleText;
 @property (nonatomic, retain) NSString *smallSubtitleText;
 @property (nonatomic, retain) NSString *bodyText;
 @property (nonatomic, retain) UIImage *thumbnailImage;
 */

// UI Components directly exposed so user can manipulate them
@property (nonatomic, retain) UILabel *summaryLabel;
@property (nonatomic, retain) UILabel *bigSubtitleLabel;
@property (nonatomic, retain) UILabel *smallSubtitleLabel;
@property (nonatomic, retain) UILabel *bodyLabel;
@property (nonatomic, retain) UIImageView *thumbnailImageView;
@property (nonatomic, retain) UIView *bottomAccessoryView;

@end
