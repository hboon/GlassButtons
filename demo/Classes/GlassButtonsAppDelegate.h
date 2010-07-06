//
//  GlassButtonsAppDelegate.h
//  GlassButtons
//
//  Created by Hwee-Boon Yar on Jul/07/2010.
//  Copyright MotionObj 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GlassButtonsViewController;

@interface GlassButtonsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GlassButtonsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GlassButtonsViewController *viewController;

@end

