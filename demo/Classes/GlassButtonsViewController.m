//
//  GlassButtonsViewController.m
//  GlassButtons
//
//  Created by Hwee-Boon Yar on Jul/07/2010.
//  Copyright MotionObj 2010. All rights reserved.
//

#import "GlassButtonsViewController.h"

#import "MOGlassButton.h"

@implementation GlassButtonsViewController

@synthesize button;
@synthesize smallButton;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	// Configure buttons added to XIB
	[self.button setupAsGreenButton];
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


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.button = nil;
	self.smallButton = nil;

    [super dealloc];
}

@end
