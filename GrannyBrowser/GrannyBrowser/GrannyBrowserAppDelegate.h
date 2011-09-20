//
//  GrannyBrowserAppDelegate.h
//  GrannyBrowser
//
//  Created by Lars Jynnesjö on 2011-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface GrannyBrowserAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
