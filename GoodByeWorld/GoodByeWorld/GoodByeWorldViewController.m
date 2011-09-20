//
//  GoodByeWorldViewController.m
//  GoodByeWorld
//
//  Created by Lars Jynnesjö on 2011-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GoodByeWorldViewController.h"

@implementation GoodByeWorldViewController
@synthesize earth;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *animationImages = [NSMutableArray arrayWithCapacity:11];
    
    for (NSInteger i = 0; i < 11; i++) {
        NSString *imageName = [NSString stringWithFormat:@"spinning-earth%04d.png", i+1];
        //NSLog(@"Image name=%@", imageName);
        UIImage *image = [UIImage imageNamed:imageName];
        [animationImages addObject:image];        
    }
    self.earth.animationImages = animationImages;
    self.earth.animationDuration = 2.0f;
    [self.earth startAnimating];
}

- (void)viewDidUnload
{
    [self setEarth:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [earth release];
    [super dealloc];
}
@end
