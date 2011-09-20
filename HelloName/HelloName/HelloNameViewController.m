//
//  HelloNameViewController.m
//  HelloName
//
//  Created by Lars Jynnesjö on 2011-09-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelloNameViewController.h"

@implementation HelloNameViewController
@synthesize myTextField = _myTextField;
@synthesize myLabel = _myLabel;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)animateView:(NSInteger)direction {

    CGRect frame = self.view.frame;
    frame.origin.y -= direction * 80.0f;
    
    [UIView beginAnimations:@"move" context:nil];
    self.view.frame = frame;
    [UIView commitAnimations];
}
-(void)keyboardWillShow
{    
    [self animateView:UP];

}

-(void)keyboardWillHide
{    
    [self animateView:DOWN];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObject:self];
    [self setMyTextField:nil];
    [self setMyLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [_myTextField release];
    [_myLabel release];
    [super dealloc];
}

#pragma mark -
#pragma mark Actions

- (IBAction)buttonTap:(UIView *)sender {
    NSLog(@"Hello");
    // Set the salutation
    // TODO
    NSString *salutation;
    if (sender.tag == kHelloButtonTag) {
        salutation = @"Hello";
    }
    else if (sender.tag == kGoodbyeButtonTag) {
        salutation = @"Goddbye";
    }
    else {
        salutation = @"Unknown sender";
    }
        
    
    NSString *name = self.myTextField.text;
    NSString *message = [NSString stringWithFormat:@"%@, %@", salutation, name];
    
    self.myLabel.text = message;
    self.myTextField.resignFirstResponder;
}

@end
