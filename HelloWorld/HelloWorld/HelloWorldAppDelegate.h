//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Lars Jynnesjö on 2011-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *_window;
    UILabel *_label;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UILabel *label; 

@end
