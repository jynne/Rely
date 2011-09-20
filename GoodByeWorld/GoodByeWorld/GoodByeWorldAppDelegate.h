//
//  GoodByeWorldAppDelegate.h
//  GoodByeWorld
//
//  Created by Lars Jynnesjö on 2011-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodByeWorldViewController;

@interface GoodByeWorldAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet GoodByeWorldViewController *viewController;

@end
