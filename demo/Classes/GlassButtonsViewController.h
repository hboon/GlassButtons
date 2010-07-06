//
//  GlassButtonsViewController.h
//  GlassButtons
//
//  Created by Hwee-Boon Yar on Jul/07/2010.
//  Copyright MotionObj 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOGlassButton;

@interface GlassButtonsViewController : UIViewController {
	IBOutlet MOGlassButton* button;
	IBOutlet MOGlassButton* smallButton;
}

@property (nonatomic,retain) IBOutlet UIButton* button;
@property (nonatomic,retain) IBOutlet UIButton* smallButton;

@end

