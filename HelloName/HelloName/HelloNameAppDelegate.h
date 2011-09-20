//
//  HelloNameAppDelegate.h
//  HelloName
//
//  Created by Lars Jynnesjö on 2011-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloNameViewController;

@interface HelloNameAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloNameViewController *viewController;

@property (nonatomic, retain) IBOutlet UILabel *myLabel;


@end
