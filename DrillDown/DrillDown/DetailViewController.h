//
//  DetailViewController.h
//  DrillDown
//
//  Created by Lars Jynnesjö on 2011-09-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    UIImageView *profileBackgroundImageView;
    UIImageView *profileImageView;
    UILabel *nameLabel;
    UILabel *friendsCountLabel;
    UILabel *followersCountLabel;
    UILabel *screenNameLabel;
    UITextView *descriptionTextView;
    UITextView *textTextView; 
    
    NSDictionary *_tweet;
}

@property (nonatomic, retain) IBOutlet UIImageView *profileBackgroundImageView;
@property (nonatomic, retain) IBOutlet UIImageView *profileImageView;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *friendsCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *followersCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *screenNameLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, retain) IBOutlet UITextView *textTextView;

-(id)initWithTweet:(NSDictionary *)tweet;

@end
