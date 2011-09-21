//
//  UIApplication+NetworkActivityIndicatorManager.m
//
//  Copyright 2010 Aral balkan. All rights reserved.
//  http://aralbalkan.com
//
//  Released under the open source MIT License.
//  http://www.opensource.org/licenses/mit-license.html
//

#import "UIApplication+NetworkActivityIndicatorManager.h"

@implementation UIApplication(NetworkActivityIndicatorManager)

#pragma mark -
#pragma mark Public methods

+(NSInteger)updateNumberOfActiveDataConnectionsBy:(NSInteger)offset
{
	static NSInteger numberOfActiveDataConnections = 0;
	
	numberOfActiveDataConnections += offset;
	
	[[self sharedApplication] setNetworkActivityIndicatorVisible: (numberOfActiveDataConnections > 0)];
	
	return numberOfActiveDataConnections;
}

+(void)dataOperationStarted
{
	[self updateNumberOfActiveDataConnectionsBy:1];
}

+(void)dataOperationEnded
{
	[self updateNumberOfActiveDataConnectionsBy:-1];
}

+(void)allDataOperationsEnded
{
	[self updateNumberOfActiveDataConnectionsBy:-1*[self updateNumberOfActiveDataConnectionsBy:0]];
}


@end
