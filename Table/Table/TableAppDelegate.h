//
//  TableAppDelegate.h
//  Table
//
//  Created by Lars Jynnesjö on 2011-09-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewController;

@interface TableAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TableViewController *viewController;

@end
