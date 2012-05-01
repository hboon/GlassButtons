//
//  GlassButtonsViewController.m
//  GlassButtons
//  Licensed under the terms of the BSD License, as specified below.
//
//  Created by Hwee-Boon Yar on Jul/07/2010.
//
/*
 Copyright 2010 Yar Hwee Boon. All rights reserved.
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of MotionObj nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#import "GlassButtonsViewController.h"

#import "MOGlassButton.h"

@implementation GlassButtonsViewController

@synthesize button;
@synthesize smallButton;

- (void)viewDidLoad {
    [super viewDidLoad];

	// Configure buttons added to XIB
	[self.smallButton setupAsSmallGreenButton];

	// Create and configure button programmatically
	MOGlassButton* redButton = [[MOGlassButton alloc] initWithFrame:CGRectMake(10, 200, 300, 44)];
	[redButton setupAsRedButton];
	[redButton setTitle:@"Red Button Programmatically" forState:UIControlStateNormal];
	MOGlassButton* smallRedButton = [[MOGlassButton alloc] initWithFrame:CGRectMake(110, 260, 100, 23)];
	[smallRedButton setupAsSmallRedButton];
	[smallRedButton setTitle:@"Smaller" forState:UIControlStateNormal];
	[self.view addSubview:[redButton autorelease]];
	[self.view addSubview:[smallRedButton autorelease]];
}


- (void)dealloc {
	self.button = nil;
	self.smallButton = nil;

    [super dealloc];
}

@end
