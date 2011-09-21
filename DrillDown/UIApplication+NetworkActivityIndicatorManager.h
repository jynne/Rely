//
//  UIApplication+NetworkActivityIndicatorManager.h
//
//  Copyright 2010 Aral balkan. All rights reserved.
//  http://aralbalkan.com
//
//  Released under the open source MIT License.
//  http://www.opensource.org/licenses/mit-license.html
//

#import <Foundation/Foundation.h>


@interface UIApplication(NetworkActivityIndicatorManager) 

+(NSInteger)updateNumberOfActiveDataConnectionsBy:(NSInteger)offset;
+(void)dataOperationStarted;
+(void)dataOperationEnded;
+(void)allDataOperationsEnded;

@end
