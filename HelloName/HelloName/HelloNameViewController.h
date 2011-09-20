//
//  HelloNameViewController.h
//  HelloName
//
//  Created by Lars Jynnesjö on 2011-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHelloButtonTag     100
#define kGoodbyeButtonTag   101
#define UP                  1
#define DOWN                -1

@interface HelloNameViewController : UIViewController {
    UITextField *_myTextField;
    UILabel *_myLabel;
}

@property (nonatomic, retain) IBOutlet UITextField *myTextField;
@property (nonatomic, retain) IBOutlet UILabel *myLabel;
- (IBAction)buttonTap:(UIView *)sender;

@end
