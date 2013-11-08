# ERNewsFeed

ERNewsFeed is a customizable news feed interface for your iOS app. It is meant to be easy to implement with just 2 required protocol methods.

## Installation

* Drag the 'ERNewsFeed/ERNewsFeed' folder into your project.
* Add the **QuartzCore** framework to your project.
* Note: ERNewsFeed uses ARC

## Usage

### Configuring Your ViewController

First, make sure your view controller conforms to the 'ERNewsFeedDelegate' protocol. You may want to make the ERNewsFeed a property of your view controller:

```objective-c
@interface MyViewController : UIViewController <ERNewsFeedDelegate>

@property (nonatomic, retain) ERNewsFeed *newsFeed;
```

Then, you must create the ERNewsFeed object (I recommend in your view controller's viewDidLoad method):

```objective-c
- (void)viewDidLoad {
    // Instantiate the news feed with a frame for its view. Note: do not use the default init method.
    self.newsFeed = [[ERNewsFeed alloc] initWithViewFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    // Set the delegate
    self.newsFeed.delegate = self;
    // Add newsFeed.scrollView to your view controller's view
    [self.view addSubview:self.newsFeed.scrollView];
    // You must call [newsFeed make] after you have set its delegate and added its scrollview
    [self.newsFeed make];
}
```

### Implementing ERNewsFeedDelegate Protocol Methods

Implement the following two protocol methods to draw the ERNewsFeed:

```objective-c
- (int)numberOfPostsInFeed:(ERNewsFeed *)feedView {
    return number_of_posts_in_my_feed;
}
```

This method tells the ERNewsFeed how many posts to draw (like the numberOfRows method for UITableViewDelegate).

```objective-c
- (ERNewsFeedPostView *)feedPostForFeed:(ERNewsFeed *)feed itemNumber:(int)itemNumber {
    
    ERNewsFeedPostViewDefault *post = [[ERNewsFeedPostViewDefault alloc] initWithFeedView:feed];
    
    post.summaryLabel.text = @"Here is what's going on:";
    post.bigSubtitleLabel.text = @"John Smith";
    post.smallSubtitleLabel.text = @"3 hours ago";
    post.thumbnailImageView.image = [UIImage imageNamed:@"my_image.png"];
    post.bodyLabel.text = @"This is a status update! And its shown with ERNewsFeed. Super cool!";
    
    return post;
}
```

This is a simple example of filling in values to show your feed post. First you must create a postView object that is a **subclass** ofERNewsFeedPostView. In the future, different subclasses will draw different styles of posts. Currently, you must use ERNewsFeedPostViewDefault. Notice how values are set directly via the exposed labels that belong to the ERNewsFeedPostViewDefault object (see next section for more info about customization). The above would create a view like the first image above.

## Customization

### Customizing ERNewsFeed As A Whole

ERNewsFeed has several editable properties that dictate how *all* posts are drawn:
* `backgroundColor`: background color of the news feed
* `postBackgroundColor`: default background color of posts
* `defaultFontName`: default font name for post labels (sizes must be changed by label: see next section)

* `sideMargin`: the horizontal space between a post and the feed's frame border
* `verticalMargin`: the vertical space between individual posts
* `postViewWidth`: width of each post view (Changing this changes the `sideMargin` and vice versa)
* `postEdgeMargin` & `postInnerMargin` affect various margins within each post. Experiment with them to see what they do
* `postThumbnailDimension`: height and width of a post's imageView
* `postCornerRadius`: affects how rounded the postViews are

### Customizing ERNewsFeedPostViewDefault

ERNewsFeedPostViewDefault exposes the following UI components:
```objective-c
@property (nonatomic, retain) UILabel *summaryLabel;
@property (nonatomic, retain) UILabel *bigSubtitleLabel;
@property (nonatomic, retain) UILabel *smallSubtitleLabel;
@property (nonatomic, retain) UILabel *bodyLabel;
@property (nonatomic, retain) UIImageView *thumbnailImageView;
@property (nonatomic, retain) UIView *bottomAccessoryView;
```

You can edit these for individual posts when drawing them in the second protocol method (their text, font, fontColor, etc, even frames if you're feeling adventurous). If `summaryLabel` has no text, it will not be drawn and will not take up space. The same applies to `bodyLabel`. `bottomAccessoryView` is nil by default and will only be drawn/take up space if it is set. Here is an example of using it. This would be found in the second ERNewsFeedDelegate protocol method:

```objective-c
UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, feed.postViewWidth, 40)];
v.backgroundColor = [UIColor cyanColor];
post.bottomAccessoryView = v;
```

When creating the view, the origin x,y coordinates can be random- these will be set to the  appropriate values. However, the width *must* be feed.postViewWidth. Heigh can be whatever you want.

## Credits

ERNewsFeed was created by Daniel Ernst. I would love it if anyone wanted to contribute to the project (submitting pull requests, creating new issues, documenting, suggesting features, whatever).

Feel free to use ERNewsFeed in any of your projects. Attribution would be nice, but is not required. Consider letting me know if you're actually using it in a shipping product.
