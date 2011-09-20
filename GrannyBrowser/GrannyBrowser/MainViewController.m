//
//  MainViewController.m
//  GrannyBrowser
//
//  Created by Lars Jynnesjö on 2011-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize activityMonitor = _activityMonitor;
@synthesize pickerView = _pikerView;
@synthesize webView = _webView;

#pragma mark - Private methods

- (void)displayWelcomeMessage
{
    NSString *welcomeMessage = @"<style>body {font-family:'Helvetica-Neue'; }></style><h1>Hi, Gran!</h1></style><p>Please select a site from below";
    [self.webView loadHTMLString:welcomeMessage baseURL:nil];
}

- (void)displaySiteForRow:(NSInteger)row
{
    // Display site for row
    if (row == 0)
    {
        [self displayWelcomeMessage];        
    }
    else
    {
        NSString *urlString = [_sites objectAtIndex:row * 2 + 1];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    }
}

#pragma mark - Object life cycle methods

- (void)dealloc
{
    [_sites release];
    
    [_webView release];
    [_activityMonitor release];
    [_pikerView release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setActivityMonitor:nil];
    [self setPickerView:nil];
    [super viewDidUnload];
    
    // Samma sak som [self setWebView:nil];
    //self.webView = nil;
    
    //[_webView release];
    //_webView = nil;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Override of the super class initializer
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil)
    {
        // Custom initialization with alloc        
        _sites = [[NSArray alloc] initWithObjects:
                  @"Home", @"",
                  @"Google", @"http://google.com", 
                  @"Blog", @"http://aralbalkan.com",
                  @"Twitter",@"http://twitter.com/aral",
                  @"News", @"http://news.google.com",
                  @"Weather", @"http://news.bbc.co.uk/weather/",
                  nil];

        // Custom initialization with autorelease
        //_sites = [NSArray arrayWithObjects:@"Google", @"Blog", @"Twitter", @"News", @"Weather", nil];
        //[_sites retain];
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSInteger selectedRow = [[NSUserDefaults standardUserDefaults] integerForKey:kSelectedRow];
    
    [self displaySiteForRow:selectedRow];
    [self.pickerView selectRow:selectedRow inComponent:0 animated:NO];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - UIPickerViewDataSource methods

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{
    return 1;    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component 
{
    return [_sites count] / 2;
}

#pragma mark - UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [_sites objectAtIndex:row * 2];
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Saving the current row
    NSUserDefaults *standardUSerDefaults = [NSUserDefaults standardUserDefaults];
    [standardUSerDefaults setInteger:row forKey:kSelectedRow];
    [standardUSerDefaults synchronize];
    
    [self displaySiteForRow:row];
}

# pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self.activityMonitor startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];    
    [self.activityMonitor stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self.activityMonitor stopAnimating];
}

@end


