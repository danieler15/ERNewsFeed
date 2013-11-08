//
//  ERViewController.h
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ERNewsFeed.h"
#import "ERNewsFeedPostView.h"
#import "ERNewsFeedDelegate.h"

@interface ERViewController : UIViewController <ERNewsFeedDelegate>

@property (nonatomic, retain) ERNewsFeed *newsFeed;

@end
