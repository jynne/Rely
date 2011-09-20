//
//  MainViewController.h
//  GrannyBrowser
//
//  Created by Lars Jynnesjö on 2011-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

#define kSelectedRow    @"selectedRow"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIWebViewDelegate> {
    // ivar declaration
    NSArray *_sites;
    UIWebView *_webView;
    UIActivityIndicatorView *_activityMonitor;
    UIPickerView *_pikerView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (IBAction)showInfo:(id)sender;

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityMonitor;

@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;

@end
