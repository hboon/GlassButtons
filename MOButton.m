//
//  MOButton.m
//  Licensed under the terms of the BSD License, as specified below.
//
//  Created by Hwee-Boon Yar on Feb/13/2010.
//
/*
 * Copyright 2010 Yar Hwee Boon. All rights reserved.
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * Neither the name of MotionObj nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "MOButton.h"
#import <QuartzCore/QuartzCore.h>

@interface MOButton ()

-(void)setup;

@end

@implementation MOButton

@synthesize settings;
@synthesize normalBackgroundColor;
@synthesize highlightedBackgroundColor;
@synthesize disabledBackgroundColor;

-(id)initWithFrame:(CGRect)aRect {
	if (self = [super initWithFrame:aRect]) {
		[self setup];
	}
	return self;
}

-(void)awakeFromNib {
	[self setup];
}

-(void)dealloc {
	self.normalBackgroundColor = nil;
	self.highlightedBackgroundColor = nil;
	self.disabledBackgroundColor = nil;
	[super dealloc];
}

-(void)setup {
	// Get global settings
	self.settings = [MOButtonSettings sharedSettings];
	self.backgroundColor = settings.normalBackgroundColour;
	self.highlightedBackgroundColor = settings.highlightedBackgroundColor;
	self.disabledBackgroundColor = settings.disabledBackgroundColor;
	[self setTitleColor:settings.textColor forState:UIControlStateNormal];
	// Have to set up handlers for various touch events. Can't rely on UIButton.highlighted and enabled property because highlighted is still YES when touch up.
	[self addTarget:self action:@selector(buttonUp:event:)forControlEvents:(UIControlEventTouchUpOutside | UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchDragExit)];
	[self addTarget:self action:@selector(buttonDown:event:)forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
}

-(void)setBackgroundColor:(UIColor *)col {
	[self setBackgroundColor:col forState:UIControlStateNormal];
}

-(void)setBackgroundColor:(UIColor *)aColor forState:(UIControlState)aState {
	switch (aState) {
		case UIControlStateNormal:
			self.normalBackgroundColor = aColor;
			if (highlightedBackgroundColor) {
				self.highlightedBackgroundColor = aColor;
			}
			if (disabledBackgroundColor) {
				self.disabledBackgroundColor = aColor;
			}
			if (self.enabled) {
				self.layer.backgroundColor = normalBackgroundColor.CGColor;
			}
			break;

		case UIControlStateHighlighted:
			self.highlightedBackgroundColor = aColor;
			break;

		case UIControlStateDisabled:
			self.disabledBackgroundColor = aColor;
			if (!self.enabled) {
				self.layer.backgroundColor = disabledBackgroundColor.CGColor;
			}
			break;

		default:
			break;
	}
}

-(void)setEnabled:(BOOL)yesOrNo {
	[super setEnabled:yesOrNo];
	self.layer.backgroundColor = yesOrNo ? normalBackgroundColor.CGColor : disabledBackgroundColor.CGColor;
}

#pragma mark Events
-(void)buttonUp:(id)aButton event:(id)event {
	self.layer.backgroundColor = normalBackgroundColor.CGColor;
}

-(void)buttonDown:(id)aButton event:(id)event {
	self.layer.backgroundColor = highlightedBackgroundColor.CGColor;
}

@end

@implementation MOButtonSettings

@synthesize normalBackgroundColour, highlightedBackgroundColor, disabledBackgroundColor, textColor;

+(MOButtonSettings *)sharedSettings {
    static MOButtonSettings *_sharedSettings = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedSettings = [MOButtonSettings new];
		_sharedSettings.normalBackgroundColour = [UIColor whiteColor];
		_sharedSettings.highlightedBackgroundColor = [UIColor blueColor];
		_sharedSettings.disabledBackgroundColor = [UIColor grayColor];
		_sharedSettings.textColor = [UIColor blackColor];
    });
    return _sharedSettings;
}

-(id)copyWithZone:(NSZone *)zone {
	MOButtonSettings *copy = [MOButtonSettings new];
	copy.normalBackgroundColour = self.normalBackgroundColour;
	copy.highlightedBackgroundColor = self.highlightedBackgroundColor;
	copy.disabledBackgroundColor = self.disabledBackgroundColor;
	copy.textColor = self.textColor;
	return copy;
}

-(void)dealloc {
	[normalBackgroundColour release];
	[highlightedBackgroundColor release];
	[disabledBackgroundColor release];
	[textColor release];
	[super dealloc];
}

@end