//
//  ERViewController.m
//  ERNewsFeedViewDemo
//
//  Created by Daniel Ernst on 11/6/13.
//  Copyright (c) 2013 Daniel Ernst. All rights reserved.
//

#import "ERViewController.h"
#import "ERNewsFeedPostView.h"
#import "ERNewsFeedPostViewDefault.h"
#import "ERNewsFeed.h"

@interface ERViewController ()

@end

@implementation ERViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.newsFeed = [[ERNewsFeed alloc] initWithViewFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.newsFeed.delegate = self;
    self.newsFeed.backgroundColor = [UIColor lightGrayColor];
    self.newsFeed.postBackgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.newsFeed.scrollView];

    
    [self.newsFeed make];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)numberOfPostsInFeed:(ERNewsFeed *)feedView {
    return 3;
}

- (ERNewsFeedPostView *)feedPostForFeed:(ERNewsFeed *)feed itemNumber:(int)itemNumber {
    
    ERNewsFeedPostViewDefault *post = [[ERNewsFeedPostViewDefault alloc] initWithFeedView:feed];
    
    if (itemNumber == 0) {
        post.bigSubtitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        post.smallSubtitleLabel.textColor = [UIColor lightGrayColor];
        post.bigSubtitleLabel.text = @"John Smith";
        post.smallSubtitleLabel.text = @"3 hours ago";
        post.thumbnailImageView.image = [UIImage imageNamed:@"test"];
        post.bodyLabel.text = @"This is a status update! And its shown with ERNewsFeed. Super cool!";
        
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, feed.postViewWidth, 40)];
        v.backgroundColor = [UIColor cyanColor];
        post.bottomAccessoryView = v;
    }
    else if (itemNumber == 1) {
        post.summaryLabel.text = @"Nibh Tristique Adipiscing Etiam Justo";
        post.bigSubtitleLabel.text = @"Mollis Elit Condimentum";
        post.smallSubtitleLabel.text = @"Ligula Cras Tortor Ridiculus";
        post.thumbnailImageView.image = [UIImage imageNamed:@"test"];
        post.bodyLabel.text = @"Cras mattis consectetur purus sit amet fermentum. Etiam porta sem malesuada magna mollis euismod. Maecenas sed diam eget risus varius blandit sit amet non magna. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.";
    }
    else {
        post.summaryLabel.text = @"Vestibulum id ligula porta felis euismod semper.";
        post.bigSubtitleLabel.text = @"Mollis Elit Condimentum";
        post.smallSubtitleLabel.text = @"Cum sociis natoque penatibus et magnis dis.";
        post.thumbnailImageView.image = [UIImage imageNamed:@"test"];
        post.bodyLabel.text = @"Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.";
    }
    
    return post;
}



@end
