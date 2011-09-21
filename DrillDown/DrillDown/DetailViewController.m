//
//  DetailViewController.m
//  DrillDown
//
//  Created by Lars Jynnesjö on 2011-09-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "GTMHTTPFetcher.h"

@implementation DetailViewController
@synthesize profileBackgroundImageView;
@synthesize profileImageView;
@synthesize nameLabel;
@synthesize friendsCountLabel;
@synthesize followersCountLabel;
@synthesize screenNameLabel;
@synthesize descriptionTextView;
@synthesize textTextView;

-(id)initWithTweet:(NSDictionary *)tweet
{
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    if (self != nil) {
        _tweet = [tweet retain];
        self.title = [tweet valueForKey:@"text"];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [self initWithTweet:nil];
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *name = [_tweet valueForKeyPath:@"user.name"];
    nameLabel.text = name;
    
    NSString *screenName =  [_tweet valueForKeyPath:@"user.screen_name"];
    screenNameLabel.text = screenName;

    NSString *description =  [_tweet valueForKeyPath:@"user.description"];
    
    if ((NSNull *)description == [NSNull null]) {
        description = @"No user description";
    }
    else if ([description isEqualToString:@""]) {
        description = @"No user description";
    }
    descriptionTextView.text = description;

    NSNumber *friendsCount =  [_tweet valueForKeyPath:@"user.friends_count"];
    NSString *friendsCountString = [friendsCount stringValue];
    friendsCountLabel.text = friendsCountString;
    
    NSNumber *followersCount =  [_tweet valueForKeyPath:@"user.followers_count"];
    NSString *followersCountString = [followersCount stringValue];
    followersCountLabel.text = followersCountString;

    NSString *text =  [_tweet valueForKeyPath:@"text"];
    textTextView.text = text;    
    
    NSString *profileImageUrl =  [_tweet valueForKeyPath:@"user.profile_image_url"];
    profileImageUrl = [profileImageUrl stringByReplacingOccurrencesOfString:@"_normal" withString:@"_bigger"];
    UIImage *profileImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:profileImageUrl]]];
    self.profileImageView.image = profileImage;

    NSString *profileBackgroundImageUrl =  [_tweet valueForKeyPath:@"user.profile_background_image_url"];    
    UIImage *profileBackgroundImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:profileBackgroundImageUrl]]];
    self.profileBackgroundImageView.image = profileBackgroundImage;
}

- (void)viewDidUnload
{
    [self setProfileBackgroundImageView:nil];
    [self setProfileImageView:nil];
    [self setNameLabel:nil];
    [self setFriendsCountLabel:nil];
    [self setFollowersCountLabel:nil];
    [self setScreenNameLabel:nil];
    [self setDescriptionTextView:nil];
    [self setTextTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [profileBackgroundImageView release];
    [profileImageView release];
    [nameLabel release];
    [friendsCountLabel release];
    [followersCountLabel release];
    [screenNameLabel release];
    [descriptionTextView release];
    [textTextView release];
    [_tweet release];
    [super dealloc];
}
@end
