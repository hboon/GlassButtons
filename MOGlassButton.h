//
//  MOGlassButton.h
//  SimplyTweet
//
//  Created by Hwee-Boon Yar on Jan/31/2010.
//  Copyright 2010 MotionObj. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

#import "MOButton.h"

@interface MOGlassButton : MOButton {
	CAGradientLayer* gradientLayer1;
	CAGradientLayer* gradientLayer2;
	CALayer* outlineLayer;
}

@property(nonatomic,retain) CAGradientLayer* gradientLayer1;
@property(nonatomic,retain) CAGradientLayer* gradientLayer2;
@property(nonatomic,retain) CALayer* outlineLayer;

- (void)setupAsGreenButton;
- (void)setupAsRedButton;
- (void)setupAsSmallGreenButton;
- (void)setupAsSmallRedButton;

@end
