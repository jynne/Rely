//
//  GoodByeWorldViewController.h
//  GoodByeWorld
//
//  Created by Lars Jynnesjö on 2011-09-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodByeWorldViewController : UIViewController {
    UIImageView *earth;
    UIImageView *galaxy;
}

@property (nonatomic, retain) IBOutlet UIImageView *earth;
@property (nonatomic, retain) IBOutlet UIImageView *galaxy;

@end
