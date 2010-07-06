//
//  MOGlassButton.m
//  SimplyTweet
//
//  Created by Hwee-Boon Yar on Jan/31/2010.
//  Copyright 2010 MotionObj. All rights reserved.
//

#import "MOGlassButton.h"

#import "Global.h"

@implementation MOGlassButton

@synthesize gradientLayer1;
@synthesize gradientLayer2;
@synthesize outlineLayer;


- (void)setupLayers {
	self.layer.cornerRadius = 8.0f;
	self.layer.masksToBounds = YES;
	self.layer.borderColor = [MO_RGBCOLOR(100, 103, 107) CGColor];
	self.layer.borderWidth = 1.0f;

	self.gradientLayer1 = [[[CAGradientLayer alloc] init] autorelease];
	gradientLayer1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2);
	gradientLayer1.colors = [NSArray arrayWithObjects:(id)[MO_RGBACOLOR(255, 255, 255, 0.45) CGColor], (id)[MO_RGBACOLOR(255, 235, 255, 0.1) CGColor], nil];
	[self.layer insertSublayer:gradientLayer1 atIndex:0];

	self.gradientLayer2 = [[[CAGradientLayer alloc] init] autorelease];
	gradientLayer2.frame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2);
	gradientLayer2.colors = [NSArray arrayWithObjects:(id)[MO_RGBACOLOR(205, 205, 205, 0) CGColor], (id)[MO_RGBACOLOR(235, 215, 215, 0.2) CGColor], nil];

	self.outlineLayer = [[[CALayer alloc] init] autorelease];
	outlineLayer.frame = CGRectMake(0, 1, self.frame.size.width, self.frame.size.height);
	outlineLayer.borderColor = [MO_RGBCOLOR(255, 255, 255) CGColor];
	outlineLayer.borderWidth = 1.0f;
	outlineLayer.borderWidth = 1.0f;
	outlineLayer.opacity = 0.2;
}


- (id)initWithFrame:(CGRect)aRect {
	if (self = [super initWithFrame:aRect]) {
		[self setupLayers];
	}

	return self;
}


- (void)awakeFromNib {
	[super awakeFromNib];
	[self setupLayers];
}


- (void)dealloc {
	self.gradientLayer1 = nil;
	self.gradientLayer2 = nil;
	self.outlineLayer = nil;

	[super dealloc];
}


- (void)layoutSubviews {
	[super layoutSubviews];

	gradientLayer1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2);
	gradientLayer2.frame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2);
	outlineLayer.frame = CGRectMake(0, 1, self.frame.size.width, self.frame.size.height);
}

#pragma mark Default Button Background Colors

- (void)setupForStandardButtons {
	[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self setTitleColor:MO_RGBCOLOR(205, 212, 220) forState:UIControlStateDisabled];
	self.titleLabel.shadowOffset = CGSizeMake(0, -1);
	self.titleLabel.shadowColor = MO_RGBCOLOR(192, 73, 84);
	self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
}


- (void)setupAsGreenButton {
	[self setBackgroundColor:MO_RGBCOLOR(24, 157, 22) forState:UIControlStateNormal];
	[self setBackgroundColor:MO_RGBCOLOR(9, 54, 14) forState:UIControlStateHighlighted];
	[self setBackgroundColor:MO_RGBCOLOR(24, 157, 22) forState:UIControlStateDisabled];
	[self setupForStandardButtons];
}


- (void)setupAsRedButton {
	[self setBackgroundColor:MO_RGBCOLOR(160, 1, 20) forState:UIControlStateNormal];
	[self setBackgroundColor:MO_RGBCOLOR(120, 0, 0) forState:UIControlStateHighlighted];
	[self setBackgroundColor:MO_RGBCOLOR(160, 1, 20) forState:UIControlStateDisabled];
	[self setupForStandardButtons];
}


- (void)setupAsSmallGreenButton {
	[self setupAsGreenButton];
	self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
	self.layer.cornerRadius = 4.0f;
}


- (void)setupAsSmallRedButton {
	[self setupAsRedButton];
	self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
	self.layer.cornerRadius = 4.0f;
}

@end
