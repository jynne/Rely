//
//  HelloWorldAppDelegate.m
//  HelloWorld
//
//  Created by Lars Jynnesjö on 2011-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldAppDelegate.h"

@implementation HelloWorldAppDelegate

@synthesize window = _window;
@synthesize label = _label;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];

    CGRect frame = self.label.frame;
    frame.origin.y = 384.0f;
    
    [UIView beginAnimations:@"yoyo" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationRepeatCount:INFINITY];
    [UIView setAnimationRepeatAutoreverses:YES];
    self.label.frame = frame;
    [UIView commitAnimations];

    /*
    CGRect frame = CGRectMake(0.0f, 0.0f, 320.0f, 96.0f);
    
    //UILabel *myLabel = [UILabel alloc];
    //myLabel = [myLabel initWithFrame:frame];

    UILabel *myLabel = [[UILabel alloc] initWithFrame:frame];

    //[myLabel setText:@"Hello, world!"];
    myLabel.text = @"Hello, world!";
    myLabel.font = [UIFont systemFontOfSize:48.0f];
    myLabel.textAlignment = UITextAlignmentCenter;
    
    frame.origin.y = 384.0f;
    
    [UIView beginAnimations:@"yoyo" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationRepeatCount:INFINITY];
    [UIView setAnimationRepeatAutoreverses:YES];
    myLabel.frame = frame;
    [UIView commitAnimations];
    
    [self.window addSubview:myLabel];

    // Släpp instansräknaren
    [myLabel release];
    */
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_label release];
    [_window release];
    [super dealloc];    
}

@end
